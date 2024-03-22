//
//  ReusableViewProtocol.swift
//
//
//  Created by Eunbee Kang on 3/21/24.
//

import UIKit

public protocol ReusableViewProtocol {
    static var reuseIdentifier: String { get }
}

extension DWBaseViewController: ReusableViewProtocol {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension DWBaseTableViewCell: ReusableViewProtocol {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension DWBaseCollectionViewCell: ReusableViewProtocol {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
