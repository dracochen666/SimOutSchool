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
    var isExpanding: Bool = true
    
    init(title: String = "", rows: [String] = [], isExpanding: Bool = false) {
        self.title = title
        self.rows = rows
    }
}

class ViewController: UIViewController {
    
    var person = Person(name: "", id: "", leaveDate: "", arriveDate: "", reason: "", attachImageCode: "", schoolClass: "")
    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .grouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "infoCell")
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
    
    
//    var sectionOneHeight:CGFloat = 130.0
//    var sectionTwoHeight:CGFloat = 500.0
//    var sectionThreeHeight:CGFloat = 320.0
    
    
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
        
        //设置右滑手势
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(gestureSwipeLeft(_:)))
        gesture.direction = .right
        gesture.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(gesture)
        self.view.isUserInteractionEnabled = true
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
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! CustomTableViewCell
        cell.textLabel?.text = sections[indexPath.section].title
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].isExpanding.toggle()
        
        //添加Section展开箭头及其动画
        let isExpanding = sections[indexPath.section].isExpanding
        if isExpanding {
            tableView.cellForRow(at: indexPath)?.accessoryView?.transform = CGAffineTransform(rotationAngle: -Double.pi)
//            = {
////                var imageView = UIImageView(image: UIImage(systemName: "chevron.down"))
//                imageView = arrowRotationAnimation(imageView: imageView, isExpanding: isExpanding)
//                imageView.tintColor = .systemGray
//                return imageView
//            }()
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryView?.transform = CGAffineTransform(rotationAngle: Double.pi)
//            = {
////                var imageView = UIImageView(image: UIImage(systemName: "chevron.down"))
//                imageView = arrowRotationAnimation(imageView: imageView, isExpanding: isExpanding)
//                imageView.tintColor = .systemGray
//                return imageView
//            }()
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
            let view = CheckInfoView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
            view.backgroundColor = .systemGray6
            return view
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        var footerHeight: CGFloat = 0
        if section == 0 {
            footerHeight =  sections[section].isExpanding ? 130.0 : 0
        } else if section == 1 {
            footerHeight = sections[section].isExpanding ? 500.0 : 0
        } else {
            footerHeight = sections[section].isExpanding ? 320.0 : 0
        }
        return footerHeight
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
    
    //右滑Pop
    @objc func gestureSwipeLeft(_ gesture: UISwipeGestureRecognizer) {
//        print("Gesture Fired!")
        navigationController?.popViewController(animated: true)
        
    }
}

extension ViewController {
    func arrowRotationAnimation(imageView: UIImageView, isExpanding: Bool) -> UIImageView{
        if isExpanding {
            UIView.animate(withDuration: 0.5) {
                imageView.transform = CGAffineTransform(rotationAngle: Double.pi)
            }
            
            return imageView
        }else {
            UIView.animate(withDuration: 0.5) {
                imageView.transform = CGAffineTransform(rotationAngle: Double.pi)
            }
//            let rotationAnim = CABasicAnimation(keyPath: "transform.rotation")

//            rotationAnim.fromValue = Double.pi
//            rotationAnim.toValue = 0
////            rotationAnim.repeatCount = 1
//            rotationAnim.duration = 0.5
//            rotationAnim.isRemovedOnCompletion = false
//
//            imageView.layer.add(rotationAnim, forKey: nil)
            
            print("未展开")
            return imageView
        }
        
    }
}
