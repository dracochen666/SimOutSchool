//
//  ApplicationInfoView.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/9/22.
//

import UIKit

class ApplicationInfoView: UIView {
    
    var isVaccination: String = "是否已接种新冠疫苗：三针"
    var applicationType: String = "申请类别：出校不出京（当天不返回）"
    var leaveDate: String  = "离校日期："
    var address: String = "离校后住址：地球-中国"
    var riskLevel: String = "风险级别：低风险"
    var specificDate: String = "出校具体时间："
    var reason: String = """
    出校是由：其他原因
    其他原因说明：原因：回家取物
    """
    var imageCode = ""
    var constraint = [NSLayoutConstraint]()
    
    private lazy var isVaccinationLabel = UILabel()
    private lazy var typeLabel = UILabel()
    private lazy var leaveDateLabel = UILabel()
    private lazy var addressLabel = UILabel()
    private lazy var riskLabel = UILabel()
    private lazy var specificDateLabel = UILabel()
    private lazy var reasonLabel = UILabel()
    private lazy var infoStackview = UIStackView()

    private lazy var attachlabel = UILabel()
    private lazy var attachImageView = UIImageView()
    private lazy var attachStackView = UIStackView()

    private lazy var totalStackView = UIStackView()


    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //基本申请信息
        isVaccinationLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        isVaccinationLabel.text = isVaccination
        isVaccinationLabel.textColor = .systemGray
        isVaccinationLabel.font = .systemFont(ofSize: 14)
        
        typeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        typeLabel.text = applicationType
        typeLabel.textColor = .systemGray
        typeLabel.font = .systemFont(ofSize: 14)

        leaveDateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        leaveDateLabel.text = leaveDate
        leaveDateLabel.textColor = .systemGray
        leaveDateLabel.font = .systemFont(ofSize: 14)
        
        addressLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        addressLabel.text = address
        addressLabel.textColor = .systemGray
        addressLabel.font = .systemFont(ofSize: 14)
        
        riskLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        riskLabel.text = riskLevel
        riskLabel.textColor = .systemGray
        riskLabel.font = .systemFont(ofSize: 14)
        
        specificDateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        specificDateLabel.text = specificDate
        specificDateLabel.textColor = .systemGray
        specificDateLabel.font = .systemFont(ofSize: 14)
        
        reasonLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        reasonLabel.text = reason
        reasonLabel.textColor = .systemGray
        reasonLabel.font = .systemFont(ofSize: 14)
        reasonLabel.numberOfLines = 6
        
        infoStackview = UIStackView(arrangedSubviews: [isVaccinationLabel,typeLabel,leaveDateLabel,addressLabel,riskLabel,specificDateLabel,reasonLabel])
        infoStackview.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        infoStackview.axis = .vertical
        infoStackview.distribution = .fill
        infoStackview.spacing = 5
        infoStackview.backgroundColor = .red
        infoStackview.translatesAutoresizingMaskIntoConstraints = false
        
        //相关附件部分
        attachlabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        attachlabel.text = "健康宝绿码截图（不超过500kb）："
        attachlabel.textColor = .systemGray
        attachlabel.font = .systemFont(ofSize: 14)
        attachImageView = UIImageView(image: UIImage(data: Data(base64Encoded: imageCode)!))
        attachImageView.contentMode = .scaleAspectFit
//        attachStackView = UIStackView(arrangedSubviews: [
//            attachlabel, attachImageView1
//        ])
//        attachStackView.axis = .vertical
//        attachStackView.distribution = .fillEqually
//        attachStackView.backgroundColor = .green
//        attachStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //整体totalStackView
        totalStackView = UIStackView(arrangedSubviews: [isVaccinationLabel, typeLabel, leaveDateLabel, addressLabel, riskLabel, specificDateLabel, reasonLabel, attachlabel, attachImageView])
        totalStackView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        totalStackView.axis = .vertical
        totalStackView.distribution = .fill
        totalStackView.spacing = 10
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
        totalStackView.alignment = .leading
        
        print(totalStackView.frame.height)
        self.addSubview(totalStackView)
        self.backgroundColor = .white
        activeConstraints()
    }
    
    private func activeConstraints() {
        
        constraint.append(totalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0))
        constraint.append(totalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0))
        constraint.append(totalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0))
        constraint.append(totalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0))
        
//        constraint.append(attachImageView.topAnchor.constraint(equalTo: attachlabel.topAnchor, constant: 0))
        constraint.append(attachImageView.leadingAnchor.constraint(equalTo: totalStackView.leadingAnchor, constant: 0))
        constraint.append(attachImageView.trailingAnchor.constraint(equalTo: totalStackView.trailingAnchor, constant: -280))
        
        NSLayoutConstraint.activate(constraint)

    }
}

