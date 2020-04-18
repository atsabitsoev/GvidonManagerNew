//
//  RoundedShadowTextField.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 18.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


final class RoundedShadowTextField: UITextField {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    
    override var placeholder: String? {
        didSet {
            attributedPlaceholder = NSMutableAttributedString(string: placeholder ?? "",
                                                              attributes: [NSAttributedString.Key.font : font!,
                                                                           NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        }
    }


    private func customInit() {
        textColor = .white
        font = UIFont(name: "SFProText-Semibold", size: 18)!
        backgroundColor = .rose
        tintColor = .blueButtonColor
        layer.cornerRadius = 21
        setupShadow()
    }
    
    
    private func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
