//
//  ForthExampleView.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

struct ForthExampleView: View {
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                Image(systemName: "arrow.left.and.right.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 34, height: 34)
                    .foregroundStyle(.red)
                Text("Dynamic Width")
                    .font(.headline)
                    .padding(.bottom, 20)
                SyncView { width in
                    Group {
                        Button("Those buttons") { }
                        Button("Will always have the same width,") { }
                        Button("Even when the width change in the run time.") { }
                    }
                    .syncWidth(using: width)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(14)
                    .font(.system(size: 14, weight: .medium))
                }
                
            }
            .frame(width: proxy.size.width * 0.9,
                   height: proxy.size.height * 0.9)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
            .position(x: proxy.size.width / 2,
                      y: proxy.size.height / 2)
        }
    }
}

#Preview {
    ForthExampleView()
}
