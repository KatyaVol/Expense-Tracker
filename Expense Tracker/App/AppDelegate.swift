//
//  AppDelegate.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 15.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let presenter = MyPresenterImpl()
        
        let controller = ViewController(presenter: presenter)
        
        presenter.view = controller
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        
        return true
    }
}

