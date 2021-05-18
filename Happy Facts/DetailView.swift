//
//  DetailView.swift
//  Happy Facts
//
//  Created by Stewart Lynch on 2021-05-17.
//

import SwiftUI

struct DetailView: View {
    let id: UUID?
    var vm:FactListViewModel
    var body: some View {
            VStack {
                Image(vm.selectedFact(id: id)?.imageName ?? "")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .overlay(Text(vm.selectedFact(id: id)?.photoCredit ?? "")
                                .font(.callout)
                                .padding(6)
                                .foregroundColor(.white)
                                .background(Color.black.opacity(0.8))
                                .cornerRadius(10)
                                .padding(6),
                             alignment: .bottomTrailing)
                Text(vm.selectedFact(id: id)?.title ?? "")
                    .font(.largeTitle)
                Text(vm.selectedFact(id: id)?.caption ?? "")
                Spacer()
            }
            .padding()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let factListVM = FactListViewModel()
        DetailView(id: factListVM.facts[0].id, vm: factListVM)
    }
}
