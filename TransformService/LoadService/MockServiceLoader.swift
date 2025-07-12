//
//  MockServiceLoader.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

import ServicesSampleData

class MockServiceLoader: ServiceLoader {
    func getServices() async throws -> [DomainService] {
        return SampleData.generateServices().map {
            DomainService(
                id: $0.id,
                title: $0.title,
                customerName: $0.customerName,
                description: $0.description,
                status: $0.status.rawValue,
                priority: $0.priority.rawValue,
                scheduledDate: $0.scheduledDate,
                location: $0.location,
                serviceNotes: $0.serviceNotes
            )
        }
    }
}
