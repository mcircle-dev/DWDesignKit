//
//  DWBaseViewController.swift
//
//
//  Created by Eunbee Kang on 3/18/24.
//

import UIKit

import RxCocoa
import RxSwift

open class DWBaseViewController: UIViewController {
    
    public let disposeBag = DisposeBag()
    
    // MARK: - For custom navigation bar
    
    private var upperBackgroundView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    public var dwNavBar = DWNavBarView()
    
    public var navTitle: String? {
        didSet {
            title = navTitle
        }
    }
    
    public var dwNavBarBackgroundColor: UIColor? {
        didSet {
            upperBackgroundView.backgroundColor = dwNavBarBackgroundColor
            dwNavBar.backgroundColor = dwNavBarBackgroundColor
        }
    }
    
    // MARK: - LifeCycle
    
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
    
    public func addCustomNavBarView(
        with type: DWNavBarType = .pushed,
        title: String = "",
        backgroundColor: UIColor = .white,
        height: CGFloat = 44
    ) {
        navigationController?.isNavigationBarHidden = true
        
        setCustomNavBarTitle(title)
        dwNavBarBackgroundColor = backgroundColor
        dwNavBar.barHeight = height
        dwNavBar.configBarButtons(type)
        
        view.addSubview(upperBackgroundView)
        view.addSubview(dwNavBar)
        
        dwNavBar.translatesAutoresizingMaskIntoConstraints = false
        upperBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upperBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            upperBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upperBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            upperBackgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            dwNavBar.topAnchor.constraint(equalTo: upperBackgroundView.bottomAnchor),
            dwNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dwNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    public func removeCustomNavBarView() {
        dwNavBar.removeFromSuperview()
    }
    
    public func setCustomNavBarTitle(_ title: String) {
        dwNavBar.titleText = title
    }
    
    open func configViewHierarchy() { }
    open func configLayoutConstraints() { }
    open func configViewSettings() { }
    open func configRx() { }
}
