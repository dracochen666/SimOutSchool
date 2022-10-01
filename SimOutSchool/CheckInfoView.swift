//
//  CheckInfoView.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/9/23.
//

import UIKit

class CheckInfoView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let checkInfoView = UIImageView(image: UIImage(named: "checkInfo"))
//        checkInfoView.contentMode = .
        print("width:\(rect.width) height:\(rect.height)")
        
        let stackview = UIStackView(arrangedSubviews: [checkInfoView])
        stackview.backgroundColor = .red
        stackview.frame = CGRect(x: 0, y: 0, width: rect.width, height: 200.0)
//        stackview.translatesAutoresizingMaskIntoConstraints = false
//        checkInfoView.topAnchor.constraint(equalTo: stackview.topAnchor, constant: 10.0).isActive = true
//        checkInfoView.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 10.0).isActive = true
        checkInfoView.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: 10.0).isActive = true
        checkInfoView.bottomAnchor.constraint(equalTo: stackview.bottomAnchor, constant: 10.0).isActive = true
//        checkInfoView.topAnchor.constraint(equalTo: stackview.topAnchor, constant: 10.0).isActive = true
//        checkInfoView.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 10.0).isActive = true
        
        self.addSubview(stackview)
    }
    

    
}
