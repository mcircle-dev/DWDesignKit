//
//  DWNavBar.swift
//
//
//  Created by Eunbee Kang on 3/19/24.
//

import UIKit

final class DWNavBarView: DWBaseView {
    
    private var leftNavBarItemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    private var rightNavBarItemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    var leftBarCloseButton = DWNavBarButton(type: .leftCloseButton)
    var rightBarCloseButton = DWNavBarButton(type: .rightCloseButton)
    var leftBarBackButton = DWNavBarButton(type: .pushed)
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    var titleColor: UIColor? {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    var buttonColor: UIColor? {
        didSet {
            leftBarCloseButton.tintColor = buttonColor
            rightBarCloseButton.tintColor = buttonColor
            leftBarBackButton.tintColor = buttonColor
        }
    }
    
    var barHeight: CGFloat = 44 {
        didSet {
            if barHeight < 44 { barHeight = 44 }
            barHeightAnchor = heightAnchor.constraint(equalToConstant: barHeight)
        }
    }
    
    private var barHeightAnchor: NSLayoutConstraint? {
        didSet {
            oldValue?.isActive = false
            barHeightAnchor?.isActive = true
        }
    }
    
    var barType: DWNavBarType = .pushed {
        didSet {
            removeBarButtons()
            configBarButtons()
        }
    }
    
    private var leftStackViewLeadingConstraint: NSLayoutConstraint? {
        didSet {
            oldValue?.isActive = false
            leftStackViewLeadingConstraint?.isActive = true
        }
    }
    
    private func removeBarButtons() {
        leftNavBarItemStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        rightNavBarItemStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func configBarButtons() {
        switch barType {
        case .pushed:
            leftNavBarItemStackView.addArrangedSubview(leftBarBackButton)
                
        case .leftCloseButton:
            leftNavBarItemStackView.addArrangedSubview(leftBarCloseButton)
            
        case .rightCloseButton:
            rightNavBarItemStackView.addArrangedSubview(rightBarCloseButton)
        }
    }

    override func configViewSettings() {
        [leftNavBarItemStackView, rightNavBarItemStackView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    override func configViewHierarchy() {
        addSubview(leftNavBarItemStackView)
        addSubview(rightNavBarItemStackView)
        addSubview(titleLabel)
    }
    
    override func configLayoutConstraints() {
        NSLayoutConstraint.activate([
            leftNavBarItemStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftNavBarItemStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftNavBarItemStackView.topAnchor.constraint(equalTo: topAnchor),
            leftNavBarItemStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rightNavBarItemStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightNavBarItemStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightNavBarItemStackView.topAnchor.constraint(equalTo: topAnchor),
            rightNavBarItemStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leftNavBarItemStackView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: rightNavBarItemStackView.leadingAnchor, constant: -16)
        ])
    }
}
