//
//  ContentView.swift
//  Happy Facts
//
//  Created by Stewart Lynch on 2021-05-18.
//

import SwiftUI

struct ContentView: View {
    @StateObject var factListVM = FactListViewModel()
    
    var body: some View {
        NavigationView {
            List(factListVM.facts) { fact in
                NavigationLink(
                    destination: DetailView(id: fact.id, vm: factListVM)) {
                    HStack {
                        Image(fact.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(fact.title)
                            .font(.title)
                    }
                }
            }
            .navigationTitle("Happy Facts")
        }.onAppear {
            factListVM.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
