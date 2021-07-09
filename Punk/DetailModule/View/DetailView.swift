//
//  DetailView.swift
//  Punk
//
//  Created by Дмитрий Константинов on 09.07.2021.
//

import UIKit
import SnapKit

class DetailView: UIViewController {
    
    private let constantWidth = 100
    private let constantHeight = 200
    
    var presenter: DetailPresenter!
    
    let img = UIImageView()
    let name = UILabel()
    let descriptionBeer = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setImgView()
        self.setNameLabel()
        self.setDescriptionLabel()
        self.showBeer()
    }
}

extension DetailView: DetailViewProtocol {
    func showBeer() {
        self.presenter.setImg()
        self.presenter.setName()
        self.presenter.setDescription()
    }
    
    private func setImgView() {
        self.img.backgroundColor = .white
        self.img.contentMode = .scaleAspectFit
        self.view.addSubview(self.img)
        img.snp.makeConstraints { make in
            make.left.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            make.width.equalTo(self.constantWidth)
            make.height.equalTo(self.constantHeight)
        }
    }
    
    private func setNameLabel() {
        self.name.backgroundColor = .clear
        self.name.numberOfLines = 3
        self.name.font = UIFont(name: "Zapfino", size: 15)
        self.name.textColor = .label
        self.view.addSubview(self.name)
        name.snp.makeConstraints { make in
            make.left.equalTo(self.img.snp.right).offset(10)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            make.width.equalTo(self.constantWidth)
            make.height.equalTo(self.constantHeight)
        }
    }
    
    private func setDescriptionLabel() {
        self.descriptionBeer.backgroundColor = .clear
        self.descriptionBeer.numberOfLines = 50
        self.descriptionBeer.adjustsFontSizeToFitWidth = true
        self.descriptionBeer.sizeToFit()
        self.descriptionBeer.textColor = .label
        self.descriptionBeer.font = UIFont(name: "GillSans-LightItalic", size: 22)
        self.view.addSubview(self.descriptionBeer)
        descriptionBeer.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            make.top.equalTo(self.img.snp.bottom).offset(10)
//            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
        }
    }
}
