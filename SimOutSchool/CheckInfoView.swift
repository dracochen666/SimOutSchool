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
        checkInfoView.contentMode = .scaleAspectFit
        print("width:\(rect.width) height:\(rect.height)")
        
        let stackview = UIStackView(arrangedSubviews: [checkInfoView])
        stackview.backgroundColor = .white
        stackview.frame = CGRect(x: 0, y: 0, width: rect.height, height: rect.width)
        checkInfoView.topAnchor.constraint(equalTo: stackview.topAnchor, constant: 10.0).isActive = true
        checkInfoView.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 10.0).isActive = true
        self.addSubview(stackview)
    }
    

    
}
