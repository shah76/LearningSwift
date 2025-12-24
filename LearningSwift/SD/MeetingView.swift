//
//  MeetingView.swift
//  LearningSwift
//
//  Created by haroon shah on 12/23/25.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        ProgressView(value: 10, total: 15)
        VStack {
            
            HStack {
                VStack {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: 24))
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel(Text("Next speaker"))
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}
