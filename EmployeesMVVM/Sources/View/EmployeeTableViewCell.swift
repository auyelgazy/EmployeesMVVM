//
//  EmployeeTableViewCell.swift
//  EmployeesMVVM
//
//  Created by Kuanysh al-Khattab Auyelgazy on 18.05.2023.
//

import UIKit
import SnapKit

class EmployeeTableViewCell: UITableViewCell {

    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var employee : EmployeeData? {
        didSet {
            nameLabel.text = employee?.name
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        contentView.addSubview(nameLabel)
    }

    private func setupLayout() {
        nameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
