//
//  ActualOrdersListController.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 22.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


final class ActualOrdersListController: UIViewController, OrdersListControllerProtocol {
    
    
    private var ordersListView: OrdersListViewProtocol!
    
    
    override func loadView() {
        ordersListView = OrdersListView()
        ordersListView.configureView(controller: self)
        view = ordersListView
        title = "Актуальные"
    }
    
    
}
