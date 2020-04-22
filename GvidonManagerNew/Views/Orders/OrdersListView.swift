//
//  OrdersListView.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 22.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


final class OrdersListView: UIView, OrdersListViewProtocol {
    
    
    private var controller: OrdersListControllerProtocol!
    
    
    func configureView(controller: OrdersListControllerProtocol) {
        self.controller = controller
        backgroundColor = .backgroundBlueLight
    }
    
}
