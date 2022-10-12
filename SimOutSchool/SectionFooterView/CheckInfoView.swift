//
//  CheckInfoView.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/9/23.
//

import UIKit

class CheckInfoView: UIView {

    private lazy var stackView = UIStackView()
    private lazy var checkInfoView = UIImageView()

    var constraint = [NSLayoutConstraint]()
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        checkInfoView = UIImageView(image: UIImage(named: "checkInfo"))
        checkInfoView.contentMode = .scaleAspectFill
        checkInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView = UIStackView(arrangedSubviews: [checkInfoView])
        stackView.backgroundColor = .red
        stackView.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        activeConstraints()
    }
    
    private func activeConstraints() {
        
        constraint.append(stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0))
        constraint.append(stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0))
        constraint.append(stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0))
        constraint.append(stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70))
        
        constraint.append(checkInfoView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0))
        constraint.append(checkInfoView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0))
        constraint.append(checkInfoView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0))
        constraint.append(checkInfoView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -40))
        
        NSLayoutConstraint.activate(constraint)

    }

    
}
