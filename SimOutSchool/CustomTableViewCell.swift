//
//  CustomTableViewCell.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/10/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryView = self.arrowImageView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let arrowImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.down"))
        imageView.tintColor = .systemGray
        return imageView
    }()
    
}
