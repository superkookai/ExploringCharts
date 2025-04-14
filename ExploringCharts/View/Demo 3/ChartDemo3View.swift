//
//  ChartDemo3View.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI
import Charts

enum ChartType: String, CaseIterable, Identifiable {
    case bar, line, area
    
    var id: String {
        rawValue
    }
    
    var description: String {
        switch self {
        case .bar: "Bar"
        case .line: "Line"
        case .area: "Area"
        }
    }
    
    var iconName: String {
        switch self {
        case .bar:
            "chart.bar.xaxis.ascending"
        case .line:
            "chart.line.uptrend.xyaxis"
        case .area:
            "chart.line.uptrend.xyaxis.circle.fill"
        }
    }
}

struct ChartDemo3View: View {
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    
    @State private var chartType: ChartType = .bar
    @State private var isVertical: Bool = true
    @State private var barColors: [Color] = defaultBarColors
    
    var body: some View {
        VStack {
            Text("Charts Demo 3")
                .font(.title)
            
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
            
            HStack {
                ColorfulButtonView(
                    colors: $barColors,
                    dim: 30,
                    offset: 10,
                    action: {}
                )
                
                Picker("Type", selection: $chartType) {
                    ForEach(ChartType.allCases) { type in
                        Image(systemName: type.iconName)
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                
                Button {
                    isVertical.toggle()
                } label: {
                    Image(systemName: isVertical ? "chart.bar.yaxis" : "chart.bar.xaxis.ascending")
                }

            }
            .padding(.top)
        }
        .padding()
    }
}

#Preview {
    ChartDemo3View(
        dailySales: defaultDailySales,
        min: 0.0,
        max: 700.0
    )
}

//MARK: - Other Graph

//LineMark(
//    x: .value(
//        "Day",
//        dailySales.day
//    ),
//    y: .value("Sales", dailySales.sales)
//)

//AreaMark(
//    x: .value(
//        "Day",
//        dailySales.day
//    ),
//    y: .value("Sales", dailySales.sales)
//)

//Horizontal Bar Chart
//BarMark(
//    x: .value("Sales", dailySales.sales),
//    y: .value( "Day", dailySales.day)
//)
//.foregroundStyle(by: .value("Day", dailySales.day))
