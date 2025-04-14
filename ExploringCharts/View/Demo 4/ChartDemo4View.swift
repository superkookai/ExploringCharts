//
//  ChartDemo4View.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI
import Charts

struct ChartDemo4View: View {
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    
    @State private var chartType: ChartType = .bar
    @State private var isVertical: Bool = true
    @State private var barColors: [Color] = defaultBarColors
    @State private var title: String = "Chart Title"
    @State private var titleAlignment: HorizontalAlignment = .trailing
    
    var body: some View {
        VStack {
            HStack {
                LeftChartButtonsView(barColors: $barColors, chartType: $chartType, isVertical: $isVertical)
                    .padding(.trailing)
                
                VStack(alignment: titleAlignment) {
                    Text(title)
                        .font(.title.bold())
                    
                    if isVertical {
                        switch chartType {
                        case .bar:
                            BarChartVerticalView(dailySales: dailySales, barColors: barColors)
                        case .line:
                            LineChartVerticalView(dailySales: dailySales)
                        case .area:
                            AreaChartVerticalView(dailySales: dailySales)
                        }
                    } else {
                        switch chartType {
                        case .bar:
                            BarChartHorizontalView(dailySales: dailySales, barColors: barColors)
                        case .line:
                            LineChartHorizontalView(dailySales: dailySales)
                        case .area:
                            AreaChartHorizontalView(dailySales: dailySales)
                        }
                    }
                }
                
                RightChartButtonsView(barColors: $barColors, chartType: $chartType, isVertical: $isVertical, titleAlignment: $titleAlignment)
                    .padding(.leading)
            }
        }
        .padding()
        
    }
}

#Preview(traits: .landscapeRight) {
    ChartDemo4View(
        dailySales: defaultDailySales,
        min: 0.0,
        max: 700.0
    )
}
