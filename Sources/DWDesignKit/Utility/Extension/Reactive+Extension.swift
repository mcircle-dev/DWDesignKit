//
//  File.swift
//  
//
//  Created by Eunbee Kang on 3/19/24.
//

import UIKit

import RxCocoa
import RxSwift

extension Reactive where Base: DWBaseViewController {
    
    @available(iOS 13.0, *)
    var isShowingActivityIndicator: Binder<Bool> {
        return Binder(base) { base, value in
            value ? base.showActivityIndicator() : base.hideActivityIndicator()
        }
    }
}
