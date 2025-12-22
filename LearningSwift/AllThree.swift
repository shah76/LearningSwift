//
//  AllThree.swift
//  HelloGlasses
//
//  Created by haroon shah on 12/20/25.
//

import SwiftUI

struct AllThree: View {
    // State variables to control visibility
    @State private var showingAlert = false
    @State private var showingSheet = false
    @State private var showingOverlay = false
    
    var body: some View {
        NavigationStack { // Use NavigationStack for a clean base
            VStack(spacing: 20) {
                Button("Show Alert") {
                    showingAlert = true
                }
                .alert("Action Required", isPresented: $showingAlert) { // Modifier for the alert
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("This is a standard system alert.")
                }
                
                Button("Show Sheet") {
                    showingSheet = true
                }
                .sheet(isPresented: $showingSheet) { // Modifier for the sheet
                    // Content of the sheet view
                    SheetView(isPresented: $showingSheet)
                }
                
                Button("Toggle Custom Overlay") {
                    showingOverlay.toggle()
                }
            }
            .navigationTitle("SwiftUI Modals")
        }
        // Modifier for the custom overlay
        .overlay(alignment: .center) { // Aligns the overlay content
            if showingOverlay {
                CustomOverlayView(isPresented: $showingOverlay)
                    // Add a background to the main view to block interaction when overlay is shown
                    .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
            }
        }
    }
}

// A separate View for the sheet content
struct SheetView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("This is a modal sheet.")
                .font(.title2)
                .padding()
            Button("Dismiss Sheet") {
                isPresented = false
            }
        }
        .padding()
    }
}

// A separate View for the custom overlay content
struct CustomOverlayView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "info.circle")
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text("This is a custom overlay (popup).")
                .multilineTextAlignment(.center)
            Button("Dismiss Overlay") {
                isPresented = false
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

// Include a preview struct to run in Xcode Previews
#Preview {
    AllThree()
}
