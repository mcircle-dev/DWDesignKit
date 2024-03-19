//
//  File.swift
//  
//
//  Created by Eunbee Kang on 3/18/24.
//

import UIKit

import RxCocoa
import RxSwift

open class DWBaseViewController: UIViewController {
    
    public let disposeBag = DisposeBag()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        configViewHierarchy()
        configLayoutConstraints()
        configViewSettings()
        configRx()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configViewHierarchy() { }
    open func configLayoutConstraints() { }
    open func configViewSettings() { }
    open func configRx() { }
}
