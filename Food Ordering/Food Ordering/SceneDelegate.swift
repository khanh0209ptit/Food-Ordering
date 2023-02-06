//
//  SceneDelegate.swift
//  Food Ordering
//
//  Created by Quang Khánh on 08/01/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        var controller: UIViewController!
        
        if UserDefaults.standard.hasOnboarded {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            controller = storyboard.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
        } else {
            controller = OnboardingViewController.instantiace()
        }
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}

