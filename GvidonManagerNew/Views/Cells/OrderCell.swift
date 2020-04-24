//
//  OrderCell.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 23.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit
import SnapKit


final class OrderCell: UITableViewCell {
    
    
    static let identifier = "OrderCell"
    
    
    private let viewStatus = UIView()
    private let viewBackground = UIView()
    private let labTableNumber = TitleLabel()
    private let labTime = TitleLabel()
    private let labName = TagLabel()
    private let viewCustomerCount = PeopleCountView()
    private let labOrderNumber = UILabel()
    
    
    func configure(with item: OrderTVItem) {
        contentView.backgroundColor = .backgroundBlueLight
        viewStatus.backgroundColor = item.statusColor
        labTableNumber.text = "Стол № \(item.tableNumber)"
        labTime.text = item.date.timeString
        labName.text = item.customerName
        labOrderNumber.text = "#\(item.orderNumber)"
        viewCustomerCount.count = item.customerCount
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViewBackground()
        setupViewStatus()
        setupLabTableNumber()
        setupLabTime()
        setupLabName()
        setupViewCustomerCount()
        setupLabOrderNumber()
    }
    
    override func layoutSubviews() {
        setViewBackgroundConstraints()
        setViewStatusConstraints()
        setLabTableNumberConstraints()
        setLabTimeConstraints()
        setLabNameConstraints()
        setViewCustomerCountConstraints()
        setLabOrderNumberConstraints()
        super.layoutSubviews()
    }
    
    
    //MARK: SETUP
    private func setupViewBackground() {
        contentView.addSubview(viewBackground)
        viewBackground.backgroundColor = .white
        viewBackground.layer.cornerRadius = 24
        viewBackground.layer.masksToBounds = true
    }
    
    private func setupViewStatus() {
        viewBackground.addSubview(viewStatus)
    }
    
    private func setupLabTableNumber() {
        viewBackground.addSubview(labTableNumber)
        labTableNumber.font = labTableNumber.font.withSize(20)
        labTableNumber.textAlignment = .left
        labTableNumber.adjustsFontSizeToFitWidth = true
    }
    
    private func setupLabTime() {
        viewBackground.addSubview(labTime)
        labTime.font = labTime.font.withSize(24)
        labTime.textAlignment = .right
    }
    
    private func setupLabName() {
        viewBackground.addSubview(labName)
    }
    
    private func setupViewCustomerCount() {
        viewBackground.addSubview(viewCustomerCount)
    }
    
    private func setupLabOrderNumber() {
        viewBackground.addSubview(labOrderNumber)
        labOrderNumber.font = UIFont(name: "SFProText-Medium", size: 12)
        labOrderNumber.textColor = .lightGray
        labOrderNumber.adjustsFontSizeToFitWidth = true
    }
    
    
    //MARK: CONSTRAINTS
    private func setViewBackgroundConstraints() {
        viewBackground.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24))
        }
    }
    
    private func setViewStatusConstraints() {
        viewStatus.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(24)
        }
    }
    
    private func setLabTableNumberConstraints() {
        labTableNumber.snp.makeConstraints { (make) in
            make.leading.equalTo(viewStatus.snp.trailing).offset(12)
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(labTableNumber.font.pointSize)
        }
    }
    
    private func setLabTimeConstraints() {
        labTime.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(labTime.font.pointSize)
            make.leading.equalTo(labTableNumber.snp.trailing).offset(24).priority(1000)
        }
    }
    
    private func setLabNameConstraints() {
        labName.snp.makeConstraints { (make) in
            make.top.equalTo(labTableNumber.snp.bottom).offset(18)
            make.leading.equalTo(viewStatus.snp.trailing).offset(8)
            make.right.lessThanOrEqualToSuperview().offset(-90)
        }
    }
    
    private func setViewCustomerCountConstraints() {
        viewCustomerCount.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-12)
            make.height.equalTo(46)
            make.width.equalTo(46)
        }
    }
    
    private func setLabOrderNumberConstraints() {
        labOrderNumber.snp.makeConstraints { (make) in
            make.leading.equalTo(viewStatus.snp.trailing).offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.trailing.equalToSuperview().offset(-90)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
