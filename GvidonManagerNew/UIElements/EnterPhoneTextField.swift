//
//  EnterPhoneTextField.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 16.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit
import PhoneNumberKit


final class EnterPhoneTextField: PhoneNumberTextField {
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    
    private let phoneCode: String = "+7"
    

    private func customInit() {
        textColor = .white
        font = UIFont(name: "SFProText-Semibold", size: 18)!
        attributedPlaceholder = NSMutableAttributedString(string: "(000) 000-0000",
                                                          attributes: [NSAttributedString.Key.font : font!,
                                                                       NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        backgroundColor = .rose
        tintColor = .blueButtonColor
        layer.cornerRadius = 21
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 59, height: 42))
        let whiteRoundedView = UIView(frame: leftView.bounds.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)))
        whiteRoundedView.backgroundColor = .white
        whiteRoundedView.layer.cornerRadius = 21
        let labPhoneCode = UILabel(frame: whiteRoundedView.bounds)
        labPhoneCode.text = phoneCode
        labPhoneCode.font = font
        labPhoneCode.textAlignment = .center
        whiteRoundedView.addSubview(labPhoneCode)
        leftView.addSubview(whiteRoundedView)
        leftViewMode = .always
        self.leftView = leftView
    }

}
