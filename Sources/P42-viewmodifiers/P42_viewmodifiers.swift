//
//  Modifiers.swift
//  shops24
//
//  Created by Diederick de Buck on 30/11/2022.
//

import Foundation
import SwiftUI

public struct H2: ViewModifier {
    let labelColor: Color
    public func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(labelColor)
            .padding()

    }
}

public struct P: ViewModifier {
    let labelColor: Color
    public func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(labelColor)
            .multilineTextAlignment(TextAlignment.leading)
            .padding(.vertical, 10)
            .padding(.leading, 30)
            .padding(.trailing, 30)
    }
}

public struct BackgroundLabelStyle: LabelStyle {
    let color: Color
    let backgroundColor: Color
    let radius: CGFloat
    public func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .foregroundColor(color)
            .background(backgroundColor)
            .cornerRadius(radius)
    }
}

public struct EmptyModifier<Placeholder: View>: ViewModifier {
    let numberOfItems: Int
    let placeholder: Placeholder
    
    public func body(content: Content) -> some View {
        if numberOfItems != 0 {
            content
        } else {
            placeholder
        }
    }
}

public struct EmptyDataModifier<Placeholder: View>: ViewModifier {
    let items: [Any]
    let placeholder: Placeholder
    
    public func body(content: Content) -> some View {
        if !items.isEmpty {
            content
        } else {
            placeholder
        }
    }
}

public struct ButtonPress: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    public func body(content: Content) -> some View {
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
