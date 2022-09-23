//
//  ViewController.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/9/20.
//

import UIKit

class Section {
    var title: String
    var rows: [String]
    var isExpanding: Bool = false
    
    init(title: String, rows: [String], isExpanding: Bool = false) {
        self.title = title
        self.rows = rows
    }
}

class ViewController: UIViewController {
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "infoCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        return tableView
    }()
    private lazy var avatarImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
    private lazy var titleLabel = UILabel()
    private lazy var titleStackview = UIStackView(frame: CGRect(x: 0, y: 40, width: self.view.frame.width, height: 80))
    private lazy var header = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var sections = [Section]()

    var sectionOneHeight = 150.0
    var sectionTwoHeight = 500.0
    var sectionThreeHeight = 150.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("develop test")
        self.view.backgroundColor = .systemGray2
        tableView.tableHeaderView = createHeader()
//        tableView.tableFooterView = createHeader()
        tableView.separatorStyle = .singleLine
        view.addSubview(tableView)
        sections = [
            Section(title: "基本信息", rows: ["1","2","3"]),
            Section(title: "申请信息", rows: ["1","2","3"]),
            Section(title: "审核信息", rows: ["1","2","3"]),
        ]
        
    }
    func createHeader() -> UIStackView{
        titleLabel.text = "陈龙-2022年秋季学期返校申请                            "
        avatarImage.image = UIImage(systemName: "person.fill")
        avatarImage.tintColor = .systemGray
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.layer.cornerRadius = 50
        avatarImage.clipsToBounds = true
        titleStackview.addArrangedSubview(avatarImage)
        titleStackview.addArrangedSubview(titleLabel)
        titleStackview.backgroundColor = .systemGray6
        return titleStackview
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let currentSection = sections[section]
//        if currentSection.isExpanding {
//            return currentSection.rows.count + 1
//        }else {
//            return 1
//        }
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
            cell.textLabel?.text = sections[indexPath.section].title
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].isExpanding.toggle()
//        tableView.reloadSections([indexPath.section], with: .fade)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let view = BasicInfoView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
            return view
        }else if section == 1 {
            let view = ApplicationInfoView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
            return view
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return sectionOneHeight
        }else if section == 1 {
            return sectionTwoHeight
        }else {
            return sectionThreeHeight
        }
        
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Section\(section)"
    }
    
}

extension ViewController: UITableViewDataSource {

}

