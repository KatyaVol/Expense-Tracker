//
//  SceneDelegate.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 15.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
          
        self.window = UIWindow(windowScene: windowScene)
        
        // Создаем экземпляр презентера
        let presenter = MyPresenter()
        
        // Создаем экземпляр представления и связываем его с презентером
        let view = MyView(presenter: presenter)
        presenter.view = view
        
        // Устанавливаем представление в качестве корневого контроллера для окна приложения
        self.window?.rootViewController = view
        
        // Делаем окно ключевым и видимым
        self.window?.makeKeyAndVisible()
    }

}

