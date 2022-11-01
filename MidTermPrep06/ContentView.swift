//
//  ContentView.swift
//  MidTermPrep06
//
//  Created by JPL-ST-SPRING2022 on 10/31/22.
//

import SwiftUI

struct ContentView: View {
    @State private var i = 0
    @State private var totalAmt = 0.0
    @State private var orders: [Int] = []
    @State private var receipt = ""
    
    private let menuItems = [
        "Humble Hamburger",
        "Super Sushi",
        "Creative Crepes",
        "Fabolous Fries",
        "Pleasant Pizza"
    ]
    
    private let images = [
        "Hamburger",
        "Sushi",
        "Crepes",
        "Fries",
        "Pizza"
    ]
    
    private let prices = [
        12.99,
        14.99,
        16.99,
        17.99,
        18.99
    ]
    
    var body: some View {
        ZStack {
            Color.orange
            VStack {
                Image(images[i])
                    .resizable()
                    .scaledToFit()
                    .padding(20);
                Text("\(menuItems[i]): $\(prices[i].formatted())")
                    .padding()
                
                HStack {
                    Button("Prev") {
                        if i < menuItems.count - 1 {
                            i = i - 1
                            print(i)
                        } else {
                            i = 0
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.caption)
                    .padding()
                    
                    Button("Next") {
                        if i < menuItems.count - 1 {
                            i = i + 1
                            print(i)
                        } else {
                            i = 0
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.caption)
                    .padding()
                    
                    Button("Buy") {
                        receipt = ""
                        totalAmt = 0.0
                        orders.append(i)
                        
                        for item in orders {
                            totalAmt = totalAmt + prices[item]
                            receipt = receipt + "\n\(menuItems[item]): $\(prices[item].formatted())"
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.caption)
                    .padding()
                    
                }
                Text(receipt)
                    .padding()
                Text("Total Payment: $\(totalAmt.formatted())")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
