//
//  AppDelegate.swift
//  KindleApp
//
//  Created by Irma Blanco on 21/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Ignore StoryBoards by constructing our own window
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        //We set a UINavigationContoller and this requires a rootViewController
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        
        return true
    }

  
}

