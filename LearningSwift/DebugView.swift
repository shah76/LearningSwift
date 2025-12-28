//
//  DebugView.swift
//  LearningSwift
//
//  Created by haroon shah on 12/25/25.
//

/*
 The new _logChanges() method is like the existing _printChanges() one, except that the new method uses the system console, which is useful in some debugging workflows.

 If you want to see changes in Xcode's console, use Self._printChanges() instead.

 To see changes in the Console.app, run your app in the simulator and then select the simulator in the Console app.
 */

import SwiftUI

struct MyView: View {
    @State private var count = 0

    var body: some View {
        #if DEBUG
        let _ = Self._logChanges()
        let _ = Self._printChanges()
        #endif

        VStack {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1
            }
        }
    }
}
#Preview {
    MyView()
}
