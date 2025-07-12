//
//  ServiceDetailView.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

import SwiftUI
import MapKit
import ServicesSampleData

struct ServiceDetailView: View {
    let service: DomainService
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                HStack(spacing: 0) {
                    titleView
                    Spacer(minLength: 8)
                    StatusView(title: service.status)
                }
                .padding(.bottom, 16)
                customerView
                descriptionView
                scheduledTimeView
                locationView
                serviceNotesView
            }
            .padding(12)
        }
    }
    
    var titleView: some View {
        Text(service.title)
            .font(.title2)
            .fontWeight(.bold)
    }
    
    var customerView: some View {
        InfoView(
            image: "person.circle.fill",
            title: "Customer",
            detail: service.customerName
        )
    }
    
    var descriptionView: some View {
        InfoView(
            image: "note.text",
            title: "Description",
            detail: service.description
        )
    }
    
    var scheduledTimeView: some View {
        InfoView(
            image: "clock.arrow.circlepath",
            title: "Scheduled Time",
            detail: service.scheduledDate
        )
    }
    
    var locationView: some View {
        InfoView(
            image: "mappin.circle.fill",
            title: "Location",
            detail: service.location
        )
    }
    
    var serviceNotesView: some View {
        InfoView(
            image: "bubble",
            title: "Service Notes",
            detail: service.serviceNotes
        )
    }
}

#Preview {
    ScrollView {
        let service = SampleData.generateSingleService()
        ServiceDetailView(
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
