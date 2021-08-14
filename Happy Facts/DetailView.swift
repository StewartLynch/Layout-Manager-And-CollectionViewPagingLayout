//
//  DetailView.swift
//  Happy Facts
//
//  Created by Stewart Lynch on 2021-05-17.
//

import SwiftUI

struct DetailView: View {
    let id: String?
    var vm:FactListViewModel
    var body: some View {
            VStack {
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
