//
//  AppComposer.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

import SwiftUI

enum AppRoute: Hashable {
    case serviceDetail(id: String)
}

class AppComposer: ObservableObject {
    @Published var path = NavigationPath()
    
    let loadServiceViewModel = LoadServiceViewModel(
        loadService: LoadServiceUseCase(serviceLoader: MockServiceLoader())
    )
    
    func loadServiceListView() -> some View {
        ServiceListView(
            viewModel: loadServiceViewModel,
            onSelectService: { [weak self] id in
                self?.path.append(AppRoute.serviceDetail(id: id))
            }
        )
        .navigationTitle("Services")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    func loadServiceDetailView(for serviceId: String) -> some View {
        if let service = loadServiceViewModel.services.first(where: { $0.id == serviceId }) {
            ServiceDetailView(service: service)
                .navigationTitle("Service Detail")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
