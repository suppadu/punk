//
//  TableViewController.swift
//  Punk
//
//  Created by Дмитрий Константинов on 06.07.2021.
//

import UIKit

class BeersTableView: UITableView {
    
    let cellId = "BeerTableViewCell"
    var presenter: MainPresenter!
    var podgruzkaPoshla = false
    let refreshController = UIRefreshControl()
    var divideNumber: CGFloat = 6
    
    init() {
        super.init(frame: .zero, style: .grouped)
        self.refreshController.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        backgroundColor = .systemBackground
        delegate = self
        dataSource = self
        refreshControl = self.refreshController
        rowHeight = 220
        register(BeerTableViewCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
//        print("\(offsetY) | \(contentHeight) | \(scrollView.frame.height)")
        if offsetY > contentHeight / self.divideNumber {
            if !self.podgruzkaPoshla {
                podgruzkaPoshla = true
                divideNumber = 2
//                print("Gruzim novoe | \(divideNumber)")
                self.presenter.getBeers()
            }
        }
    }
    
    @objc
    private func refresh(sender: UIRefreshControl){
        self.presenter.getNewPageBeers()
    }
}

extension BeersTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.pivasik.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! BeerTableViewCell
        cell.title.text = self.presenter.pivasik[indexPath.row].name
        cell.img.image = self.presenter.pivasik[indexPath.row].img
        
        return cell
    }
}

extension BeersTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = self.presenter.pivasik[indexPath.row]
        self.presenter.tapBeer(beer: beer)
    }
}
