//
//  DWAppearanceManager.swift
//
//
//  Created by Eunbee Kang on 3/25/24.
//

import UIKit

import RxCocoa
import RxSwift

public class DWAppearanceManager {
    
    public static let shared = DWAppearanceManager()
    private init() { }
    
    lazy var publisher: BehaviorRelay<DWAppearance> = BehaviorRelay(value: appearance)
    
    public var appearance: DWAppearance = DWDefaultAppearance() {
        didSet {
            publisher.accept(appearance)
        }
    }
}
