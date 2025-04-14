//
//  LineChartHorizontalView.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI
import Charts

struct LineChartHorizontalView: View {
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart(dailySales) { item in
            LineMark(
                x: .value("Sales", item.sales),
                y: .value("Day", item.day)
            )
        }
    }
}

#Preview {
    LineChartHorizontalView(dailySales: defaultDailySales)
}
