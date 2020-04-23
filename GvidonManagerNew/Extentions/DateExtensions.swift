//
//  DateExtensions.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 23.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation


extension Date {
    
    var timeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
