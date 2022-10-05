//
//  Person.swift
//  SimOutSchool
//
//  Created by 陈龙 on 2022/10/3.
//

import Foundation

class Person {
    var name: String = ""
    var id: String = ""
    var leaveDate: String = ""
    var arriveDate: String = ""
    var reason: String = ""
    var attachImageCode: String = ""
    
    init(name: String, id: String, leaveDate: String, arriveDate: String, reason: String, attachImageCode: String) {
        self.name = name
        self.id = id
        self.leaveDate = leaveDate
        self.arriveDate = arriveDate
        self.reason = reason
        self.attachImageCode = attachImageCode
    }
}
