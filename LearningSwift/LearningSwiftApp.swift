//
//  LearningSwiftApp.swift
//  LearningSwift
//
//  Created by haroon shah on 12/21/25.
//

import SwiftUI
import OSLog

@main
struct LearningSwiftApp: App {
    // 1. A state variable to control the alert's visibility
    @State private var showingAlert = false
    
    init() {
      do {
        Logger.viewCycle.log("LearningSwiftApp")
        runAllMyLib()
        testTheme()
  #if DEBUG
        NSLog("Hello DEBUG defined")
  #endif
      }
    }

    var body: some Scene {
        WindowGroup {
            #if false
                ContentView()
            #else
                ViewStateBinding(hasError: $showingAlert)
                    .alert("error", isPresented: $showingAlert) {
                        Button("Test") {
                            print("test")  // Action returns Void
                        }
                    }
                AllThree()
            #endif
        }
    }
}
