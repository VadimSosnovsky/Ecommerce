//
//  UIColor + Extensions.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

extension UIColor {
    static func mainWhite() -> UIColor {
        return #colorLiteral(red: 0.9727925658, green: 0.9729320407, blue: 0.9727620482, alpha: 1)
    }
    
    static func mainGrey() -> UIColor {
        return #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    }
    
    static func lightGrey() -> UIColor {
        return #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7647058824, alpha: 1)
    }
    
    static func mediumGrey() -> UIColor {
        return #colorLiteral(red: 0.6196078431, green: 0.6196078431, blue: 0.6196078431, alpha: 1)
    }
    
    static func darkGrey() -> UIColor {
        return #colorLiteral(red: 0.2078431373, green: 0.2117647059, blue: 0.3333333333, alpha: 1)
    }
    
    static func mainOrange() -> UIColor {
        return #colorLiteral(red: 1, green: 0.431372549, blue: 0.3058823529, alpha: 1)
    }
    
    static func mainBrown() -> UIColor {
        return #colorLiteral(red: 0.4666666667, green: 0.1764705882, blue: 0.01176470588, alpha: 1)
    }
    
    static func mainBlue() -> UIColor {
        return #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
    }
}

extension UIColor {
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

