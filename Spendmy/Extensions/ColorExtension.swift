//
//  ColorExtension.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/26/23.
//

import Foundation
import SwiftUI

extension Color {
    static func colorFromName(_ name: String) -> Color {
        switch name {
            case "Red":
                return .red
            case "Blue":
                return .blue
            case "Green":
                return .green
            case "Yellow":
                return .yellow
            case "Orange":
                return .orange
            default:
                return .black
        }
    }
}
