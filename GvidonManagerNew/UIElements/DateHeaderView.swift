//
//  DateHeaderView.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 24.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit
import SnapKit


final class DateHeaderView: UIView {
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    
    private let labDate = TitleLabel()
    
    
    private var text = "" {
        didSet {
            labDate.text = text
        }
    }
    
    
    private func customInit() {
        backgroundColor = .backgroundBlueLight
        setupLabDate()
    }
    
    override func updateConstraints() {
        setLabDateConstraints()
        super.updateConstraints()
    }
    
    
    func setText(_ text: String) {
        self.text = text
    }
    
    
    //MARK: SETUP
    private func setupLabDate() {
        addSubview(labDate)
        labDate.font = UIFont(name: "SFProText-Medium", size: 17)
        labDate.textAlignment = .left
    }
    
    
    //MARK: Constraints
    private func setLabDateConstraints() {
        labDate.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-4)
            make.leading.equalToSuperview().offset(48)
            make.trailing.equalToSuperview().offset(-48)
        }
    }
    
}
