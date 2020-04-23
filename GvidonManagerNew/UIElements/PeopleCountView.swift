//
//  PeopleCountView.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 23.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit
import SnapKit


final class PeopleCountView: UIView {
    
    
    private let imHuman = UIImageView()
    private let labCount = UILabel()
    
    
    var count: Int = 0 {
        didSet {
            setupLabCount()
        }
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    private func customInit() {
        backgroundColor = .backgroundBlueLight
        setupLabCount()
        setupImHuman()
    }
    
    
    override func layoutSubviews() {
        setLabCountConstraints()
        setImHumanConstraints()
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
    
    
    //MARK: SETUP
    private func setupLabCount() {
        addSubview(labCount)
        labCount.font = UIFont(name: "SFProText-Semibold", size: 14)
        labCount.text = "\(count)"
        labCount.textAlignment = .right
    }
    
    private func setupImHuman() {
        addSubview(imHuman)
        imHuman.image = #imageLiteral(resourceName: "Человек")
        imHuman.contentMode = .scaleAspectFit
    }
    
    
    //MARK: CONSTRAINTS
    private func setLabCountConstraints() {
        let trailingOffset = count < 10 ? -1 : 3
        labCount.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.snp.centerX).offset(trailingOffset)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setImHumanConstraints() {
        imHuman.snp.makeConstraints { (make) in
            make.leading.equalTo(labCount.snp.trailing).offset(2)
            make.centerY.equalToSuperview()
            make.height.equalTo(14)
            make.width.equalTo(8)
        }
    }
    
}
