//
//  Modifiers.swift
//  shops24
//
//  Created by Diederick de Buck on 30/11/2022.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
struct H2: ViewModifier {
    let labelColor: Color
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(labelColor)
            .padding()

    }
}

@available(iOS 13.0, *)
struct P: ViewModifier {
    let labelColor: Color
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(labelColor)
            .multilineTextAlignment(TextAlignment.leading)
            .padding(.vertical, 10)
            .padding(.leading, 30)
            .padding(.trailing, 30)
    }
}

@available(iOS 14.0, *)
struct BackgroundLabelStyle: LabelStyle {
    let color: Color
    let backgroundColor: Color
    let radius: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .foregroundColor(color)
            .background(backgroundColor)
            .cornerRadius(radius)
    }
}

@available(iOS 13.0, *)
struct EmptyModifier<Placeholder: View>: ViewModifier {
    let numberOfItems: Int
    let placeholder: Placeholder
    
    func body(content: Content) -> some View {
        if numberOfItems != 0 {
            content
        } else {
            placeholder
        }
    }
}

@available(iOS 13.0, *)
struct EmptyDataModifier<Placeholder: View>: ViewModifier {
    let items: [Any]
    let placeholder: Placeholder
    
    func body(content: Content) -> some View {
        if !items.isEmpty {
            content
        } else {
            placeholder
        }
    }
}

@available(iOS 13.0, *)
struct ButtonPress: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}
