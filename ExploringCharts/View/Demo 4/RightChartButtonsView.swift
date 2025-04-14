//
//  RightChartButtonsView.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI

struct RightChartButtonsView: View {
    @Binding var barColors: [Color]
    @Binding var chartType: ChartType
    @Binding var isVertical: Bool
    @Binding var titleAlignment: HorizontalAlignment
    
    var body: some View {
        VStack(spacing: 50) {
            Button {
                isVertical.toggle()
            } label: {
                Image(systemName: isVertical ? "chart.bar.yaxis" : "chart.bar.xaxis.ascending")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            
            TitleAlignmentButton(titleAlignment: $titleAlignment)

        }
    }
}

#Preview(traits: .landscapeRight) {
    RightChartButtonsView(
        barColors: .constant(defaultBarColors),
        chartType: .constant(.bar),
        isVertical: .constant(true),
        titleAlignment: .constant(.trailing)
    )
}
