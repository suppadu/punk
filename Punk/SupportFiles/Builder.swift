//
//  Builder.swift
//  Punk
//
//  Created by Дмитрий Константинов on 08.07.2021.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    static func createMainView() -> UIViewController
}

class Builder: BuilderProtocol {
    static func createMainView() -> UIViewController {
        let networkService = NetworkService()
        let view = MainView()
        let tableView = BeersTableView()
        let presenter = MainPresenter(view: view,
                                      network: networkService,
                                      tableView: tableView)
        view.presenter = presenter
        view.table = tableView
        tableView.presenter = presenter
        return view
    }
}
