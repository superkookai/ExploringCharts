//
//  ChartButtonsView.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI

struct LeftChartButtonsView: View {
    @Binding var barColors: [Color]
    @Binding var chartType: ChartType
    @Binding var isVertical: Bool
    
    var body: some View {
        VStack {
            ForEach(ChartType.allCases) { type in
                Button {
                    chartType = type
                } label: {
                    Image(systemName: type.iconName)
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
            }
            
            ColorfulButtonView(
                colors: $barColors,
                dim: 30,
                offset: 10,
                action: {}
            )
        }
    }
}

#Preview(traits: .landscapeRight) {
    LeftChartButtonsView(
        barColors: .constant(defaultBarColors),
        chartType: .constant(.bar),
        isVertical: .constant(true)
    )
}
