//
//  DWBaseCollectionViewCell.swift
//
//
//  Created by Eunbee Kang on 3/18/24.
//

import UIKit

open class DWBaseCollectionViewCell: UICollectionViewCell {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        configViewHierarchy()
        configLayoutConstraints()
        configViewSettings()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configViewHierarchy() { }
    open func configLayoutConstraints() { }
    open func configViewSettings() { }
}
