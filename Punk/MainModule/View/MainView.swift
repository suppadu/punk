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
    let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.refreshController.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        self.table.refreshControl = self.refreshController
        self.view.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        self.takeBeers()
    }
    
    @objc
    private func refresh(sender: UIRefreshControl){
        self.presenter.getNewPageBeers()
    }
}

extension MainView: MainViewProtocol {
    func takeBeers() {
        self.presenter.getBeers()
    }
}

