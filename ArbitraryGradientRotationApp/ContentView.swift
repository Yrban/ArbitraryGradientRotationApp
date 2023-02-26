//
//  ContentView.swift
//  ArbitraryGradientRotationApp
//
//  Created by AlelinApps on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var sliderValue:CGFloat = 0.0
    @State var gradientSize = CGSize(width: 200, height: 200)
    
    var startPoint: UnitPoint {
        UnitPoint.unitSquareIntersectionPoint(rotationAngle )
    }
    
    var endPoint: UnitPoint {
        UnitPoint.unitSquareIntersectionPoint(rotationAngle + .halfCircleAngle)
    }
    
    var rotationAngle: Angle {
        return Angle(degrees: sliderValue)
    }
    
    var gradientColors: [Color] {
        [.red, .green, .purple]
    }
    
    @State var screenSize = CGSize(width: 100, height: 100)
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack(alignment: .center) {
                    LinearGradient(colors: gradientColors, startPoint: startPoint, endPoint: endPoint)
                        .border(.black)
                        .clipped()
                    
                    triangle
                        .foregroundStyle(gradientColors.first!, .black)
                        .rotationEffect(.halfCircleAngle + rotationAngle)
                        .position(x:startPoint.x * gradientSize.width, y:startPoint.y * gradientSize.height)
                    
                    triangle
                        .foregroundStyle(gradientColors.last!, .black)
                        .rotationEffect(rotationAngle)
                        .position(x:endPoint.x * gradientSize.width, y:endPoint.y * gradientSize.height)
                    
                }
                .frame(maxWidth: gradientSize.width, maxHeight: gradientSize.height)
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)

            controls
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .copySize(to: $screenSize)
        .edgesIgnoringSafeArea(.all)
    }

var triangle: some View {
    Image(systemName: "triangle.inset.filled")
        .symbolRenderingMode(.palette)
        .resizable()
        .frame(width:15, height:15)
}

    var controls: some View {
        VStack {
            Spacer()
            Text(rotationAngle.degrees.truncatingRemainder(dividingBy: 360), format: .number.precision(.fractionLength(0)))
            
            HStack {
                Text("Rotation:")
                    .frame(width: 70)
                Slider(value: $sliderValue, in: 0...1800, step: 1)
            }
            
            HStack {
                Text("Height:")
                    .frame(width: 70)
                Slider(value: $gradientSize.height, in: 0...screenSize.height - 30, step: 1)
            }
            
            HStack {
                Text("Width:")
                    .frame(width: 70)
                Slider(value: $gradientSize.width, in: 0...screenSize.width - 30, step: 1)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
