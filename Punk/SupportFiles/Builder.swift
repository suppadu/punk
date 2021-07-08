//
//  Builder.swift
//  Punk
//
//  Created by Дмитрий Константинов on 08.07.2021.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(beer: BeerWithImage, router: RouterProtocol) -> UIViewController
}

class Builder: BuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let view = MainView()
        let tableView = BeersTableView()
        let presenter = MainPresenter(view: view,
                                      network: networkService,
                                      tableView: tableView,
                                      router: router)
        view.presenter = presenter
        view.table = tableView
        tableView.presenter = presenter
        return view
    }
    
    func createDetailModule(beer: BeerWithImage, router: RouterProtocol) -> UIViewController {
        let view = DetailView()
        let presenter = DetailPresenter(view: view,
                                        beer: beer,
                                        router: router)
        view.presenter = presenter
        return view
    }
}
