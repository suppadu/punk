//
//  TableViewController.swift
//  Punk
//
//  Created by Дмитрий Константинов on 06.07.2021.
//

import UIKit

class BeersTableView: UITableView {
    
    let cellId = "BeerTableViewCell"
    var presenter: MainPresenterProtocol!
    var podgruzkaPoshla = false
    var pivasik: [BeerWithImage] = []
    
    init() {
        super.init(frame: .zero, style: .plain)
        backgroundColor = .clear
        delegate = self
        dataSource = self
        rowHeight = 220
        register(BeerTableViewCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height - 150 {
            if !self.podgruzkaPoshla {
                podgruzkaPoshla = true
                print("Gruzim novoe")
                self.presenter.getBeers()
            }
        }
    }
    
    
}

extension BeersTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pivasik.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! BeerTableViewCell
        cell.title.text = self.pivasik[indexPath.row].name
        cell.img.image = self.pivasik[indexPath.row].img
        
        return cell
    }
}

extension BeersTableView: UITableViewDelegate {
    
}
