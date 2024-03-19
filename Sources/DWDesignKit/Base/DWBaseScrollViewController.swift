//
//  DWBaseScrollViewController.swift
//
//
//  Created by Eunbee Kang on 3/18/24.
//

import UIKit

open class DWBaseScrollViewController: DWBaseViewController {
    
    open var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    public let contentView = UIView()
    
    open var isScrollEnabled: Bool = true {
        didSet {
            updateScrollEnabled()
        }
    }
    
    open var isShowingVerticalScrollIndicator: Bool = false {
        didSet {
            updateShowingVerticalScrollIndicator()
        }
    }
    
    private func updateScrollEnabled() {
        scrollView.isScrollEnabled = isScrollEnabled
    }
    
    private func updateShowingVerticalScrollIndicator() {
        scrollView.showsVerticalScrollIndicator = isShowingVerticalScrollIndicator
    }
    
    open override func configViewSettings() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override open func configViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    override open func configLayoutConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ])
    }
}
