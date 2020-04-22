//
//  OrdersNC.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 22.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


final class OrdersNC: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    
    private func setupNavBar() {
        navigationBar.barTintColor = .backgroundBlueLight
        navigationBar.tintColor = .rose
        navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [.font: UIFont(name: "SFProText-Semibold", size: 17)!, .foregroundColor: UIColor.blueDarkTitleColor]
    }
}
