//
//  SceneDelegate.swift
//  OnlineShop
//
//  Created by Петр Постников on 12.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private var applicationCoordinator: CoordinatorProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        applicationCoordinator = makeCoordinator(windowScene)
        applicationCoordinator?.start()
    }
}

extension SceneDelegate {
    
    private func makeCoordinator(_ windowScene: UIWindowScene) -> CoordinatorProtocol {
        window = UIWindow(windowScene: windowScene)
        let rootViewController = UINavigationController()
        let router = Router(rootController: rootViewController)
        let coordinatorFactory = CoordinatorFactory()
        let coordinator = coordinatorFactory.makeApplicationCoordinator(router: router)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return coordinator
    }
}
