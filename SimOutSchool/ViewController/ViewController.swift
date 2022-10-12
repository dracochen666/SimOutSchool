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
    
    var person = Person(name: "", id: "", leaveDate: "", arriveDate: "", reason: "", attachImageCode: "", schoolClass: "")
    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "infoCell")
//        tableView.register(TableFooter.self, forHeaderFooterViewReuseIdentifier: "TableFooter")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.sectionHeaderHeight = 0
        tableView.backgroundColor = .systemGray5
        return tableView
    }()
    
  
    private lazy var header = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var sections = [Section]()
    private lazy var  bottomBar = BottomBar()
    
    
    var sectionOneHeight:CGFloat = 130.0
    var sectionTwoHeight:CGFloat = 500.0
    var sectionThreeHeight:CGFloat = 320.0
    var constraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("develop test")
//        self.view.backgroundColor = .black
        tableView.tableHeaderView = {
            let header = HeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
            header.personName = person.name
            header.backgroundColor = .systemGray6
            return header
        }()
//        tableView.separatorStyle = .singleLine
        
        bottomBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0)
        view.addSubview(tableView)
        view.addSubview(bottomBar)
        activeConstraint()
        sections = [
            Section(title: "基本信息"),
            Section(title: "申请信息"),
            Section(title: "审核信息"),
        ]
        
        //设置导航栏样式
        setNavigationControllerStyle()
    }
    
    func setNavigationControllerStyle () {
        navigationItem.title = "出入校申请"
        
        //左按钮
        let backBtnImage: UIImage = {
            let image = UIImage(systemName: "xmark")
            return image!
        }()
        let backBtn = UIBarButtonItem(image: backBtnImage, style: .plain, target: self, action: #selector(tapToBack))
        backBtn.tintColor = .black
        navigationItem.leftBarButtonItem = backBtn
        
        //右按钮
        let moreBtnImage: UIImage = {
            let image = UIImage(systemName: "ellipsis")
            return image!
        }()
        let moreBtn = UIBarButtonItem(image: moreBtnImage, style: .plain, target: self, action: #selector(tapToMore))
        moreBtn.tintColor = .black
        navigationItem.rightBarButtonItem = moreBtn
        navigationController?.navigationBar.backgroundColor = .systemGray5
    }
    
//    func createHeader() -> UIStackView{
//
//        return titleStackview
//    }
    
    func activeConstraint() {
        
        constraints.append(bottomBar.widthAnchor.constraint(equalToConstant: self.view.frame.width))
        constraints.append(bottomBar.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(bottomBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0))
        constraints.append(bottomBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0))
        constraints.append(bottomBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 38))
        
//        constraints.append(avatarImage.topAnchor.constraint(equalTo: titleStackview.topAnchor, constant: 10))
//        constraints.append(avatarImage.leadingAnchor.constraint(equalTo: titleStackview.leadingAnchor, constant: 10))
//        constraints.append(avatarImage.trailingAnchor.constraint(equalTo: titleStackview.trailingAnchor, constant: 150))
//        constraints.append(avatarImage.bottomAnchor.constraint(equalTo: titleStackview.bottomAnchor, constant: -15))
        
//        constraints.append(titleLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10))
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

        let arrowImage = UIImage(systemName: "arrow.up")
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        cell.textLabel?.text = sections[indexPath.section].title
//        cell.layer.borderWidth = 10
//        cell.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
//        cell.layer.cornerRadius = 80
//        cell.backgroundColor = .red
  
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].isExpanding.toggle()
//        print(sections[indexPath.section].isExpanding)
        if indexPath.section == 0 {
            sectionOneHeight =  sections[indexPath.section].isExpanding ? 130.0 : 0
        }else if indexPath.section == 1 {
            sectionTwoHeight = sections[indexPath.section].isExpanding ? 500.0 : 0
        }else {
            sectionThreeHeight = sections[indexPath.section].isExpanding ? 300.0 : 0
        }
        tableView.reloadSections([indexPath.section], with: .fade)
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            tableView.footerView(forSection: section)
            let view = BasicInfoView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
            view.name.append(person.name)
            view.id.append(person.id)
            view.schoolClass.append(person.schoolClass)
            view.backgroundColor = .white
            return view
        }else if section == 1 {
            let view = ApplicationInfoView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
            view.leaveDate.append(person.leaveDate)
            view.specificDate.append(person.arriveDate)
            view.imageCode = person.attachImageCode
            view.backgroundColor = .white
            return view
        }else{
            let view = CheckInfoView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: sectionThreeHeight))
            view.backgroundColor = .systemGray6
            return view
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return sectionOneHeight
        }else if section == 1 {
            return sectionTwoHeight
        }else{
            return sectionThreeHeight
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

//点击事件
extension ViewController {
    //导航栏 返回按钮
    @objc private func tapToBack() {
        navigationController?.popViewController(animated: true)
    }
    //导航栏 详细信息按钮
    @objc private func tapToMore() {
        print("More")
    }
}
