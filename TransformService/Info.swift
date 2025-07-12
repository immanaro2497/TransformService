//
//  Info.swift
//  TransformService
//
//  Created by Immanuel on 12/07/25.
//

import SwiftUI

struct InfoView: View {
    let image: String
    let title: String
    let detail: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
                .alignmentGuide(.top) { _ in
                    -2
                }
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body.bold())
                Text(detail)
                    .font(.body)
                    .foregroundStyle(Color.description)
            }
        }
        .padding(.bottom, 12)
    }
}
