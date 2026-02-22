//
//  PreferenceKey.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

// MARK: - TextField Preference Key
struct TextFieldPreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

// MARK: - Extension
extension View {
    func publishPreference(_ textInput: String) -> some View {
        self.preference(key: TextFieldPreferenceKey.self, value: textInput)
    }
}


// MARK: - MaxWidth Preference Key
struct MaxWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
