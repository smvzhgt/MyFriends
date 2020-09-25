//
//  SceneDelegate.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Public Properties
    var window: UIWindow?


    // MARK: UISceneSession Lifecycle
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Set root view controller
        setRootController(windowScene: windowScene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataStack.shared.saveContext()
    }
    
    // Set root view controller
    private func setRootController(windowScene: UIWindowScene) {
        let rootViewController = FriendsBuilder().build()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.rootViewController = navigationController
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }

}

