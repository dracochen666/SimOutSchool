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
    
    init(title: String = "", rows: [String] = [], isExpanding: Bool = false) {
        self.title = title
        self.rows = rows
    }
}

class ViewController: UIViewController {
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "infoCell")
        tableView.register(TableFooter.self, forHeaderFooterViewReuseIdentifier: "TableFooter")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.sectionHeaderHeight = 0
        return tableView
    }()
    private lazy var avatarImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
    private lazy var titleLabel = UILabel()
    private lazy var titleStackview = UIStackView(frame: CGRect(x: 0, y: 40, width: self.view.frame.width, height: 80))
    private lazy var header = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var sections = [Section]()
    private lazy var  bottomBar = BottomBar()
    var sectionOneHeight:CGFloat = 140.0
    var sectionTwoHeight:CGFloat = 1600.0
    var sectionThreeHeight:CGFloat = 500.0
    var constraints = [NSLayoutConstraint]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("develop test")
        self.view.backgroundColor = .systemGray3
        tableView.tableHeaderView = createHeader()
        tableView.tableFooterView = BasicInfoView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
        tableView.separatorStyle = .singleLine
        
        bottomBar.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(tableView)
        self.view.addSubview(bottomBar)
        activeConstraint()
        sections = [
            Section(title: "基本信息"),
            Section(title: "申请信息"),
            Section(title: "审核信息"),
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
    func activeConstraint() {
//        constraints.append(tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0))
//        constraints.append(tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 0))
//        constraints.append(bottomBar.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0))
//        constraints.append(bottomBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0))
        
        constraints.append(bottomBar.widthAnchor.constraint(equalToConstant: self.view.frame.width))
        constraints.append(bottomBar.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(bottomBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0))
        constraints.append(bottomBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0))
        constraints.append(bottomBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 38))
        NSLayoutConstraint.activate(constraints)
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
//        if indexPath.row == 0 {
//
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        cell.textLabel?.text = sections[indexPath.section].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].isExpanding.toggle()
//        print(sections[indexPath.section].isExpanding)
        if indexPath.section == 0 {
            sectionOneHeight =  sections[indexPath.section].isExpanding ? 150.0 : 0
        }else if indexPath.section == 1 {
            sectionTwoHeight = sections[indexPath.section].isExpanding ? 800.0 : 0
        }else {
            sectionThreeHeight = sections[indexPath.section].isExpanding ? 150.0 : 0
        }
        tableView.reloadSections([indexPath.section ], with: .fade)
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            tableView.footerView(forSection: section)
            let view = BasicInfoView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
            view.backgroundColor = .white
            return view
        }else if section == 1 {
            let view = ApplicationInfoView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
            return view
        }else{
            let view = CheckInfoView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
            return view
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return sectionOneHeight
        }else if section == 1 {
            return sectionTwoHeight
        }else if section == 2 {
            return sectionThreeHeight
        }else {
            return 100.0
        }
        
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableFooter")
//        return view
//    }
//
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "Section\(section)"
//    }

}

extension ViewController: UITableViewDataSource {

}

