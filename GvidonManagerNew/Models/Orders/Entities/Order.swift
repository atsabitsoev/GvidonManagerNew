//
//  Order.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 22.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation


struct Order {
    var id: String
    var number: String
    var date: Date
    var customerName: String
    var table: Table
    var status: OrderStatus
}


struct Table {
    var id: String
    var options: [String]
    var size: Size
}


struct Size {
    var id: String
    var name: String
    var maxCount: String
}


enum OrderStatus {
    case waiting
    case approved
    case deniedByManager
    case deniedByUser
    case finished
}
