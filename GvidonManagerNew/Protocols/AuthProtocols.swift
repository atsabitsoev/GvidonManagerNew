//
//  EnterPhoneView.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 16.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


protocol EnterPhoneView: UIView {
    func configureView(controller: EnterPhoneViewController)
    func activateEnteringPhone()
    func enableButSendCode(_ enabled: Bool)
}

protocol EnterPhoneViewController {
    func phoneChanged(isValid: Bool)
    func butConfirmTapped(phone: String)
}


protocol CheckCodeView: UIView {
    func configureView(controller: CheckCodeViewController)
    func clearCode()
    func activateEnteringCode()
}

protocol CheckCodeViewController {
    func codeEntered(code: String)
}
