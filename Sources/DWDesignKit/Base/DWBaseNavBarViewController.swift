//
//  DWBaseNavViewController.swift
//
//
//  Created by Eunbee Kang on 3/21/24.
//

import UIKit

open class DWBaseNavBarViewController: DWBaseViewController {
    
    private let appearanceManager = DWAppearanceManager.shared
    
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
    
    public lazy var navTitleColor: UIColor = appearanceManager.appearance.navBarTitleColor {
        didSet {
            appearanceManager.appearance.navBarTitleColor = navTitleColor
        }
    }
    
    public lazy var navButtonColor: UIColor = appearanceManager.appearance.navBarButtonColor {
        didSet {
            appearanceManager.appearance.navBarButtonColor = navButtonColor
        }
    }
    
    public lazy var navBarBackgroundColor: UIColor = appearanceManager.appearance.navBarBackgroundColor {
        didSet {
            appearanceManager.appearance.navBarBackgroundColor = navBarBackgroundColor
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
    
    public var isSwipeBackGestureEnabled: Bool = true {
        didSet {
            navigationController?.interactivePopGestureRecognizer?.isEnabled = isSwipeBackGestureEnabled
        }
    }
    
    // MARK: - Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        addCustomNavBarView()
        setContentView()
        
        setBackButtonAction(popAction())
        setCloseButtonAction(dismissAction())
    }
    
    // MARK: - Public helpers
    
    public func addCustomNavBarView(
        with type: DWNavBarType = .pushed,
        title: String = "",
        height: CGFloat = 44
    ) {
        setNativeNavigationController()
        
        navTitle = title
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
    
    public func setBackButtonAction(_ action: @escaping () -> Void) {
        navBar.leftBarBackButton.rx.tap
            .bind(with: self) { owner, _ in
                action()
            }
            .disposed(by: disposeBag)
    }
    
    public func setCloseButtonAction(_ action: @escaping () -> Void) {
        navBar.leftBarCloseButton.rx.tap
            .bind(with: self) { owner, _ in
                action()
            }
            .disposed(by: disposeBag)
        
        navBar.rightBarCloseButton.rx.tap
            .bind(with: self) { owner, _ in
                action()
            }
            .disposed(by: disposeBag)
    }
    
    // MARK: - Private helpers
    
    private func popAction() -> (() -> Void) {
        let pop = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            print("")
        }
        return pop
    }
    
    private func dismissAction() -> (() -> Void) {
        let dismiss = { [weak self] in
            self?.dismiss(animated: true, completion: nil)
            print("")
        }
        return dismiss
    }
    
    private func setNativeNavigationController() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
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
    
    open override func configAppearance() {
        super.configAppearance()
        
        appearanceManager.publisher.asDriver()
            .drive(with: self) { owner, value in
                owner.upperBackgroundView.backgroundColor = value.navBarBackgroundColor
                owner.navBar.backgroundColor = value.navBarBackgroundColor
                owner.navBar.titleColor = value.navBarTitleColor
                owner.navBar.buttonColor = value.navBarButtonColor
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UIGestureRecognizerDelegate

extension DWBaseNavBarViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        navigationController?.viewControllers.count ?? 1 > 1
    }
}
