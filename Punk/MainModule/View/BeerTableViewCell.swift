//
//  BeerTableViewCell.swift
//  Punk
//
//  Created by Дмитрий Константинов on 07.07.2021.
//

import UIKit
import SnapKit

class BeerTableViewCell: UITableViewCell {
    
    private let constantWidth = 100
    private let constantHeight = 200
    
    let img = UIImageView()
    let title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        self.setImgView()
        self.setTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension BeerTableViewCell {
    
    private func setImgView() {
        self.img.backgroundColor = .white
        self.img.contentMode = .scaleAspectFit
        contentView.addSubview(self.img)
        self.img.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.width.equalTo(self.constantWidth)
            make.height.equalTo(self.constantHeight)
        }
    }
    
    private func setTitleLabel() {
//        self.title.backgroundColor = .clear
        self.title.numberOfLines = 3
        self.title.font = UIFont(name: "Zapfino", size: 15)
        self.title.textColor = .label
        contentView.addSubview(self.title)
        self.title.snp.makeConstraints { make in
            make.left.equalTo(self.img.snp.right).offset(10)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(self.constantHeight)
        }
    }
}
