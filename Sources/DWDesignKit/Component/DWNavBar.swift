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
    
    var leftBarButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    var rightBarButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
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
            leftBarButton.tintColor = buttonColor
            rightBarButton.tintColor = buttonColor
        }
    }
    
    var barHeight: CGFloat = 44 {
        didSet {
            if barHeight < 44 { barHeight = 44 }
            heightAnchor.constraint(equalToConstant: barHeight).isActive = true
        }
    }
    
    func configBarButtons(_ type: DWNavBarType) {
        let config = UIImage.SymbolConfiguration(pointSize: type.imageSize, weight: .semibold)
        let image = UIImage(systemName: type.systemImageName, withConfiguration: config)
        
        switch type {
        case .pushed, .leftCloseButton:
            leftBarButton.setImage(image, for: .normal)
            leftNavBarItemStackView.addArrangedSubview(leftBarButton)
            
        case .rightCloseButton:
            rightBarButton.setImage(image, for: .normal)
            rightNavBarItemStackView.addArrangedSubview(rightBarButton)
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
            leftNavBarItemStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            leftNavBarItemStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftNavBarItemStackView.topAnchor.constraint(equalTo: topAnchor),
            leftNavBarItemStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rightNavBarItemStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
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
