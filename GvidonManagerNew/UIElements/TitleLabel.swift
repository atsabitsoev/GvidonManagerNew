//
//  TitleLabel.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 16.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit

final class TitleLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    

    private func customInit() {
        textColor = .blueDarkTitleColor
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
        font = UIFont(name: "SFProText-Semibold", size: 18)!
    }

}
