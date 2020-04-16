//
//  EnterPhoneView.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 16.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation


protocol EnterPhoneView {
    func configureView(delegate: EnterPhoneViewDelegate)
    func activateEnteringPhone()
}

protocol EnterPhoneViewDelegate {
    func phoneEntered(phone: String)
}
