//
//  ParentView.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

struct ParentView: View {
    
    @State var childText = ""
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                Spacer()
                Image(systemName: "figure.2.and.child.holdinghands")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 34, height: 34)
                    .foregroundStyle(.red)
                Text("Parent View")
                    .font(.headline)
                    .padding(.bottom, 20)
                Text("(Text from child view)")
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
                Text(childText)
                    .padding(.horizontal, 20)
                    .font(.subheadline)
                    .foregroundStyle(Color.blue)
                    .multilineTextAlignment(.center)
                Spacer()
                ChildView()
                    .padding()

            }
            .frame(width: proxy.size.width * 0.9,
                   height: proxy.size.height * 0.9)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
            .position(x: proxy.size.width / 2,
                      y: proxy.size.height / 2)
            .onPreferenceChange(TextFieldPreferenceKey.self) { newValue in
                childText = newValue
            }
        }
    }
}

#Preview {
    ParentView()
}
