//
//  EnterPhoneView.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 16.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


protocol EnterPhoneViewProtocol: UIView {
    func configureView(controller: EnterPhoneControllerProtocol)
    func activateEnteringPhone()
    func enableButSendCode(_ enabled: Bool)
}

protocol EnterPhoneControllerProtocol: UIViewController {
    func phoneChanged(isValid: Bool)
    func butConfirmTapped(phone: String)
}


protocol CheckCodeViewProtocol: UIView {
    func configureView(controller: CheckCodeControllerProtocol)
    func clearCode()
    func activateEnteringCode()
}

protocol CheckCodeControllerProtocol: UIViewController {
    func codeEntered(code: String)
}
