//
//  CAGradientLayer+ListStyle.swift
//  Today
//
//  Created by Ly Gia Huy on 25/04/2023.
//

import UIKit

extension CAGradientLayer {
    static func gradientLayer(for style: ReminderListStyle, in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }

    private static func colors(for style: ReminderListStyle) -> [CGColor] {
        switch style {
        case .today:
            return [UIColor.todayGradientTodayBegin.cgColor, UIColor.todayGradientTodayEnd.cgColor]
        case .future:
            return [UIColor.todayGradientFutureBegin.cgColor, UIColor.todayGradientFutureEnd.cgColor]
        case .all:
            return [UIColor.todayGradientAllBegin.cgColor, UIColor.todayGradientAllEnd.cgColor]
        }
    }
}
