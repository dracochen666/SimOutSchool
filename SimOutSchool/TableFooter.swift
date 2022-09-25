//
//  TableFooter.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/9/24.
//

import UIKit

class TableFooter: UITableViewHeaderFooterView {

    let id = "TableFooter"
    let checkLabel: UILabel = {
        let label = UILabel()
        label.text = "审核完成"
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .center
        return label
       
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(checkLabel)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
