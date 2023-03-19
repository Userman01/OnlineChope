//
//  SignIn module
//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit

protocol SignInDisplayLogic: AnyObject {

    // Отображение полей
    func displayFields(viewModel: SignIn.GetFields.ViewModel)
}

protocol SignInViewControllerDelegate: AnyObject {

}

final class SignInViewController: UIViewController {

    private let interactor: SignInBusinessLogic
    private let tableDataSource = SignInTableDataSource()
    private let tableDelegate = SignInTableDelegate()

    private lazy var customView = view as? SignInView

    init(interactor: SignInBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        tableDataSource.delegate = self
        tableDelegate.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = SignInView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getFields()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle(.clear)
    }

    // MARK: Получение полей
    private func getFields() {
        interactor.getFields(request: SignIn.GetFields.Request())
    }
}

extension SignInViewController: SignInDisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: SignIn.GetFields.ViewModel) {
        tableDataSource.representableViewModel = viewModel.result
        tableDelegate.representableViewModel = viewModel.result
        customView?.updateTableView(dataSource: tableDataSource, delegate: tableDelegate)
    }
}

extension SignInViewController: SignInViewControllerDelegate {

}
