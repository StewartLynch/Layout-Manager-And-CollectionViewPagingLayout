//
//  FactListViewModel.swift
//  Happy Facts
//
//  Created by Stewart Lynch on 2021-05-17.
//

import Foundation

class FactListViewModel: ObservableObject {
    @Published var facts:[Fact] = []
    @Published var selectedFactId:String?
    func fetch() {
        facts = [
            Fact(title: "Sleeping Otters", imageName: "Otters", photoCredit: "commons.wikimedia.org", caption: "Sea otters hold hands when they sleep to keep from drifting apart"),
            Fact(title: "Smile for the Blind", imageName: "Smile", photoCredit: "Sachiho", caption: "Blind people smile even though they’ve never seen anyone else smile."),
            Fact(title: "Breathing Turtles", imageName: "Turtle", photoCredit: "TaraDSturm", caption: "Turtles can breathe through their butts."),
            Fact(title: "Tree Planters", imageName: "Squirell", photoCredit: "Irene Mei", caption: "Squirrels plant thousands of new trees each year simply by forgetting where they put their acorns."),
            Fact(title: "Chinese Panda", imageName: "Panda", photoCredit: "Cute Baby Animals", caption: "In China, killing a Panda is punishable by death."),
        ]
        selectedFactId = facts[0].id
    }
    
    func fetchFromJSON() {
        facts = Bundle.main.decode([Fact].self, from: "Facts.json")
        selectedFactId = facts[0].id
    }
    
    func selectedFact(id: String?) -> Fact? {
        return facts.first(where: {$0.id == id})
    }

    func newFact() {
        // This updates the @Published property, but the view does not refresh
        print("Adding Fact")
        facts.append(Fact(title: "Penguin Marriage", imageName: "Penguins", photoCredit:"telegraph.co.uk", caption: "Gentoo penguins propose to their lifemates with a pebble."))
    }
}


