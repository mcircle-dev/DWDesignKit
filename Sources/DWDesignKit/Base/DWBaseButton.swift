//
//  DWBaseButton.swift
//
//
//  Created by Eunbee Kang on 3/25/24.
//

import UIKit

open class DWBaseButton: UIButton {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configView() { }
}
