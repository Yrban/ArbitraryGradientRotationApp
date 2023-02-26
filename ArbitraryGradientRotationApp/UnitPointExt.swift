//
//  UnitPointExt.swift
//  ArbitraryGradientRotationApp
//
//  Created by AlelinApps on 2/25/23.
//

import SwiftUI

extension UnitPoint {
    
    /// Returns a variable unit point based on angle. 0 is up.
    ///  - Parameter angle: An Angle that to compute the corresponding normalized UnitPoint.
    ///  - Returns a UnitPoint
    static func unitSquareIntersectionPoint(_ angle:Angle) -> UnitPoint {

        let normalizedAngle = Angle(degrees: (angle.degrees + 60).truncatingRemainder(dividingBy: 360))
        
        switch normalizedAngle.degrees {
        case 0...90.nextDown: // top
            return UnitPoint(x: 1 - cos(normalizedAngle.radians), y: 0)
        case 90.0...180.nextDown: // right
            return UnitPoint(x: 1, y: 1 - sin(normalizedAngle.radians))
        case 180.0...270.nextDown:
            return UnitPoint(x: 0 - cos(normalizedAngle.radians), y: 1)
        case 270.0...360:
            return UnitPoint(x: 0, y: 0 - sin(normalizedAngle.radians))
        default:
            return .zero
        }
    }
}
