//
//  AppDelegate.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/4/22.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var onboardingView: OnboardingView!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        onboardingView = OnboardingView()
        let navController = NavigationController(rootViewController: onboardingView)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        return true
    }
}

