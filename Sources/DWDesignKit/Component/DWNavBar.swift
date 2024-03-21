//
//  DWNavBar.swift
//
//
//  Created by Eunbee Kang on 3/19/24.
//

import UIKit

public enum DWNavBarType {
    case pushed
    case leftCloseButton
    case rightCloseButton
    
    var imageConfig: UIImage.SymbolConfiguration {
        switch self {
        case .pushed:
            return UIImage.SymbolConfiguration(pointSize: 22, weight: .semibold)
            
        case .leftCloseButton:
            return UIImage.SymbolConfiguration(pointSize: 17, weight: .semibold)
            
        case .rightCloseButton:
            return UIImage.SymbolConfiguration(pointSize: 17, weight: .semibold)
        }
    }
}

public final class DWNavBarView: DWBaseView {
    
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
    
    public var leftBarButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    public var rightBarButton: UIButton = {
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
    
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    public var titleColor: UIColor? {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    public var buttonColor: UIColor? {
        didSet {
            leftBarButton.tintColor = buttonColor
            rightBarButton.tintColor = buttonColor
        }
    }
    
    public var barHeight: CGFloat = 44 {
        didSet {
            if barHeight < 44 { barHeight = 44 }
            heightAnchor.constraint(equalToConstant: barHeight).isActive = true
        }
    }
    
    func configBarButtons(_ type: DWNavBarType) {
        let config = type.imageConfig
        
        switch type {
        case .pushed:
            leftBarButton.setImage(UIImage(systemName: "chevron.left", withConfiguration: config), for: .normal)
            leftNavBarItemStackView.addArrangedSubview(leftBarButton)
            
        case .leftCloseButton:
            leftBarButton.setImage(UIImage(systemName: "xmark", withConfiguration: config), for: .normal)
            leftNavBarItemStackView.addArrangedSubview(leftBarButton)
            
        case .rightCloseButton:
            rightBarButton.setImage(UIImage(systemName: "xmark", withConfiguration: config), for: .normal)
            rightNavBarItemStackView.addArrangedSubview(rightBarButton)
        }
    }

    public override func configViewSettings() {
        [leftNavBarItemStackView, rightNavBarItemStackView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    public override func configViewHierarchy() {
        addSubview(leftNavBarItemStackView)
        addSubview(rightNavBarItemStackView)
        addSubview(titleLabel)
    }
    
    public override func configLayoutConstraints() {
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
