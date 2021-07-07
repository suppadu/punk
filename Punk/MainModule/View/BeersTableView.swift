//
//  TableViewController.swift
//  Punk
//
//  Created by Дмитрий Константинов on 06.07.2021.
//

import UIKit

class BeersTableView: UITableView {
    
    let cellId = "BeerTableViewCell"
    var array = [Beer]()
    
    init() {
        super.init(frame: .zero, style: .plain)
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(BeerTableViewCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BeersTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
        
        return cell
    }
}

extension BeersTableView: UITableViewDelegate {
    
}
