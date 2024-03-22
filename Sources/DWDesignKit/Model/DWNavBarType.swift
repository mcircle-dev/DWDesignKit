//
//  DWNavBarType.swift
//  
//
//  Created by Eunbee Kang on 3/21/24.
//

import Foundation

public enum DWNavBarType {
    case pushed
    case leftCloseButton
    case rightCloseButton
    
    var imageSize: CGFloat {
        switch self {
        case .pushed:
            return 22
            
        case .leftCloseButton, .rightCloseButton:
            return 17
        }
    }
    
    var systemImageName: String {
        switch self {
        case .pushed:
            return "chevron.left"
            
        case .leftCloseButton, .rightCloseButton:
            return "xmark"
        }
    }
    
    var leadingInset: CGFloat {
        switch self {
        case .pushed: return 8
        case .leftCloseButton: return 16
        case .rightCloseButton: return 0
        }
    }
    
    var trailingInset: CGFloat {
        switch self {
        case .pushed: return 0
        case .leftCloseButton: return 0
        case .rightCloseButton: return 16
        }
    }
}
