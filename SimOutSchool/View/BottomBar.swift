//
//  BottomBar.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/10/1.
//

import UIKit

class BottomBar: UIView {

    var barConstraints = [NSLayoutConstraint]()
    private lazy var checkLabel = UILabel()
    private lazy var backwardImage = UIImageView()
    private lazy var forwardImage = UIImageView()
    private lazy var imageStackView = UIStackView()
    private lazy var stackView = UIStackView()


    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        checkLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 0))
        checkLabel.contentMode = .scaleAspectFit
        checkLabel.text = "审核完成"
        checkLabel.textAlignment = .center
        checkLabel.font = .systemFont(ofSize: 14)
        checkLabel.textColor = .systemGray
//        checkLabel.backgroundColor = .red
        
        backwardImage =  UIImageView(image: UIImage(systemName: "chevron.backward"))
        backwardImage.tintColor = .darkGray
        backwardImage.contentMode = .scaleAspectFit
        forwardImage =  UIImageView(image: UIImage(systemName: "chevron.forward"))
        forwardImage.tintColor = .systemGray4
        forwardImage.contentMode = .scaleAspectFit
        imageStackView = UIStackView(arrangedSubviews: [backwardImage,forwardImage])
        imageStackView.alignment = .center
        imageStackView.axis = .horizontal
        imageStackView.distribution = .equalSpacing
        imageStackView.spacing = 0
        imageStackView.backgroundColor = .systemGray6
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        imageStackView.contentMode = .scaleAspectFit
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView = UIStackView(arrangedSubviews: [checkLabel,imageStackView])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.layer.borderWidth = 1
//        stackView.layer.borderColor = UIColor.systemGray5.cgColor
        stackView.layer.shadowOpacity = 0.3
        stackView.layer.shadowColor = UIColor.systemGray3.cgColor
        
        self.addSubview(stackView)

        activeConstraints()
    }
//    (428 - imageStackView.frame.width)/2
    func activeConstraints() {
        
        barConstraints.append(stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0))
        barConstraints.append(stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0))
        barConstraints.append(stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0))
        
        barConstraints.append(checkLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10))
        barConstraints.append(checkLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 178))
        barConstraints.append(checkLabel.bottomAnchor.constraint(equalTo: imageStackView.topAnchor, constant: -10))


        barConstraints.append(imageStackView.topAnchor.constraint(equalTo: stackView.topAnchor, constant:  40))
        barConstraints.append(imageStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant:  0))
        barConstraints.append(imageStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant:  0))
        barConstraints.append(imageStackView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant:  -80))
        
        barConstraints.append(backwardImage.topAnchor.constraint(equalTo: imageStackView.topAnchor, constant: 10))
        barConstraints.append(backwardImage.leadingAnchor.constraint(equalTo: imageStackView.leadingAnchor, constant: 165))
        barConstraints.append(backwardImage.bottomAnchor.constraint(equalTo: imageStackView.bottomAnchor, constant: -60))
        
        barConstraints.append(forwardImage.leadingAnchor.constraint(equalTo: backwardImage.trailingAnchor, constant: -90))
        NSLayoutConstraint.activate(barConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
