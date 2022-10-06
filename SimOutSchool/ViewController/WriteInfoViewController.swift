//
//  WriteInfoViewController.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/10/1.
//

import UIKit

class WriteInfoViewController: UIViewController {

    private lazy var person = Person(name: "", id: "", leaveDate: "", arriveDate: "", reason: "", attachImageCode: "")
    
    private lazy var nameTextField = UITextField()
    private lazy var idTextField = UITextField()
    private lazy var leaveDateTextField = UITextField()
    private lazy var arriveDateTextField = UITextField()
    private lazy var reasonTextView = UITextView()
    private lazy var attachImage = UIImageView()
    private var totalStackView: UIStackView!
    
    private lazy var submitBtn = UIButton(type: .roundedRect)
    private lazy var clearBtn = UIButton(type: .roundedRect)
    
    var constraints = [NSLayoutConstraint]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nameTextField.borderStyle = .roundedRect
        nameTextField.delegate = self
        nameTextField.placeholder = "请输入姓名"

        idTextField.borderStyle = .roundedRect
        idTextField.delegate = self
        idTextField.placeholder = "请输入学号"

        leaveDateTextField.borderStyle = .roundedRect
        leaveDateTextField.delegate = self
        leaveDateTextField.placeholder = "请输入离校时间"

        arriveDateTextField.borderStyle = .roundedRect
        arriveDateTextField.delegate = self
        arriveDateTextField.placeholder = "请输入到校时间"

        reasonTextView.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        reasonTextView.delegate = self
        reasonTextView.layer.borderColor = .init(gray: 0.5, alpha: 0.4)
        reasonTextView.layer.borderWidth = 0.4
        reasonTextView.layer.cornerRadius = 6
        reasonTextView.textAlignment = .left
        reasonTextView.textColor = .systemGray3
        reasonTextView.font = .systemFont(ofSize: 17)
        reasonTextView.text = "请输入离校原因"

        submitBtn.setTitle("提交", for: .normal)
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.backgroundColor = .systemBlue
        submitBtn.addTarget(self, action: #selector(submitBtnOnClick), for: .touchUpInside)
        
        clearBtn.setTitle("清空", for: .normal)
        clearBtn.setTitleColor(.white, for: .normal)
        clearBtn.backgroundColor = .systemRed
        clearBtn.addTarget(self, action: #selector(clearBtnOnClick), for: .touchUpInside)
        
        totalStackView = UIStackView(arrangedSubviews: [nameTextField, idTextField, leaveDateTextField, arriveDateTextField, reasonTextView, submitBtn, clearBtn])
        totalStackView.axis = .vertical
        totalStackView.distribution = .equalSpacing
        totalStackView.spacing = 30
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
//        totalStackView.backgroundColor = .red
        view.addSubview(totalStackView)
        activeConstraints()
        
        //设置导航栏样式
        self.navigationController?.navigationBar.backgroundColor = .systemGray6
        self.navigationItem.title = "填写信息"
    }
    
    func activeConstraints() {
        //整体StackVIew的约束
        constraints.append(totalStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 100))
        constraints.append(totalStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 80))
        constraints.append(totalStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -80))
        
        //内部按钮约束

        constraints.append(submitBtn.topAnchor.constraint(equalTo: reasonTextView.bottomAnchor,constant: 30))
        constraints.append(submitBtn.trailingAnchor.constraint(equalTo: totalStackView.trailingAnchor,constant: -30))
        constraints.append(submitBtn.leadingAnchor.constraint(equalTo: totalStackView.leadingAnchor,constant: 30))
//        constraints.append(submitBtn.bottomAnchor.constraint(equalTo: clearBtn.topAnchor,constant: -30))
        
        constraints.append(clearBtn.leadingAnchor.constraint(equalTo: totalStackView.leadingAnchor,constant: 30))
        constraints.append(clearBtn.trailingAnchor.constraint(equalTo: totalStackView.trailingAnchor,constant: -30))
//        constraints.append(clearBtn.bottomAnchor.constraint(equalTo: totalStackView.bottomAnchor,constant: -30))
        constraints.append(totalStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -100))
        NSLayoutConstraint.activate(constraints)
    }
    func passParameter() {
        person.name = nameTextField.text!
        person.id = idTextField.text!
        person.leaveDate = leaveDateTextField.text!
        person.arriveDate = arriveDateTextField.text!
        person.reason = reasonTextView.text!
        person.attachImageCode = "000"
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.resignFirstResponder()
        self.view.endEditing(false)
    }
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.        
    }
    */
}

extension WriteInfoViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(false)
        return true
    }
}

extension WriteInfoViewController: UITextViewDelegate {
    
    //当点击输入框开始编辑时
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = .black
        textView.text = ""
    }
    
    //当离开输入框结束编辑时
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.textColor = .systemGray3
            textView.text = "请输入离校原因"
        }
    }
    
}

//点击事件
extension WriteInfoViewController {
    //点击”提交“按钮
    @objc private func submitBtnOnClick() {
        let vc = ViewController()
        passParameter()
        vc.person = self.person
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //点击”清除“按钮
    @objc private func clearBtnOnClick() {
        nameTextField.text = ""
        idTextField.text = ""
        leaveDateTextField.text = ""
        arriveDateTextField.text = ""
        reasonTextView.text = ""
        //为了使清空后的TextView能够显示出模拟placeholder的内容，相当于刷新
        textViewDidEndEditing(reasonTextView)
    }
}
