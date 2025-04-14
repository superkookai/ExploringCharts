//
//  BarChartVerticalView.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI
import Charts

struct BarChartVerticalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart(dailySales) { item in
            BarMark(
                x: .value( "Day", item.day),
                y: .value("Sales", item.sales)
            )
            .foregroundStyle(by: .value("Day", item.day))
        }
        .chartForegroundStyleScale(range: barColors)
    }
}

#Preview {
    BarChartVerticalView(dailySales: defaultDailySales, barColors: defaultBarColors)
}
