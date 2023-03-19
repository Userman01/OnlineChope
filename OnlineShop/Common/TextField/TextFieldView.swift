//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit
import SnapKit

protocol TextFieldViewProtocol {
    /// Вызывается при редактировании поля
    var didEditText: ((String) -> Void)? { get set }
    /// Вызывается при заполнении поля
    var didFillText: ((String) -> Void)? { get set }
    /// Вызывается при очистке поля
    var didCleanText: (() -> Void)? { get set }
}

class TextFieldView: UIView, TextFieldViewProtocol {
    private enum ViewMetrics {
        static let emptyColor: UIColor! = .dynamic(light: R.color.gray(), dark: R.color.blue())
        static let textFieldColor: UIColor! = .dynamic(light: R.color.gray(), dark: R.color.white())
        static let hintColor: UIColor! = .dynamic(light: R.color.red(), dark: R.color.red())
        static let labelColor: UIColor! = .dynamic(light: R.color.gray(), dark: R.color.gray())
        static let textFieldHeight: CGFloat = 30.0
        static let lineHeight: CGFloat = 1.0
    }
    
    private enum TextFieldState {
        case empty
        case focus
        case fill
        case error(String)
    }
    
    enum HintLabelState {
        case error(String)
        case hidden
    }
    
    private var state: TextFieldState = .empty {
        didSet(previosState) {
            switch (previosState, state) {
            case (_, .focus):
                animateToFocusState()
                setHintLabelState(.hidden)
            case(.focus, .empty):
                animateToEmptyState()
                setHintLabelState(.hidden)
            case let (_, .error(text)):
                setHintLabelState(.error(text))
            case (.error, .empty):
                animateToEmptyState()
                setHintLabelState(.hidden)
            case (_, .fill):
                animateToFillState()
                setHintLabelState(.hidden)
            default:
                break
            }
        }
    }
    private var validator: ValidatorProtocol?
    private var formatter: Formatter?
    private var autocapitalizationType: UITextAutocapitalizationType
    
    // Вызывается при редактировании поля
    var didEditText: ((String) -> Void)?
    // Вызывается при заполнении поля
    var didFillText: ((String) -> Void)?
    // Вызывается при очистке поля
    var didCleanText: (() -> Void)?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = ViewMetrics.labelColor
        label.font = .font16Regular
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = ViewMetrics.textFieldColor
        textField.font = .font16Regular
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd(_:)), for: .editingDidEnd)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var lineView: UIView = {
       let view = UIView()
        view.backgroundColor = ViewMetrics.emptyColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var hintLabel: InsetLabel = {
        let label = InsetLabel()
        label.font = .font14Regular
        label.textColor = ViewMetrics.hintColor
        label.numberOfLines = 0
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(label: String? = nil,
         margins: UIEdgeInsets = .zero,
         keyboardType: UIKeyboardType = .default,
         textContentType: UITextContentType? = nil,
         formatter: Formatter? = nil,
         autocapitalizationType: UITextAutocapitalizationType = .none,
         validator: ValidatorProtocol? = nil) {
        self.autocapitalizationType = autocapitalizationType
        super.init(frame: .zero)
        self.layoutMargins = margins
        self.textField.keyboardType = keyboardType
        self.textField.textContentType = textContentType
        self.formatter = formatter
        self.validator = validator
        self.label.text = label
        self.textField.delegate = self
        setupLayout()
        addTapGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(label)
        addSubview(textField)
        addSubview(lineView)
        addSubview(hintLabel)
        
        preservesSuperviewLayoutMargins = false

        label.snp.makeConstraints { make in
            make.center.equalTo(textField.snp.center)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(ViewMetrics.textFieldHeight)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(CGFloat.spacing4Pt)
            make.left.equalTo(textField.snp.left)
            make.right.equalTo(textField.snp.right)
            make.height.equalTo(ViewMetrics.lineHeight)
        }
        hintLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(CGFloat.spacing2Pt)
            make.left.equalTo(textField.snp.left)
            make.right.equalTo(textField.snp.right)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func addTapGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        addGestureRecognizer(recognizer)
    }
    
    @objc private func tapAction(_ sender: UITapGestureRecognizer) {
        textField.becomeFirstResponder()
    }
    
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        let text = getText()
        didEditText?(text)
        validate()
    }
    
    @objc func getText() -> String {
        textField.text ?? ""
    }
    
    @objc func textFieldEditingDidBegin(_ textField: UITextField) {
        if case .error = state { return }
        state = .focus
    }
    
    @objc func textFieldEditingDidEnd(_ textField: UITextField) {
        if let text = textField.text, text.isEmpty {
            state = .empty
        } else {
            if case .error = state { return }
            state = .fill
        }
    }
    
    @objc private func validate() {
        guard let textValidator = validator else { return }
        guard textField.text?.isEmpty == false else { return }
        do {
            state = .focus
            _ = try validatedText(validator: textValidator)
        } catch let error {
            state = .error((error as? ValidatorError)?.message ?? "")
        }
    }
    
    private func animateToFocusState() {
        label.isHidden = true
    }
    
    private func animateToEmptyState() {
        label.isHidden = false
    }
    
    private func animateToFillState() {
        
    }
    
    private func setHintLabelState(_ state: HintLabelState) {
        switch state {
        case let .error(message):
            DispatchQueue.main.async {
                self.hintLabel.text = message
            }
            hintLabel.textColor = ViewMetrics.hintColor
            hintLabel.isHidden = false
        case .hidden:
            hintLabel.isHidden = true
        }
    }
}

// MARK: - UITextFieldDelegate
extension TextFieldView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        guard formatter != nil else { return true }
        if let formatterText = formatter?.editingString(for: text) {
            textField.text = formatterText
            textFieldEditingChanged(textField)
        }
        return false
    }
}

extension TextFieldView {
    func validatedText(validator: ValidatorProtocol) throws -> String {
        return try validator.validated(self.getText())
    }
}

extension TextFieldView {
    func set(keyboardType: UIKeyboardType) {
        self.textField.keyboardType = keyboardType
    }
    
    func set(textContentType: UITextContentType) {
        self.textField.textContentType = textContentType
    }
    
    func set(formatter: Formatter) {
        self.formatter = formatter
    }
    
    func set(textAlignment: NSTextAlignment) {
        self.textField.textAlignment = textAlignment
    }
}
