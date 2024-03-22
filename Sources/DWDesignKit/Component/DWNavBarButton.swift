//
//  DWNavBarButton.swift
//
//
//  Created by Eunbee Kang on 3/21/24.
//

import UIKit

final class DWNavBarButton: UIButton {
        
    private var type: DWNavBarType
    
    init(type: DWNavBarType) {
        self.type = type
        super.init(frame: .zero)
        
        configButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configButton() {
        let config = UIImage.SymbolConfiguration(pointSize: type.imageSize, weight: .semibold)
        let image = UIImage(systemName: type.systemImageName, withConfiguration: config)
        setImage(image, for: .normal)
        
        contentEdgeInsets = UIEdgeInsets(top: 0, left: type.leadingInset, bottom: 0, right: type.trailingInset)
        configContentAlignment()
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        widthAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func configContentAlignment() {
        switch type {
        case .pushed, .leftCloseButton:
            contentHorizontalAlignment = .leading
            
        case .rightCloseButton:
            contentHorizontalAlignment = .trailing
        }
    }
}
