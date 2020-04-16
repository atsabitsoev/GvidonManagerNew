//
//  ConfirmButton.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 16.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit

final class ConfirmButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    
    private func customInit() {
        backgroundColor = .blueButtonColor
        layer.cornerRadius = 24
        setupShadow()
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        addTarget(self, action: #selector(touchUp), for: .touchUpOutside)
    }
    
    
    @objc private func touchDown() {
        backgroundColor = .blueButtonColorDark
        setTitleColor(#colorLiteral(red: 0.8800976276, green: 0.8703172803, blue: 0.8832393289, alpha: 1), for: .normal)
    }
    
    @objc private func touchUp() {
        backgroundColor = .blueButtonColor
        setTitleColor(.white, for: .normal)
    }
    
    
    private func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2
    }

}
