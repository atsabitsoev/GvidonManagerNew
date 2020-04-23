//
//  OrdersListView.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 22.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit
import SnapKit


final class OrdersListView: UIView, OrdersListViewProtocol {
    
    
    private var controller: OrdersListControllerProtocol!
    
    
    private var tableView: UITableView!
    
    
    private var orderTVItems: [[OrderTVItem]] = [[OrderTVItem(tableNumber: "237",
                                                              customerName: "Святополк Рванисламомович-Корсаков",
                                                              orderNumber: "23456789976543",
                                                              customerCount: 3,
                                                              date: Date(),
                                                              statusColor: .yellowStatus),
                                                OrderTVItem(tableNumber: "531",
                                                            customerName: "Андрон Розетков",
                                                            orderNumber: "73922983823232",
                                                            customerCount: 4,
                                                            date: Date().addingTimeInterval(30*60),
                                                            statusColor: .yellow)]]
    
    
    func configureView(controller: OrdersListControllerProtocol) {
        self.controller = controller
        backgroundColor = .backgroundBlueLight
        setupTableView()
    }
    
    override func updateConstraints() {
        setTableViewConstraints()
        super.updateConstraints()
    }
    
    
    //MARK: SETUP
    private func setupTableView() {
        tableView = UITableView()
        tableView.backgroundColor = backgroundColor
        tableView.separatorStyle = .none
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.identifier)
        tableView.tableFooterView = UIView()
    }
    
    
    //MARK: CONSTRAINTS
    private func setTableViewConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaInsets.top)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
}


extension OrdersListView: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return orderTVItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderTVItems[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = orderTVItems[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.identifier) as! OrderCell
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    
}
