//
//  SyncView.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

// MARK: - Proxy
struct SyncViewProxy {
    fileprivate var maxWidth: CGFloat?
}

// MARK: - Sync View
struct SyncView<Content: View>: View {
    
    @State var proxy = SyncViewProxy()
    @State var maxWidth: CGFloat?
    @ViewBuilder var content: (SyncViewProxy) -> Content
    
    var body: some View {
        VStack {
            content(proxy)
        }
        .onPreferenceChange(MaxWidthPreferenceKey.self) { maxWidth in
            proxy.maxWidth = maxWidth
        }
    }
}

// MARK: - Modifier
struct SyncWithModifier: ViewModifier {
    
    var proxy = SyncViewProxy()
    
    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { proxy in
                    Color.clear.preference(
                        key: MaxWidthPreferenceKey.self,
                        value: proxy.size.width)
                }
            }
            .frame(maxWidth: proxy.maxWidth)
    }
}

// MARK: - Extension
extension View {
    func syncWidth(using proxy: SyncViewProxy) -> some View {
        self.modifier(SyncWithModifier(proxy: proxy))
    }
}
