//
//  ServiceListView.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

import ServicesSampleData
import SwiftUI

struct ServiceListView: View {
    @ObservedObject var viewModel: LoadServiceViewModel
    @State private var searchText: String = ""
    @State private var didLoad = false
    let onSelectService: ((String) -> Void)?
    
    var body: some View {
        List {
            ForEach(getServices()) { service in
                ServiceRowView(service: service)
                    .onTapGesture {
                        onSelectService?(service.id)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .task {
            if !didLoad {
                try? await viewModel.loadServices()
                didLoad = true
            }
        }
        .refreshable {
            try? await Task.sleep(for: .seconds(3))
            try? await viewModel.loadServices()
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
    }
    
    func getServices() -> [DomainService] {
        guard !searchText.isEmpty else {
            return viewModel.services
        }
        
        let lowercasedSearchText = searchText.lowercased()
        return viewModel.services.filter { service in
            service.title.lowercased().contains(lowercasedSearchText) ||
            service.customerName.lowercased().contains(lowercasedSearchText) ||
            service.description.lowercased().contains(lowercasedSearchText)
        }
    }
}

#Preview {
    NavigationStack {
        ServiceListView(
            viewModel: LoadServiceViewModel(
                loadService: LoadServiceUseCase(serviceLoader: MockServiceLoader())
            ),
            onSelectService: nil
        )
    }
}
