//
//  ViewController.swift
//  Punk
//
//  Created by Дмитрий Константинов on 06.07.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var table = BeersTableView()
    let ns = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        self.ns.getBeer()
        // Do any additional setup after loading the view.
    }


}

