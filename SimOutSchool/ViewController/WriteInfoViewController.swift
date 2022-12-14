//
//  WriteInfoViewController.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/10/1.
//

import UIKit
import Photos
import PhotosUI

//结构体和类的区别： 结构体在栈、类在堆，
//栈为什么比堆快
//深拷贝、浅拷贝
//swift 写时复制
//intrinsicContentsize
//单例
//bounds和frame的区别
//事件传递及响应链
class WriteInfoViewController: UIViewController {

    private lazy var person = Person(name: "", id: "", leaveDate: "", arriveDate: "", reason: "", attachImageCode: "", schoolClass: "")
    
    private lazy var nameTextField = UITextField()
    private lazy var idTextField = UITextField()
    private lazy var schoolClassTextField = UITextField()
    private lazy var leaveDateTextField = UITextField()
    private lazy var arriveDateTextField = UITextField()
    private lazy var reasonTextView = UITextView()
    private lazy var attachImage = UIImageView()
    
    private lazy var readLocalDataBtn = UIButton(type: .roundedRect)
    
    private lazy var attachSelectBtn = UIButton(type: .roundedRect)
    private lazy var submitBtn = UIButton(type: .roundedRect)
    private lazy var clearBtn = UIButton(type: .roundedRect)
    
    private var totalStackView: UIStackView!

    
    var constraints = [NSLayoutConstraint]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        let data = UserDefaults.standard.data(forKey: "Person")
        do {
            if let data = data {
                person = try JSONDecoder().decode(Person.self, from: data)
            }
        } catch {
            print("Decode Failed")
        }
        nameTextField.borderStyle = .roundedRect
        nameTextField.delegate = self
        nameTextField.placeholder = "请输入姓名"

        idTextField.borderStyle = .roundedRect
        idTextField.delegate = self
        idTextField.placeholder = "请输入学号"

        schoolClassTextField.borderStyle = .roundedRect
        schoolClassTextField.delegate = self
        schoolClassTextField.placeholder = "请输入班级，例：软工 1901"
        
        leaveDateTextField.borderStyle = .roundedRect
        leaveDateTextField.delegate = self
        leaveDateTextField.placeholder = "请输入离校时间，例：2022-12-1"

        arriveDateTextField.borderStyle = .roundedRect
        arriveDateTextField.delegate = self
        arriveDateTextField.placeholder = "请输入到校时间，例：12点"

        
        reasonTextView.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        reasonTextView.delegate = self
        reasonTextView.layer.borderColor = .init(gray: 0.5, alpha: 0.4)
        reasonTextView.layer.borderWidth = 0.4
        reasonTextView.layer.cornerRadius = 6
        reasonTextView.textAlignment = .left
        reasonTextView.textColor = .systemGray3
        reasonTextView.font = .systemFont(ofSize: 17)
        reasonTextView.text = "请输入离校原因"

        attachImage.image = UIImage(systemName: "photo.on.rectangle")
        attachImage.translatesAutoresizingMaskIntoConstraints = false
        attachImage.contentMode = .scaleAspectFit
//        attachImage.backgroundColor = UIColor(red: 2, green: 2, blue: 3, alpha: 1)
        
        attachSelectBtn.setTitle("选择附件", for: .normal)
        attachSelectBtn.setTitleColor(.systemGray, for: .normal)
        attachSelectBtn.backgroundColor = .lightGray
        attachSelectBtn.addTarget(self, action: #selector(selectImageBtnOnClick), for: .touchUpInside)
        
        submitBtn.setTitle("提交", for: .normal)
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.backgroundColor = .systemBlue
        submitBtn.addTarget(self, action: #selector(submitBtnOnClick), for: .touchUpInside)
        
        clearBtn.setTitle("清空", for: .normal)
        clearBtn.setTitleColor(.white, for: .normal)
        clearBtn.backgroundColor = .systemRed
        clearBtn.addTarget(self, action: #selector(clearBtnOnClick), for: .touchUpInside)
        
        totalStackView = UIStackView(arrangedSubviews: [readLocalDataBtn, idTextField, nameTextField, schoolClassTextField, leaveDateTextField, arriveDateTextField, reasonTextView, attachImage, attachSelectBtn, submitBtn, clearBtn])
        totalStackView.axis = .vertical
        totalStackView.distribution = .fill
        totalStackView.spacing = 20
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        readLocalDataBtn.setTitle("历史记录", for: .normal)
        readLocalDataBtn.backgroundColor = .systemGray3
        readLocalDataBtn.setTitleColor(.white, for: .normal)
        readLocalDataBtn.addTarget(self, action: #selector(readLocalDataOnClick), for: .touchUpInside)
        view.addSubview(totalStackView)
//        view.addSubview(readLocalDataBtn)
        activeConstraints()
        //设置导航栏样式
        self.navigationController?.navigationBar.backgroundColor = .systemGray6
        self.navigationItem.title = "填写信息"
    }
    
    func activeConstraints() {
        //整体StackVIew的约束
        constraints.append(totalStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 50))
        constraints.append(totalStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 80))
        constraints.append(totalStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -80))
        constraints.append(totalStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -40))
        
        //内部按钮约束
        constraints.append(attachSelectBtn.topAnchor.constraint(equalTo: attachImage.bottomAnchor, constant: 30))
        constraints.append(attachSelectBtn.leadingAnchor.constraint(equalTo: totalStackView.leadingAnchor, constant: 80))
        constraints.append(attachSelectBtn.trailingAnchor.constraint(equalTo: totalStackView.trailingAnchor, constant: -80))
        
        constraints.append(submitBtn.trailingAnchor.constraint(equalTo: totalStackView.trailingAnchor, constant: -30))
        constraints.append(submitBtn.leadingAnchor.constraint(equalTo: totalStackView.leadingAnchor, constant: 30))
        
        constraints.append(clearBtn.leadingAnchor.constraint(equalTo: totalStackView.leadingAnchor, constant: 30))
        constraints.append(clearBtn.trailingAnchor.constraint(equalTo: totalStackView.trailingAnchor, constant: -30))
        

        //附件约束
        constraints.append(attachImage.heightAnchor.constraint(equalToConstant: 130))
//        constraints.append(attachImage.topAnchor.constraint(equalTo: reasonTextView.bottomAnchor, constant: 10))
//        constraints.append(attachImage.bottomAnchor.constraint(equalTo: attachSelectBtn.topAnchor, constant: 0))

        NSLayoutConstraint.activate(constraints)
    }
    func passParameter() {
        person.name = nameTextField.text!
        person.id = idTextField.text!
        person.schoolClass = schoolClassTextField.text!
        person.leaveDate = leaveDateTextField.text!
        person.arriveDate = arriveDateTextField.text!
        person.reason = reasonTextView.text!
        
    }
    func readLocalData() {
        nameTextField.text = person.name
        idTextField.text = person.id
        schoolClassTextField.text = person.schoolClass
        leaveDateTextField.text = person.leaveDate
        arriveDateTextField.text = person.arriveDate
        if person.reason != "请输入离校原因" {
            reasonTextView.textColor = .black
            reasonTextView.text = person.reason
        }
        let imageData = Data(base64Encoded: person.attachImageCode)
        attachImage.image = UIImage(data: imageData!)
        
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
        if textView.text == "请输入离校原因" {
            textView.text = ""
        }
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
    
    //点击”选择附件“按钮
    @objc private func selectImageBtnOnClick() {
        var config = PHPickerConfiguration(photoLibrary: .shared())//创建一个配置实例
        config.selectionLimit = 1 //配置选择内容的数量
        config.filter = .images //配置选择内容的类型
        let photoPickerVC = PHPickerViewController(configuration: config)
        photoPickerVC.delegate = self
        present(photoPickerVC, animated: true)
    }
    
    //点击”提交“按钮
    @objc private func submitBtnOnClick() {
        let vc = ViewController()
        passParameter()
        do {
            let data = try JSONEncoder().encode(person)
            UserDefaults.standard.set(data, forKey: "Person")
        } catch {
            print("Encode Failed")
        }
        vc.person = self.person
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //点击”清除“按钮
    @objc private func clearBtnOnClick() {
        nameTextField.text = ""
        idTextField.text = ""
        schoolClassTextField.text = ""
        leaveDateTextField.text = ""
        arriveDateTextField.text = ""
        reasonTextView.text = ""
        attachImage.image = UIImage(systemName: "photo.on.rectangle")
        //为了使清空后的TextView能够显示出模拟placeholder的内容，相当于刷新
        textViewDidEndEditing(reasonTextView)
    }
    
    @objc private func readLocalDataOnClick() {
        readLocalData()
    }
}

extension WriteInfoViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] reading, error in//[weak self]避免循环引用
                guard let image = reading as? UIImage,
                      error == nil,
                      let self = self else{
                    return
                }
                let imageCode: String = (image.pngData()?.base64EncodedString())!
                self.person.attachImageCode = imageCode
                
                let imageData = Data(base64Encoded: self.person.attachImageCode)
                if let data = imageData {
                    DispatchQueue.main.async {
                        self.attachImage.image = UIImage(data: data)
                    }
                }
            }
        }
       //
        
    }
}

