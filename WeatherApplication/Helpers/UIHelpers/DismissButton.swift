//
//  DismissButton.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumalo on 2026/03/07.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .padding(20)
                .font(.title)
                .background(Color.black)
                .clipShape(Circle())
                .overlay (
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                )
        }
    }

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
