//
//  TestView.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/9/21.
//

import UIKit

class TestView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let textLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textLabel.text = "1111111111"
        let image = UIImageView(image: UIImage(systemName: "app"))
        self.addSubview(textLabel)
//        self.addSubview(image)
    }
    
    
}
