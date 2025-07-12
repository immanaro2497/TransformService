//
//  ServiceRowView.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

import SwiftUI
import ServicesSampleData

struct ServiceRowView: View {
    let service: DomainService
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 1)
                .foregroundStyle(Color.border)
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    titleView
                    Spacer(minLength: 8)
                    statusIcon
                }
                .padding(.bottom, 8)
                companyDetail
                serviceDetails
                HStack(spacing: 0) {
                    statusView
                    Spacer(minLength: 8)
                    date
                }
                .padding(.bottom, 6)
            }
            .padding(12)
        }
    }
    
    var titleView: some View {
        Text(service.title)
            .font(.title2)
            .fontWeight(.bold)
    }
    
    var statusIcon: some View {
        Circle()
            .foregroundStyle(colorForPriority(service.priority))
            .frame(width: 10, height: 10)
    }
    
    var companyDetail: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 16, height: 16)
                .alignmentGuide(.top) { _ in
                    -2
                }
            Text(service.customerName)
                .font(.body)
                .foregroundStyle(Color.description)
        }
        .padding(.bottom, 4)
    }
    
    var serviceDetails: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "note.text")
                .resizable()
                .frame(width: 16, height: 16)
                .alignmentGuide(.top) { _ in
                    -2
                }
            Text(service.description)
                .font(.body)
                .foregroundStyle(Color.description)
        }
        .padding(.bottom, 12)
    }
    
    var statusView: some View {
        StatusView(title: service.status)
    }
    
    var date: some View {
        Text(service.scheduledDate)
    }
    
    func colorForPriority(_ priority: String) -> Color {
        switch priority {
        case "Low":
            return .blue
        case "Medium":
            return .yellow
        case "High":
            return .orange
        case "Critical":
            return .red
        default:
            return .green
        }
    }
}

#Preview {
    ScrollView {
        let service = SampleData.generateSingleService()
        ServiceRowView(
            service:
                DomainService(
                    id: service.id,
                    title: service.title,
                    customerName: service.customerName,
                    description: service.description,
                    status: service.status.rawValue,
                    priority: service.priority.rawValue,
                    scheduledDate: service.scheduledDate,
                    location: service.location,
                    serviceNotes: service.serviceNotes
                )
        )
    }
}
