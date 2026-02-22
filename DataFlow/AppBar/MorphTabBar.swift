//
//  MorphTabBar.swift
//  DataFlow
//
//  Created by Salah Khaled on 22/02/2026.
//

import SwiftUI

protocol MorphTabProtocol: CaseIterable, Hashable {
    var icon: String { get }
}

struct MorphTabBar<Tab: MorphTabProtocol, ExpandedContent: View>: View {
    
    @Binding var activeTab: Tab
    @Binding var isExpanded: Bool
    @ViewBuilder var expandedContent: ExpandedContent
    
    var body: some View {
        ZStack {
            
            let icons = Array(Tab.allCases).compactMap( { $0.icon })
            let selectedIndex = Binding {
                return icons.firstIndex(of: activeTab.icon) ?? 0
            } set: { index in
                activeTab = Array(Tab.allCases)[index]
            }

            
            CustomTabBar(index: selectedIndex, icons: icons) { image in
                let font = UIFont.systemFont(ofSize: 19)
                let config = UIImage.SymbolConfiguration(font: font)
                
                return UIImage(systemName: image, withConfiguration: config)
            }
            .frame(height: 48)
        }
    }
}

fileprivate struct CustomTabBar: UIViewRepresentable {
    
    @Binding var index: Int
    var tint: Color = .gray.opacity(0.15)
    var icons: [String]
    var image: (String) -> UIImage?
    
    func makeUIView(context: Context) -> UISegmentedControl {
        let control = UISegmentedControl(items: icons)
        control.selectedSegmentIndex = index
        control.selectedSegmentTintColor = UIColor(tint)
        
        for (index, icon) in icons.enumerated() {
            control.setImage(image(icon), forSegmentAt: index)
        }
        control.addTarget(context.coordinator, action: #selector(context.coordinator.didSelect(_:)), for: .valueChanged)
//        removeBackgroundColor(control: control)
        return control
    }
    
    func removeBackgroundColor(control: UISegmentedControl) {
        DispatchQueue.main.async {
            for view in control.subviews.dropLast() {
                if view is UIImageView {
                    view.alpha = 0
                }
            }
        }
    }
    
    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        guard uiView.selectedSegmentIndex != index else { return }
        uiView.selectedSegmentIndex = index
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject {
        var parent: CustomTabBar
        init(parent: CustomTabBar) {
            self.parent = parent
        }
        
        @objc
        func didSelect(_ control: UISegmentedControl) {
            parent.index = control.selectedSegmentIndex
        }
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: UISegmentedControl, context: Context) -> CGSize? {
        return proposal.replacingUnspecifiedDimensions()
    }
}

#Preview {
    
    @Previewable @State var activeTab: AppTab = .envObject
    @Previewable @State var isExpanded: Bool = false
    
    MorphTabBar(activeTab: $activeTab, isExpanded: $isExpanded) {
        
    }
}
