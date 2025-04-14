//
//  LineChartVerticalView.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI
import Charts

struct LineChartVerticalView: View {
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart(dailySales) { item in
            LineMark(
                x: .value(
                    "Day",
                    item.day
                ),
                y: .value("Sales", item.sales)
            )
        }
    }
}

#Preview {
    LineChartVerticalView(dailySales: defaultDailySales)
}
