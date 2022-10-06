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
        checkLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 40))
        checkLabel.contentMode = .scaleAspectFit
        checkLabel.text = "审核完成"
        checkLabel.textAlignment = .center
        checkLabel.font = .systemFont(ofSize: 14)
        checkLabel.textColor = .systemGray4
//        checkLabel.backgroundColor = .red
        checkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backwardImage =  UIImageView(image: UIImage(systemName: "chevron.backward"))
        backwardImage.contentMode = .scaleAspectFill
        forwardImage =  UIImageView(image: UIImage(systemName: "chevron.forward"))
        forwardImage.contentMode = .scaleAspectFill
        imageStackView = UIStackView(arrangedSubviews: [backwardImage,forwardImage])
        imageStackView.alignment = .center
        imageStackView.axis = .horizontal
        imageStackView.distribution = .equalSpacing
        imageStackView.spacing = 50
        imageStackView.backgroundColor = .systemGray6
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        imageStackView.contentMode = .scaleAspectFill
        
        stackView = UIStackView(arrangedSubviews: [checkLabel,imageStackView])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        activeConstraints()
    }
//    (428 - imageStackView.frame.width)/2
    func activeConstraints() {
        barConstraints.append(checkLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10))
        barConstraints.append(checkLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 178))
        barConstraints.append(backwardImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 178))
//        barConstraints.append(backwardImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -20))
        
        
        
//        barConstraints.append(imageStackView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0))
//        barConstraints.append(imageStackView.trailingAnchor.constraint(equalTo: imageStackView.trailingAnchor, constant: 100))
//        barConstraints.append(checkLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10))
//        barConstraints.append(checkLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10))
//        barConstraints.append(imageStackView.topAnchor.constraint(equalTo: checkLabel.bottomAnchor, constant: 10))
//        barConstraints.append(imageStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: (100)))
//        barConstraints.append(imageStackView.trailingAnchor.constraint(equalTo: stackView.rightAnchor, constant: (100)))

        NSLayoutConstraint.activate(barConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
