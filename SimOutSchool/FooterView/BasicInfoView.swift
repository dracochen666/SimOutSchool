//
//  BasicInfoView.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/9/21.
//

import UIKit

class BasicInfoView: UIView {
    
    var name: String = "姓名："
    var gender: String = "性别：男"
    var id: String = "学号："
    var schoolClass: String = "班级："
    var teacher: String = "辅导员：李媛"
    var constraint = [NSLayoutConstraint]()
    
    private lazy var nameLabel = UILabel()
    private lazy var genderLabel = UILabel()
    private lazy var idLabel = UILabel()
    private lazy var classLabel = UILabel()
    private lazy var teacherLabel = UILabel()

    private lazy var totalStackView = UIStackView()
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        nameLabel.text = name
        nameLabel.textColor = .systemGray
        nameLabel.font = .systemFont(ofSize: 14)
        
        genderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        genderLabel.text = gender
        genderLabel.textColor = .systemGray
        genderLabel.font = .systemFont(ofSize: 14)

        idLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        idLabel.text = id
        idLabel.textColor = .systemGray
        idLabel.font = .systemFont(ofSize: 14)
        
        classLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        classLabel.text = schoolClass
        classLabel.textColor = .systemGray
        classLabel.font = .systemFont(ofSize: 14)

        teacherLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        teacherLabel.text = teacher
        teacherLabel.textColor = .systemGray
        teacherLabel.font = .systemFont(ofSize: 14)


        totalStackView = UIStackView(arrangedSubviews: [nameLabel,genderLabel,idLabel,classLabel,teacherLabel])
        totalStackView.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        totalStackView.axis = .vertical
        totalStackView.distribution = .fillEqually
        totalStackView.spacing = 10
        totalStackView.backgroundColor = .white
        totalStackView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(totalStackView)
        self.backgroundColor = .white
        activeConstraints()
        
    }
    
    private func activeConstraints() {
        
        constraint.append(totalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0))
        constraint.append(totalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0))
        constraint.append(totalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0))
        constraint.append(totalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0))
        
        NSLayoutConstraint.activate(constraint)

    }
}
