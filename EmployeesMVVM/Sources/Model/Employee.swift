//
//  Employee.swift
//  EmployeesMVVM
//
//  Created by Kuanysh al-Khattab Auyelgazy on 18.05.2023.
//

import Foundation

struct Employees: Decodable {
    let status: String
    let data: [EmployeeData]
}

struct EmployeeData: Decodable {
    let id: Int
    let name: String
    let salary: Int
    let age: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
        case profileImage = "profile_image"
    }
}
