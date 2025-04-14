//
//  ColorfulButtonView.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI

struct ColorfulButtonView: View {
    @Binding var colors: [Color]
    let dim: CGFloat
    let offset: CGFloat
    let action: () -> Void
    
    @State private var flip: Bool = false
    
    var count: CGFloat {
        CGFloat(colors.count)
    }
    
    var factor: CGFloat {
        (dim - offset) / count
    }
    
    var lastColor: Color {
        colors.last ?? .black
    }
    
    func minRadius(i: Int, offset: CGFloat) -> CGFloat {
        factor * CGFloat(i) + offset
    }
    
    func maxRadius(i: Int, offset: CGFloat) -> CGFloat {
        factor * CGFloat(i + 1) + offset
    }
    
    var body: some View {
        ZStack {
            ForEach(0 ..< colors.count, id: \.self) { i in
                RandomArcFromColorListView(
                    colors: colors,
                    index: i,
                    minRadius: minRadius(i: i, offset: offset),
                    maxRadius: maxRadius(i: i, offset: offset),
                    opacity: 0.9
                )
            }
            
            Circle()
                .stroke(lastColor, lineWidth: factor)
                .frame(width: dim, height: dim)
        }
        .rotation3DEffect(flip ? .zero : .degrees(180), axis: (x: Double.random(in: -1...1), y: Double.random(in: -1...1), z: 0))
        .onTapGesture {
            colors = Color.randomColorsN(n: colors.count)
            withAnimation {
                flip.toggle()
            }
            
            action()
        }
    }
}

#Preview {
    ColorfulButtonView(
        colors: .constant(Color.defaultColors),
        dim: 40,
        offset: 10,
        action: {}
    )
}
