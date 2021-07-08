//
//  Router.swift
//  Punk
//
//  Created by Дмитрий Константинов on 09.07.2021.
//

import UIKit

protocol RouterMain {
    var navController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initViewController()
    func showDetail(beer: BeerWithImage)
}

class Router: RouterProtocol {
    
    var navController: UINavigationController?
    
    var builder: BuilderProtocol?
    
    init(navController: UINavigationController, builder: BuilderProtocol) {
        self.navController = navController
        self.builder = builder
    }
    
    func initViewController() {
        if let navController = self.navController{
            guard let mainViewController = self.builder?.createMainModule(router: self) else { return }
            navController.viewControllers = [mainViewController]
        }
    }
    
    func showDetail(beer: BeerWithImage) {
        if let navController = self.navController{
            guard let detailViewController = self.builder?.createDetailModule(beer: beer, router: self) else { return }
            navController.pushViewController(detailViewController, animated: true)
        }
    }
}
