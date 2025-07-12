//
//  LoadService.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

protocol LoadService {
    func load() async throws -> [DomainService]
}
