//
//  ChartDemo2View.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI
import Charts

struct ChartDemo2View: View {
    let min = 0.0
    let max = 1000.0
    
    @State private var showLegend: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to Charts Framework")
                .font(.title)
            
            Chart {
                BarMark(
                    x: .value("Day", "Sun"),
                    y: .value("Sales", 100)
                )
                .annotation {
                    Image(systemName: "figure.walk.circle.fill")
                        .foregroundStyle(Color.blueViolet)
                        .font(.title.bold())
                }
                .foregroundStyle(by: .value("Day", "Sunday"))
                
                BarMark(
                    x: .value("Day", "Mon"),
                    y: .value("Sales", 250)
                )
                .annotation(
                    position: .bottom,
                    alignment: .center,
                    spacing: -50) {
                        Image(systemName: "figure.dance")
                            .foregroundStyle(Color.white)
                            .font(.title.bold())
                }
                .foregroundStyle(by: .value("Day", "Monday"))
                
                BarMark(
                    x: .value("Day", "Tue"),
                    y: .value("Sales", 75.3)
                )
                .annotation(
                    position: .leading,
                    alignment: .top,
                    spacing: -50) {
                        Image(systemName: "figure.fishing")
                            .foregroundStyle(Color.black)
                            .font(.title.bold())
                }
                .foregroundStyle(by: .value("Day", "Tuesday"))
                
                BarMark(
                    x: .value("Day", "Wed"),
                    y: .value("Sales", 800)
                )
                .annotation(
                    position: .top,
                    alignment: .center,
                    spacing: nil) {
                        VStack {
                            Circle()
                                .stroke(lineWidth: 2)
                            Text("800")
                        }
                }
                .foregroundStyle(by: .value("Day", "Wednesday"))
                
                BarMark(
                    x: .value("Day", "Thu"),
                    y: .value("Sales", 450)
                )
                .foregroundStyle(by: .value("Day", "Thursday"))
                
                BarMark(
                    x: .value("Day", "Fri"),
                    y: .value("Sales", 120.23)
                )
                .foregroundStyle(by: .value("Day", "Friday#1"))
                
                BarMark(
                    x: .value("Day", "Fri"),
                    y: .value("Sales", 175)
                )
                .foregroundStyle(by: .value("Day", "Friday#2"))
                
                BarMark(
                    x: .value("Day", "Sat"),
                    y: .value("Sales", 320)
                )
                .foregroundStyle(by: .value("Day", "Saturday#1"))
                
                BarMark(
                    x: .value("Day", "Sat"),
                    y: .value("Sales", 220.23)
                )
                .foregroundStyle(by: .value("Day", "Saturday#2"))
            }
            .chartYScale(domain: min...max)
            .chartXAxis {
                AxisMarks(position: .top)
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartLegend(showLegend ? .visible : .hidden)
            .chartLegend(position: .top, alignment: .center, spacing: 50)
            
        }
        .padding()
        .overlay(alignment: .topTrailing) {
            Button {
                withAnimation {
                    showLegend.toggle()
                }
            } label: {
                Image(systemName: showLegend ? "eye.slash" : "eye")
                    .imageScale(.large)
                    .padding(.trailing)
            }
        }
    }
}

#Preview {
    ChartDemo2View()
}

