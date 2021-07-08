//
//  SceneDelegate.swift
//  Punk
//
//  Created by Дмитрий Константинов on 06.07.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navCon = UINavigationController()
        let builder = Builder()
        let router = Router(navController: navCon, builder: builder)
        router.initViewController()
        navCon.navigationBar.prefersLargeTitles = true
        navCon.navigationBar.topItem?.title = "ya punk"
        window.rootViewController = navCon
        self.window = window
        window.makeKeyAndVisible()
    }
}

