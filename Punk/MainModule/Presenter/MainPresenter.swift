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
         tableView: BeersTableView,
         router: RouterProtocol)
    
    func getBeers()
    func getNewPageBeers()
    func tapBeer(beer: BeerWithImage)
}

class MainPresenter: MainPresenterProtocol {
    
    let view: MainView
    let network: NetworkService
    let tableView: BeersTableView
    let router: RouterProtocol
    private var numberPage = 0
    var pivasik: [BeerWithImage] = []
    
    required init(view: MainView,
                  network: NetworkService,
                  tableView: BeersTableView,
                  router: RouterProtocol) {
        self.view = view
        self.network = network
        self.tableView = tableView
        self.router = router
    }
    
    func getBeers() {
        let getBeerQueue = DispatchQueue.global(qos: .utility)
        self.numberPage = self.numberPage < 66 ? self.numberPage + 1 : self.numberPage - 65
        getBeerQueue.async {
            self.network.getBeersPage(self.numberPage){ beers in
                self.pivasik.append(contentsOf: beers)
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
                self.pivasik = []
                self.pivasik.append(contentsOf: beers)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.refreshControl?.endRefreshing()
                }
            }
        }
    }
    
    func tapBeer(beer: BeerWithImage) {
        self.router.showDetail(beer: beer)
    }
}
