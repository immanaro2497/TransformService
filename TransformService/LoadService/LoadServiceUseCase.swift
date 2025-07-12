//
//  LoadServiceUseCase.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

protocol ServiceLoader {
    func getServices() async throws -> [DomainService]
}

class LoadServiceUseCase: LoadService {
    let serviceLoader: ServiceLoader
    
    init(serviceLoader: ServiceLoader) {
        self.serviceLoader = serviceLoader
    }

    func load() async throws -> [DomainService] {
        return try await serviceLoader.getServices()
    }
}
