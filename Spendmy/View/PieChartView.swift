//
//  PieChartView.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/29/23.
//

import SwiftUI

struct PieChartSlice: Identifiable {
    var id = UUID()
    var value: Double
    var color: Color
    var startAngle: Angle
    var endAngle: Angle
}

struct PieChartView: View {
    var slices: [PieChartSlice]

    var body: some View {
        ZStack {
            ForEach(slices) { slice in
                PieSlice(startAngle: slice.startAngle, endAngle: slice.endAngle)
                    .fill(slice.color)
            }
        }
    }
}

struct PieSlice: Shape {
    var startAngle: Angle
    var endAngle: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addArc(center: center, radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.closeSubpath()
        return path
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        let slices: [PieChartSlice] = [
            PieChartSlice(value: 0.3, color: .blue, startAngle: .zero, endAngle: .degrees(120)),
            PieChartSlice(value: 0.4, color: .green, startAngle: .degrees(120), endAngle: .degrees(240)),
            PieChartSlice(value: 0.3, color: .red, startAngle: .degrees(240), endAngle: .degrees(360))
        ]
        return PieChartView(slices: slices)
    }
}
