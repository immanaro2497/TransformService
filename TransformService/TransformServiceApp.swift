//
//  TransformServiceApp.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

import SwiftUI

@main
struct TransformServiceApp: App {
    @StateObject private var appComposer: AppComposer = AppComposer()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appComposer.path) {
                appComposer.loadServiceListView()
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .serviceDetail(let id):
                            appComposer.loadServiceDetailView(for: id)
                        }
                    }
            }
        }
    }
}


