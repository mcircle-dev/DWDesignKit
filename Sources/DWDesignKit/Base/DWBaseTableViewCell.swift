//
//  DWBaseTableViewCell.swift
//
//
//  Created by Eunbee Kang on 3/18/24.
//

import UIKit

open class DWBaseTableViewCell: UITableViewCell {
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
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
