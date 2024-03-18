//
//  File.swift
//  
//
//  Created by Eunbee Kang on 3/18/24.
//

import UIKit

open class DWBaseViewController: UIViewController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        configViewHierarchy()
        configLayoutConstraints()
        configViewSettings()
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
}
