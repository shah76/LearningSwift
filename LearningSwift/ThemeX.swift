//
//  Theme.swift
//  LearningSwift
//
//  Created by haroon shah on 12/21/25.
//

import SwiftUI

public enum ThemeX: String, CaseIterable, Identifiable, Codable {

    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    public var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    /*
     The code Color(rawValue, bundle: .module) is a SwiftUI initializer used to load a color from an asset catalog within the current Swift package or module.
     Explanation
     Color(rawValue): This calls the SwiftUI Color initializer that takes a string argument (the rawValue from an enum conforming to String). It instructs the system to look for a color set in an asset catalog that matches the string name.
     bundle: .module: This is crucial when working within a modularized project, such as a Swift Package or a framework separate from your main application target. It specifies that the system should look for the color asset in the bundle associated with the current module, rather than the main application bundle (which is the default if bundle is omitted or set to nil).
     Asset Catalog: For this code to work, you must have a "Color Set" with a name matching the rawValue string in your Assets.xcassets file within that specific module's resources.

     */
    /*
    public var mainColor: Color {
        Color(rawValue, bundle: .module)
    }
     */
    public var mainColor: Color {
        Color(rawValue)
    }
    public var name: String {
        rawValue.capitalized
    }
    public var id: String {
        name
    }
}

func testTheme() {
    let a = ThemeX.bubblegum.accentColor
    let x = ThemeX.bubblegum.mainColor
    let n = ThemeX.bubblegum.name
    let i = ThemeX.bubblegum.id
    print(a, x, n, i)
}
