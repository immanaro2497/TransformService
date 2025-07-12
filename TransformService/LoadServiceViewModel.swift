//
//  LoadServiceViewModel.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

import SwiftUI
import Combine

class LoadServiceViewModel: ObservableObject {
    
    let loadService: LoadService
    @Published var services: [DomainService] = []
    
    init(loadService: LoadService) {
        self.loadService = loadService
    }
    
    func loadServices() async throws {
        let fetchedServices = try await loadService.load()
        Task { @MainActor in
            services = fetchedServices
        }
    }
    
}
