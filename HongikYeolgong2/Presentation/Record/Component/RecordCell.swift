//
//  RecordCell.swift
//  HongikYeolgong2
//
//  Created by 최주원 on 11/5/24.
//

import SwiftUI

struct RecordCell: View {
    let title: String
    let hours: Int
    let minutes: Int
    
    var body: some View {
        HStack{
            VStack(alignment: .leading ,spacing: 8) {
                Text(title)
                    .font(.pretendard(size: 16, weight: .regular))
                    .foregroundStyle(.gray200)
                
                Text("\(hours)H \(minutes)M")
                    .font(.pretendard(size: 16, weight: .semibold))
                    .foregroundStyle(.gray100)
                
            }
            .padding(.vertical, 18)
            .padding(.leading, 28)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.gray800)
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [.gray400, .gray600]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        )
    }
}

#Preview {
    RecordCell(title: "연간", hours: 200, minutes: 4)
}
