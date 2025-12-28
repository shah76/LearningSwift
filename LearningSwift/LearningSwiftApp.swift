//
//  LearningSwiftApp.swift
//  LearningSwift
//
//  Created by haroon shah on 12/21/25.
//

import SwiftUI
import OSLog
import SwiftData

@main
struct LearningSwiftApp: App {
    
    
    // 1. A state variable to control the alert's visibility
    @State private var showingAlert = false
    
    @State private var scrums = DailyScrum.sampleData
    
    init() {
        do {
#if NOLEARN
            Logger.viewCycle.log("LEARN")
#else
            Logger.viewCycle.log("NOLEARN")
#endif
#if LEARN
            Logger.viewCycle.log("LearningSwiftApp")
            runAllMyLib()
            testTheme()
#endif
            //#if DEBUG
            //      NSLog("Hello DEBUG defined")
            //#endif
        }
    }
    
    var body: some Scene {
        WindowGroup {
#if true
            ScrumsView()
            //ContentView()
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
        .modelContainer(for: DailyScrum.self)
    }
}
