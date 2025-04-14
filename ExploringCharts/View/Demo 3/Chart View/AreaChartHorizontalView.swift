//
//  AreaChartHorizontalView.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI
import Charts

struct AreaChartHorizontalView: View {
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart(dailySales) { item in
            AreaMark(
                x: .value("Sales", item.sales),
                y: .value("Day", item.day)
            )
        }
    }
}

#Preview {
    AreaChartHorizontalView(dailySales: defaultDailySales)
}
