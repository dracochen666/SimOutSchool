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
    var leaveDate: String  = "离校日期：2022-09-19"
    var address: String = "离校后住址：地球-中国"
    var riskLevel: String = "风险级别：低风险"
    var specificDate: String = "出校具体时间：12点"
    var reason: String = """
    出校是由：其他原因
    其他原因说明：原因：看望家人 本人出入校时将坚持“两点一线”，不做与申请事由无关事项。科学佩戴口罩，加强防护，保持安全社交距 离，不扎堆、不聚集，不前往人员密集性娱乐场所。出校时间为9.19，预计返校时间9.25，行程轨迹为：北京信息科技大学-北京市丰台区
    """
    var constraint = [NSLayoutConstraint]()
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //基本申请信息
        let isVaccinationLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        isVaccinationLabel.text = isVaccination
        isVaccinationLabel.textColor = .systemGray2
        isVaccinationLabel.font = .systemFont(ofSize: 15)

        let typeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        typeLabel.text = applicationType
        typeLabel.textColor = .systemGray2
        typeLabel.font = .systemFont(ofSize: 15)

        let leaveDateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        leaveDateLabel.text = leaveDate
        leaveDateLabel.textColor = .systemGray2
        leaveDateLabel.font = .systemFont(ofSize: 15)
        
        let addressLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        addressLabel.text = address
        addressLabel.textColor = .systemGray2
        addressLabel.font = .systemFont(ofSize: 15)
        
        let riskLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        riskLabel.text = riskLevel
        riskLabel.textColor = .systemGray2
        riskLabel.font = .systemFont(ofSize: 15)
        
        let specificDateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        specificDateLabel.text = specificDate
        specificDateLabel.textColor = .systemGray2
        specificDateLabel.font = .systemFont(ofSize: 15)
        
//        let reasonTextView = UITextView(frame: CGRect(x: 0, y: 0, width: rect.width, height: 100))
//        reasonTextView.text = reason
//        reasonTextView.textColor = .systemGray
//        reasonTextView.backgroundColor = .red
//        reasonTextView.font = .systemFont(ofSize: 15)
        
        let reasonLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 100))
        reasonLabel.text = reason
        reasonLabel.textColor = .systemGray2
        reasonLabel.font = .systemFont(ofSize: 15)
        reasonLabel.numberOfLines = 6
        
        let infoStackview = UIStackView(arrangedSubviews: [isVaccinationLabel,typeLabel,leaveDateLabel,addressLabel,riskLabel,specificDateLabel,reasonLabel])
        infoStackview.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        infoStackview.axis = .vertical
        infoStackview.distribution = .equalSpacing
        infoStackview.spacing = 10.0
        
        //相关附件部分
        let attachlabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        attachlabel.text = "相关附件:"
        attachlabel.textColor = .systemGray2
        attachlabel.font = .systemFont(ofSize: 15)
        let attachlabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0))
        attachlabel2.text = "其他附件:"
        attachlabel2.textColor = .systemGray2
        attachlabel2.font = .systemFont(ofSize: 15)
        let attachImageView1 = UIImageView(image: UIImage(named: "attach1"))
        let attachImageView2 = UIImageView(image: UIImage(named: "attach2"))
        let attachImageView3 = UIImageView(image: UIImage(named: "attach3"))
        attachImageView1.contentMode = .scaleAspectFit
        attachImageView2.contentMode = .scaleAspectFit
        attachImageView3.contentMode = .scaleAspectFit
        let attachStackView = UIStackView(arrangedSubviews: [
            attachlabel, attachImageView1, attachImageView2, attachImageView3
        ])
        attachStackView.axis = .vertical
        attachStackView.distribution = .equalSpacing
//        constraint.append(attachlabel.leftAnchor.constraint(equalTo: attachStackView.leftAnchor, constant: 10.0))
        
        //整体stackview
        let stackview = UIStackView(arrangedSubviews: [infoStackview,attachStackView])
        stackview.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        stackview.spacing = 10
        stackview.backgroundColor = .white
        print(stackview.frame.height)
        self.addSubview(stackview)
        
        constraint.append(infoStackview.topAnchor.constraint(equalTo: stackview.topAnchor,constant: 10.0))
        constraint.append(infoStackview.leadingAnchor.constraint(equalTo: stackview.leadingAnchor,constant: 10.0))
//        constraint.append(attachStackView.topAnchor.constraint(equalTo: infoStackview.topAnchor,constant: 10.0))
//        constraint.append(attachStackView.leadingAnchor.constraint(equalTo: stackview.trailingAnchor,constant: 10.0))

        NSLayoutConstraint.activate(constraint)

    }
//    init(isVaccination: String, applicationType: String, leaveDate: String, address: String,
//         riskLevel: String, specificDate: String, reason: String, constraint: [NSLayoutConstraint] = [NSLayoutConstraint]()) {
//        self.isVaccination = isVaccination
//        self.applicationType = applicationType
//        self.leaveDate = leaveDate
//        self.address = address
//        self.riskLevel = riskLevel
//        self.specificDate = specificDate
//        self.reason = reason
//        self.constraint = constraint
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

