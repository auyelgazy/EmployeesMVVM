//
//  ViewController.swift
//  EmployeesMVVM
//
//  Created by Kuanysh al-Khattab Auyelgazy on 17.05.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var employeesViewModel: EmployeesViewModel!

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    private var dataSource: EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        callToViewModelForUIUpdate()
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.top.right.bottom.left.equalToSuperview()
        }
    }

    func callToViewModelForUIUpdate() {
        self.employeesViewModel = EmployeesViewModel()
        self.employeesViewModel.bindEmployeesViewModelToController = {
            self.updateDataSource()
        }
    }

    func updateDataSource() {
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "cell", items: self.employeesViewModel.employeeData.data, configureCell: { (cell, evm) in
            cell.nameLabel.text = evm.name
        })

        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
}

