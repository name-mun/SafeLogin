//
//  SceneDelegate.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController(rootViewController: StartViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
    }


}

