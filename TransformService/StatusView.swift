//
//  StatusView.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

import SwiftUI

struct StatusView: View {
    let title: String
    
    var body: some View {
        let color = colorForStatus(title)
        HStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(color.opacity(0.5))
                .frame(width: 14, height: 14)
            Text(title)
                .font(.callout)
                .foregroundStyle(color)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 10)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(color.opacity(0.2))
        }
    }
    
    func colorForStatus(_ status: String) -> Color {
        switch status {
        case "Active":
            return .yellow
        case "Scheduled":
            return .blue
        case "Completed":
            return .green
        case "In Progress":
            return .orange
        case "Urgent":
            return .red
        default:
            return .gray
        }
    }
}
