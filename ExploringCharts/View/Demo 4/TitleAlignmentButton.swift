//
//  TitleAlignmentButton.swift
//  ExploringCharts
//
//  Created by Weerawut Chaiyasomboon on 14/04/2568.
//

import SwiftUI

struct TitleAlignmentButton: View {
    @Binding var titleAlignment: HorizontalAlignment
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                titleAlignment = .leading
            } label: {
                Image(systemName: "align.horizontal.left.fill")
                    .foregroundStyle(.black)
                    .opacity(titleAlignment == .leading ? 1 : 0.3)
            }
            
            Button {
                titleAlignment = .center
            } label: {
                Image(systemName: "align.horizontal.center.fill")
                    .foregroundStyle(.black)
                    .opacity(titleAlignment == .center ? 1 : 0.3)
            }
            
            Button {
                titleAlignment = .trailing
            } label: {
                Image(systemName: "align.horizontal.right.fill")
                    .foregroundStyle(.black)
                    .opacity(titleAlignment == .trailing ? 1 : 0.3)
            }
        }
        .padding(5)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 0.3)
        }
    }
}


#Preview(traits: .landscapeRight) {
    TitleAlignmentButton(titleAlignment: .constant(.center))
}
