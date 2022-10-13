//
//  HeaderView.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/10/11.
//

import UIKit

class HeaderView: UIView {
    
    var personName:String = ""
    
    private lazy var avatarImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var titleStackview = UIStackView()
    
    var constraint = [NSLayoutConstraint]()

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        titleLabel.text = "\(personName)-当天出入校申请"
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        avatarImage.image = UIImage(systemName: "person.fill")
        avatarImage.tintColor = .systemGray2
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.layer.cornerRadius = 50
        avatarImage.clipsToBounds = true
//        avatarImage.backgroundColor = .red                                             
//        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        titleStackview.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        titleStackview.addArrangedSubview(avatarImage)
        titleStackview.addArrangedSubview(titleLabel)
        titleStackview.backgroundColor = .systemGray6
//        titleStackview.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleStackview)
        self.backgroundColor = .systemGray6
        activeConstraints()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//
//    }
//
    private func activeConstraints() {
        
        constraint.append(titleStackview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0))
        constraint.append(titleStackview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0))
        constraint.append(titleStackview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0))
        constraint.append(titleStackview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0))
        
        constraint.append(avatarImage.topAnchor.constraint(equalTo: titleStackview.topAnchor, constant: 5))
        constraint.append(avatarImage.leadingAnchor.constraint(equalTo: titleStackview.leadingAnchor, constant: 0))
        constraint.append(avatarImage.trailingAnchor.constraint(equalTo: titleStackview.trailingAnchor, constant: -350))
        constraint.append(avatarImage.bottomAnchor.constraint(equalTo: titleStackview.bottomAnchor, constant: -5))
        
        NSLayoutConstraint.activate(constraint)

    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
