//
//  DWRxBaseViewController.swift
//  
//
//  Created by Eunbee Kang on 3/18/24.
//

import UIKit

import RxSwift

open class DWRxBaseViewController: DWBaseViewController {
    
    public let disposeBag = DisposeBag()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        configViewRx()
    }
    
    open func configViewRx() { }
}
