//
//  ContentView.swift
//  Happy Facts
//
//  Created by Stewart Lynch on 2021-05-18.
//

import SwiftUI
import CollectionViewPagingLayout

struct ContentView: View {
    @StateObject var factListVM = FactListViewModel()
    var options: ScaleTransformViewOptions {
        .layout(.linear)
    }
    var body: some View {
        NavigationView {
            VStack {
                ScalePageView(factListVM.facts, selection: $factListVM.selectedFactId) { fact in
                    Image(fact.imageName)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .overlay(Text(fact.photoCredit)
                                    .font(.callout)
                                    .padding(6)
                                    .foregroundColor(.white)
                                    .background(Color.black.opacity(0.8))
                                    .cornerRadius(10)
                                    .padding(6),
                                 alignment: .bottomTrailing)
                }
                .options(options)
                .pagePadding(
                    vertical: .absolute(20),
                    horizontal: .absolute(100)
                )
                if factListVM.selectedFactId != nil {
                    DetailView(id: factListVM.selectedFactId, vm: factListVM)
                }
                Button("Add Fact") {
                    factListVM.newFact()
                }
                Spacer()
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
