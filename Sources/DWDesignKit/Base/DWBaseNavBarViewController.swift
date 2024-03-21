//
//  DWBaseNavViewController.swift
//
//
//  Created by Eunbee Kang on 3/21/24.
//

import UIKit

open class DWBaseNavBarViewController: DWBaseViewController {
    
    private var upperBackgroundView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var navBar = DWNavBarView()
    
    public var contentView: UIView  = {
        let view = UIView()
        
        return view
    }()
    
    // MARK: - Public properties for custom navigation bar
    
    public var navTitle: String = "" {
        didSet {
            navBar.titleText = navTitle
        }
    }
    
    public var navTitleColor: UIColor = .black {
        didSet {
            navBar.titleColor = navTitleColor
        }
    }
    
    public var navButtonColor: UIColor = .black {
        didSet {
            navBar.buttonColor = navButtonColor
        }
    }
    
    public var navBarBackgroundColor: UIColor? {
        didSet {
            upperBackgroundView.backgroundColor = navBarBackgroundColor
            navBar.backgroundColor = navBarBackgroundColor
        }
    }
    
    public var navBarHeight: CGFloat = 44 {
        didSet {
            navBar.barHeight = navBarHeight
        }
    }
    
    public var navBarType: DWNavBarType = .pushed {
        didSet {
            navBar.barType = navBarType
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        addCustomNavBarView()
        setContentView()
    }
    
    public func addCustomNavBarView(
        with type: DWNavBarType = .pushed,
        title: String = "",
        backgroundColor: UIColor = .clear,
        height: CGFloat = 44
    ) {
        setNativeNavigation()
        
        navTitle = title
        navBarBackgroundColor = backgroundColor
        navBar.barHeight = height
        navBar.barType = type
        
        if view.subviews.contains(navBar) { return }
        
        view.addSubview(upperBackgroundView)
        view.addSubview(navBar)
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        upperBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upperBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            upperBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upperBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            upperBackgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            navBar.topAnchor.constraint(equalTo: upperBackgroundView.bottomAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    public func removeCustomNavBarView() {
        contentView.removeFromSuperview()
        view.addSubview(contentView)
        setContentViewConstraints(withTopAnchor: view.topAnchor)
        
        if view.subviews.contains(upperBackgroundView) {
            upperBackgroundView.removeFromSuperview()
        }
        if view.subviews.contains(navBar) {
            navBar.removeFromSuperview()
        }
    }
    
    // MARK: - Private helpers
    
    private func setNativeNavigation() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setContentView() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setContentViewConstraints(withTopAnchor: navBar.bottomAnchor)
    }
    
    private func setContentViewConstraints(withTopAnchor anchor: NSLayoutYAxisAnchor) {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: anchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
