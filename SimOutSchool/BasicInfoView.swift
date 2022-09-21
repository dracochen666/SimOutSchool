//
//  BasicInfoView.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/9/21.
//

import UIKit

class BasicInfoView: UIView {
    
    var name: String = "姓名：陈龙"
    var gender: String = "性别：男"
    var id: String = "学号：2019011248"
    var schoolClass: String = "班级：软工1901"
    var teacher: String = "辅导员：李媛"
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
       
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        nameLabel.text = name
        nameLabel.textColor = .systemGray3
        nameLabel.font = .systemFont(ofSize: 15)
        
        let genderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        genderLabel.text = gender
        genderLabel.textColor = .systemGray3
        genderLabel.font = .systemFont(ofSize: 15)

        let idLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        idLabel.text = id
        idLabel.textColor = .systemGray3
        idLabel.font = .systemFont(ofSize: 15)
        
        let classLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        classLabel.text = schoolClass
        classLabel.textColor = .systemGray3
        classLabel.font = .systemFont(ofSize: 15)

        let teacherLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        teacherLabel.text = teacher
        teacherLabel.textColor = .systemGray3
        teacherLabel.font = .systemFont(ofSize: 15)

//        let academyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
//        academyLabel.text = "学院：计算机学院"
//        academyLabel.textColor = .systemGray3
//
//
//        let majorLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
//        majorLabel.text = "专业：软件工程"
//        majorLabel.textColor = .systemGray3



        let stackview = UIStackView(arrangedSubviews: [nameLabel,genderLabel,idLabel,classLabel,teacherLabel])
        stackview.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        self.addSubview(stackview)
    }
    

}