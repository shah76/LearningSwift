//
//  TestView.swift
//  HelloGlasses
//
//  Created by haroon shah on 12/20/25.
//

import SwiftUI

struct ViewStateBinding: View {
  @Binding var hasError: Bool // Doesn't own the data, just accesses it
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      Button("Toggle Status") {
        hasError.toggle() // Flips the boolean value
      }
    }
}

//#Preview {
//    TestView()
//}
