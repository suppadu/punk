//
//  DetailPresenter.swift
//  Punk
//
//  Created by Дмитрий Константинов on 09.07.2021.
//

import Foundation

protocol DetailViewProtocol {
    func showBeer()
}

protocol DetailPresenterProtocol {
    init(view: DetailView, beer: BeerWithImage, router: RouterProtocol)
    func setImg()
    func setName()
    func setDescription()
}

class DetailPresenter: DetailPresenterProtocol {
    
    let view: DetailView
    let beer: BeerWithImage
    let router: RouterProtocol
    
    required init(view: DetailView, beer: BeerWithImage, router: RouterProtocol) {
        self.view = view
        self.beer = beer
        self.router = router
    }
    
    func setImg() {
        self.view.img.image = self.beer.img
    }
    
    func setName() {
        self.view.name.text = self.beer.name
        
    }
    
    func setDescription() {
        self.view.descriptionBeer.text = self.beer.description
    }
}
