//
//  ForecastView.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumalo on 2026/03/06.
//

import SwiftUI

struct ForecastView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
            VStack {
                Text("20 Degrees")
                    .font(.largeTitle)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundView)
        }
    }


struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel:WeatherViewModel())
    }
}

extension ForecastView {
    
    @ViewBuilder
    var backgroundView: some View {
        switch viewModel.weatherCondition {
            
        case .sunny:
            Image("Sunny").ignoresSafeArea()
            
        case .cloudy:
            Image("Cloudy").ignoresSafeArea()
            
        case .rainy:
            Image("Rainy").ignoresSafeArea()
        }
    }
}
