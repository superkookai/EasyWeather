//
//  AlertMessageView.swift
//  EasyWeather
//
//  Created by Weerawut Chaiyasomboon on 06/03/2568.
//

import SwiftUI

struct AlertMessageView: View {
    let errorMessage: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.clear
            
            VStack {
                Image(systemName: "exclamationmark.warninglight.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.red)
                
                Text(errorMessage)
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Button {
                    dismiss()
                } label: {
                    Text("Dismiss")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue.gradient)
                        .clipShape(.rect(cornerRadius: 10))
                }

            }
            .padding(30)
            .background(.ultraThickMaterial)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 5)
            .frame(maxWidth: 350)
            
        }
    }
}

#Preview {
    AlertMessageView(errorMessage: "Something went wrong, please try again")
}
