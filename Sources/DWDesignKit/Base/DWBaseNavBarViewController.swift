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
    
    public var dwNavBarBackgroundColor: UIColor? {
        didSet {
            upperBackgroundView.backgroundColor = dwNavBarBackgroundColor
            navBar.backgroundColor = dwNavBarBackgroundColor
        }
    }
    
    public func addCustomNavBarView(
        with type: DWNavBarType = .pushed,
        title: String = "",
        backgroundColor: UIColor = .white,
        height: CGFloat = 44
    ) {
        setNativeNavigation()
        
        navTitle = title
        dwNavBarBackgroundColor = backgroundColor
        navBar.barHeight = height
        navBar.configBarButtons(type)
        
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
}
