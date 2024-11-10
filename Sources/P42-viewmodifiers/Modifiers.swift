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
    
    public init(labelColor: Color) {
        self.labelColor = labelColor
    }
    
    public func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(labelColor)
            .padding()

    }
}

public struct P: ViewModifier {
    let labelColor: Color
    
    public init(labelColor: Color) {
        self.labelColor = labelColor
    }
    
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
    
    public init(color: Color, backgroundColor: Color, radius: CGFloat) {
        self.color = color
        self.backgroundColor = backgroundColor
        self.radius = radius
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
        .padding()
        .foregroundColor(color)
        .background(backgroundColor)
        .cornerRadius(radius)
    }
}

public struct EmptyModifier<Placeholder: View>: ViewModifier {
    let numberOfItems: Int
    let placeholder: Placeholder
    
    public init(numberOfItems: Int, placeholder: Placeholder) {
        self.numberOfItems = numberOfItems
        self.placeholder = placeholder
    }
    
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
    
    public init(items: [Any], placeholder: Placeholder) {
        self.items = items
        self.placeholder = placeholder
    }
    
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
    
    public init(onPress: @escaping () -> Void, onRelease: @escaping () -> Void) {
        self.onPress = onPress
        self.onRelease = onRelease
    }
    
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

public struct NavigationBarColorModifier: ViewModifier {
    private var color: UIColor

    public init(color: UIColor) {
        self.color = color
    }

    public func body(content: Content) -> some View {
        content
            .onAppear {
                let coloredAppearance = UINavigationBarAppearance()
                coloredAppearance.configureWithOpaqueBackground()
                coloredAppearance.backgroundColor = color
                coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

                UINavigationBar.appearance().standardAppearance = coloredAppearance
                UINavigationBar.appearance().compactAppearance = coloredAppearance
                UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
            }
    }
}
