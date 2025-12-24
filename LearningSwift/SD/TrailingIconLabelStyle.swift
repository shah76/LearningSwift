//
//  TrailingIconLabelStyle.swift
//  LearningSwift
//
//  Created by haroon shah on 12/23/25.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

/*
 static var trailingIcon: Self declares a type property that returns an instance of the conforming type (again, here that’s TrailingIconLabelStyle).

 • The body { Self() } is a computed property that constructs and returns a new instance of Self using its default initializer. Since TrailingIconLabelStyle is a struct with no stored properties requiring initialization, it has an implicit memberwise initializer that is effectively the empty initializer init().
 */
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
