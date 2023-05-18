//
//  APIService.swift
//  EmployeesMVVM
//
//  Created by Kuanysh al-Khattab Auyelgazy on 18.05.2023.
//

import Foundation

class APIService: NSObject {

    private let sourcesURL = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!

    func apiToGetEmployeeData(completion: @escaping (Employees) -> ()) {
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {

                let jsonDecoder = JSONDecoder()

                let empData = try? jsonDecoder.decode(Employees.self, from: data)
                guard let empData = empData else { return }
                completion(empData)
            }
        }.resume()
    }
}
