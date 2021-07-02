//
//  AppDelegate.swift
//  drugiZadatak
//
//  Created by Nikola Barbaric on 09.06.2021..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let initialViewController = UINavigationController(rootViewController: FirstViewController())
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = initialViewController
        
        print(UIFont.familyNames)
        
        
        return true
    }


}

