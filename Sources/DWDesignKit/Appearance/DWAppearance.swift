//
//  DWAppearance.swift
//
//
//  Created by Eunbee Kang on 3/25/24.
//

import UIKit

public protocol DWAppearance {
    var mainBackgroundColor: UIColor { get set }
    var primaryColor: UIColor { get set }
    var secondaryColor: UIColor { get set }
    
    var navBarBackgroundColor: UIColor { get set }
    var navBarTitleColor: UIColor { get set }
    var navBarButtonColor: UIColor { get set }
    
    // TODO: - 추가 예정
    // 버튼 배경, 텍스트 색상
    // 레이블 텍스트 색상
    // 기본 폰트 등
}

public class DWDefaultAppearance: DWAppearance {
    public var mainBackgroundColor: UIColor = .systemBackground
    public var primaryColor: UIColor = .blue
    public var secondaryColor: UIColor = .lightGray
    
    public var navBarBackgroundColor: UIColor = .systemBackground
    public var navBarTitleColor: UIColor = .black
    public var navBarButtonColor: UIColor = .blue
    
    public init() { }
}
