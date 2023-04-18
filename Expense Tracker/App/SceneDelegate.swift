//
//  SceneDelegate.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 15.04.2023.
//

   import UIKit

//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//    func scene(_ scene: UIScene,
//               willConnectTo session: UISceneSession,
//               options connectionOptions: UIScene.ConnectionOptions) {
//
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//
//
//
//        self.window = UIWindow(windowScene: windowScene)
//
//
//        let presenter = MyPresenterImpl()
//        var viewController = ViewController(presenter: presenter)
//
//
//        presenter.view = viewController
//        viewController.presenter = presenter
//
//        self.window?.rootViewController = viewController
//
//
//        self.window?.makeKeyAndVisible()
//    }
//}
//



class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        let moduleBuilder = ModuleBuilder()
        let viewController = moduleBuilder.build()
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        
    }
}
