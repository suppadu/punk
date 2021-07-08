//
//  MainPresenter.swift
//  Punk
//
//  Created by Дмитрий Константинов on 07.07.2021.
//

import Foundation

protocol MainViewProtocol {
    func takeBeers()
}

protocol MainPresenterProtocol {
    init(view: MainView,
         network: NetworkService,
         tableView: BeersTableView)
    
    func getBeers()
    func getNewPageBeers()
}

class MainPresenter: MainPresenterProtocol {
    
    
    let view: MainView
    let network: NetworkService
    let tableView: BeersTableView
    private var numberPage = 0
    
    required init(view: MainView, network: NetworkService, tableView: BeersTableView) {
        self.view = view
        self.network = network
        self.tableView = tableView
    }
    
    func getBeers() {
        let getBeerQueue = DispatchQueue.global(qos: .utility)
        self.numberPage = self.numberPage < 66 ? self.numberPage + 1 : self.numberPage - 65
        getBeerQueue.async {
            self.network.getBeersPage(self.numberPage){ beers in
                self.tableView.pivasik.append(contentsOf: beers)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.podgruzkaPoshla = false
                }
            }
        }
    }
    
    func getNewPageBeers() {
        let getBeerQueue = DispatchQueue.global(qos: .utility)
        let random = Int.random(in: 1...65)
        if self.numberPage != random{
            self.numberPage = random
        } else {self.numberPage = Int.random(in: 1...65)}
        getBeerQueue.async {
            self.network.getBeersPage(self.numberPage){ beers in
                self.tableView.pivasik = []
                self.tableView.pivasik.append(contentsOf: beers)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.refreshControl?.endRefreshing()
                }
            }
        }
    }
}
