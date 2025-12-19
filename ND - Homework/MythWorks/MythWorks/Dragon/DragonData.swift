//
//  Dragon.swift
//  MythWorks
//
//  Created by Ethan Allgaier on 12/5/25.
//

import SwiftUI
//Dragon info
struct Dragon: Identifiable, Hashable {
    var name: String
    var imageName: String
    var id = UUID()
    var species: String
    var fireRating: Int
    var lore: String
    var abilities: [String]
}





//sample data for each dragon
enum SampleDragonData {
    static let dragons: [Dragon] = [

      
        Dragon(
            name: "Smaug",
            imageName: "flameDragon",
            species: "Fire Dragon",
            fireRating: 10,
            lore: "The King of the Dragons",
            abilities: ["Fire Breath", "Fire Shield", "Inferno Blast"]
        ),

        Dragon(
            name: "Bozar",
            imageName: "poisonDragon",
            species: "Water Dragon",
            fireRating: 5,
            lore: "Ancient sea guardian",
            abilities: ["Water Breath", "Toxic Wave", "Venom Shield"]
        ),

        Dragon(
            name: "Grommash",
            imageName: "dryDragon",
            species: "Earth Dragon",
            fireRating: 3,
            lore: "Guardian of mountains and stone",
            abilities: ["Earth Breath", "Stone Skin", "Quake Slam"]
        ),

        Dragon(
            name: "Sky Wyrm",
            imageName: "cloudDragon",
            species: "Storm Lizard",
            fireRating: 2,
            lore: "Rides the thunderheads and scatters lightning across the peaks.",
            abilities: ["Sky Dive", "Thundercall", "Cloud Cloak"]
        ),

        Dragon(
            name: "Frost Claw",
            imageName: "DarkDragon",
            species: "Glacier Drake",
            fireRating: 1,
            lore: "Its wings freeze the air; legends say it sleeps on glaciers.",
            abilities: ["Blizzard Breath", "Ice Spikes", "Frost Shield"]
        ),

        Dragon(
            name: "Red Fang",
            imageName: "redDragon",
            species: "Crimson Dragon",
            fireRating: 8,
            lore: "A ruthless dragon feared across the realms.",
            abilities: ["Blood Flame", "Crimson Roar", "Scorching Dive"]
        ),

        Dragon(
            name: "Applewyrm",
            imageName: "appleDragon",
            species: "Forest Dragon",
            fireRating: 1,
            lore: "A rare dragon that guards ancient orchards.",
            abilities: ["Vine Lash", "Fruit Bomb", "Nature Shield"]
        ),

      
        Dragon(
            name: "Ashmaw",
            imageName: "flameDragon",
            species: "Inferno Dragon",
            fireRating: 9,
            lore: "Born from living magma.",
            abilities: ["Magma Breath", "Ash Cloak", "Lava Dive"]
        ),

        Dragon(
            name: "Venomscale",
            imageName: "poisonDragon",
            species: "Toxic Dragon",
            fireRating: 6,
            lore: "Its scales drip a lethal poison.",
            abilities: ["Poison Mist", "Venom Fang", "Corrupt Shield"]
        ),

        Dragon(
            name: "Stoneback",
            imageName: "dryDragon",
            species: "Mountain Dragon",
            fireRating: 4,
            lore: "Slow, massive, and unstoppable.",
            abilities: ["Rock Slam", "Iron Hide", "Seismic Stomp"]
        ),

        Dragon(
            name: "Nimbus",
            imageName: "cloudDragon",
            species: "Sky Dragon",
            fireRating: 3,
            lore: "Appears only during massive storms.",
            abilities: ["Wind Slash", "Storm Call", "Cloud Veil"]
        ),

        Dragon(
            name: "Nightcoil",
            imageName: "DarkDragon",
            species: "Shadow Dragon",
            fireRating: 2,
            lore: "Hunts beneath moonless skies.",
            abilities: ["Shadow Breath", "Night Cloak", "Fear Roar"]
        ),

        Dragon(
            name: "Crimson Rex",
            imageName: "redDragon",
            species: "War Dragon",
            fireRating: 7,
            lore: "Bred solely for destruction.",
            abilities: ["War Cry", "Flame Charge", "Bloodfire"]
        ),

        Dragon(
            name: "Ciderclaw",
            imageName: "appleDragon",
            species: "Orchard Dragon",
            fireRating: 1,
            lore: "Playful guardian of ancient groves.",
            abilities: ["Seed Shot", "Apple Bomb", "Bark Shield"]
        )
    ]
}
