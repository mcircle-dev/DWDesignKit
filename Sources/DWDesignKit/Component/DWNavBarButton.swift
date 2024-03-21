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
    }
}
