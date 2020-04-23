//
//  TagLabel.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 23.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


final class TagLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    
    private let topInset: CGFloat = 6
    private let bottomInset: CGFloat = 6
    private let leftInset: CGFloat = 8
    private let rightInset: CGFloat = 8
    

    private func customInit() {
        layer.cornerRadius = 12
        textAlignment = .center
        adjustsFontSizeToFitWidth = false
        font = UIFont(name: "SFProText-Regular", size: 12)!
        backgroundColor = #colorLiteral(red: 0.9601761699, green: 0.9601761699, blue: 0.9601761699, alpha: 1)
        numberOfLines = 1
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    
}
