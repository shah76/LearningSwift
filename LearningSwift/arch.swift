//
//  arch.swift
//  LearningSwift
//
//  Created by haroon shah on 12/25/25.
//

/*
 
 ScrumsView
    DetailView
        DetailEditView
 
 print("xxxx ..") inside a view
 You're seeing “Type '()' cannot conform to 'View'” because print("debug detail view") returns Void (also written as ()), and SwiftUI view builders expect you to return views (things that conform to View) inside the body.

 In a var body: some View context, every expression must produce a View. For example, List { ... }, Text("..."), HStack { ... }, etc. But print(...) is just a side effect; it doesn't produce a view. Placing it directly at the top level of the body makes the view builder try to treat Void as a View, which triggers that exact error.

 How to log/debug in SwiftUI views

 Here are a few safe options:
 
 Log during lifecycle events you actually care about
     • onAppear for when the view appears.
     • onDisappear for when it goes away.
     • onChange(of:) to log when specific data changes.

 extension View {
     func debugLog(_ message: @autoclosure () -> String) -> some View {
         print(message())
         return self
     }
 }

 // Usage:
 List { /* ... */ }
     .debugLog("debug detail view")
 */

/*
 https://www.avanderlee.com/swiftui/debugging-swiftui-views/
 
 #if DEBUG
         Self._logChanges()
     #endif
 */
