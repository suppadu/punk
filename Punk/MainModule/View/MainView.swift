//
//  ViewController.swift
//  Punk
//
//  Created by Дмитрий Константинов on 06.07.2021.
//

import UIKit
import SnapKit

class MainView: UIViewController {
    
    var table: BeersTableView!
    var presenter: MainPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        self.takeBeers()
    }
}

extension MainView: MainViewProtocol {
    func takeBeers() {
        self.presenter.getBeers()
    }
}

