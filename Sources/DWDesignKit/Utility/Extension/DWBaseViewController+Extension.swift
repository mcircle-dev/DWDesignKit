//
//  DWBaseViewController+Extension.swift
//
//
//  Created by Eunbee Kang on 3/18/24.
//

import UIKit

extension DWBaseViewController {
    
    @available(iOS 13.0, *)
    public func showActivityIndicator(
        indicatorColor: UIColor = .white,
        indicatorSize: CGFloat = 50,
        backgroundColor: UIColor = .black,
        backgroundOpacity: CGFloat = 0.7,
        isAnimatingBackground: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        let dimmingView = UIView()
        dimmingView.backgroundColor = backgroundColor.withAlphaComponent(backgroundOpacity)
        dimmingView.frame = UIScreen.main.bounds
        
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: indicatorSize, height: indicatorSize))
        indicator.color = indicatorColor
        indicator.center = CGPoint(x: dimmingView.bounds.midX, y: dimmingView.bounds.midY)
        indicator.autoresizingMask = [
            .flexibleLeftMargin,
            .flexibleRightMargin,
            .flexibleTopMargin,
            .flexibleBottomMargin
        ]
        
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .last { $0.isKeyWindow }
        keyWindow?.addSubview(dimmingView)
        keyWindow?.addSubview(indicator)
        
        indicator.startAnimating()
        
        if isAnimatingBackground {
            UIView.animate(
                withDuration: 1.0,
                delay: 0,
                usingSpringWithDamping: 1.0,
                initialSpringVelocity: 1.0,
                options: .curveEaseInOut
            ) {
                if backgroundOpacity > 0.5 {
                    dimmingView.alpha = 0.5
                }
            }
        }
        
        DimmingViewHandle.set(dimmingView)
        ActivityIndicatorHandle.set(indicator)
    }
    
    public func hideActivityIndicator(completion: (() -> Void)? = nil) {
        if let activityIndicator = ActivityIndicatorHandle.get() {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            ActivityIndicatorHandle.clear()
        }
        
        if let dimmingView = DimmingViewHandle.get() {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 1.0,
                initialSpringVelocity: 1.0,
                options: .curveEaseInOut
            ) {
                dimmingView.alpha = 0
                
            } completion: { _ in
                dimmingView.removeFromSuperview()
                DimmingViewHandle.clear()
            }
        }
        
        completion?()
    }
}

final class ActivityIndicatorHandle {
    static var handle: UIActivityIndicatorView?
    
    static func set(_ handle: UIActivityIndicatorView) {
        self.handle = handle
    }

    static func clear() {
        handle = nil
    }

    static func get() -> UIActivityIndicatorView? {
        return handle
    }
}

final class DimmingViewHandle {
    static var handle: UIView?
    
    static func set(_ handle: UIView) {
        self.handle = handle
    }
    
    static func clear() {
        handle = nil
    }
    
    static func get() -> UIView? {
        return handle
    }
}
