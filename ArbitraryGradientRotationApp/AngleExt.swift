//
//  AngleExt.swift
//  ArbitraryGradientRotationApp
//
//  Created by AlelinApps on 2/26/23.
//

import SwiftUI

extension Angle {
    static var halfCircleAngle: Angle {
        Angle(degrees: 180)
    }
    
    static var threeQuarterCircleAngle: Angle {
        Angle(degrees: 270)
    }
    
    static var quarterCircleAngle: Angle {
        Angle(degrees: 90)
    }
}
