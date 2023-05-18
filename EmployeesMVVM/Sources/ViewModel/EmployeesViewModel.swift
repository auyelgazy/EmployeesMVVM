//
//  EmployeesViewModel.swift
//  EmployeesMVVM
//
//  Created by Kuanysh al-Khattab Auyelgazy on 18.05.2023.
//

import Foundation

class EmployeesViewModel: NSObject {

    private var apiService: APIService!
    private(set) var employeeData: Employees! {
        didSet {
            self.bindEmployeesViewModelToController()
        }
    }

    var bindEmployeesViewModelToController: (() -> ()) = {}

    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetData()
    }

    func callFuncToGetData() {
        self.apiService.apiToGetEmployeeData { (employeeData) in
            self.employeeData = employeeData
        }
    }
}
