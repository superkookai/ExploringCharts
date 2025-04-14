//
//  BarChartHorizontalView.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI
import Charts

struct BarChartHorizontalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart(dailySales) { item in
            BarMark(
                x: .value("Sales", item.sales),
                y: .value( "Day", item.day)
            )
            .foregroundStyle(by: .value("Day", item.day))
        }
        .chartForegroundStyleScale(range: barColors)
    }
}

#Preview {
    BarChartHorizontalView(dailySales: defaultDailySales, barColors: defaultBarColors)
}
