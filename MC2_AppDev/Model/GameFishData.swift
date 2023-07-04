//
//  GameFishData.swift
//  MC2_AppDev
//
//  Created by Reiner Anggriawan Jasin on 03/07/23.
//

import Foundation

class GameFishData {
    
    let fish_list:[String:Fish] = [
        "Neon Tetra" : Fish(
            latin_name: "Paracheirodon innesi",
            english_name: "Neon Tetra",
            colony: ["School"],
            environment: ["Medium", "Large"],
            temperament: ["Peaceful"],
            diet: "Omnivore",
            compatibility: ["Guppy", "Platy", "Molly"],
            incompatibility: ["Betta", "Tiger Barb", "Cichlids"]
        ),
        "Guppy" : Fish(
            latin_name: "Poecilia reticulata",
            english_name: "Guppy",
            colony: ["School"],
            environment: ["Medium", "Large"],
            temperament: ["Peaceful"],
            diet: "Omnivore",
            compatibility: ["Neon Tetra", "Platy", "Corydoras"],
            incompatibility: ["Betta", "Cichlids", "Angelfish"]
        ),
        "Molly" : Fish(
            latin_name: "Poecilia sphenops",
            english_name: "Molly",
            colony: ["Pairs", "School"],
            environment: ["Medium", "Large"],
            temperament: ["Peaceful"],
            diet: "Omnivore",
            compatibility: ["Neon Tetra", "Platy", "Corydoras"],
            incompatibility: ["Betta", "Tiger Barb", "Zebra Danios"]
        ),
        "Platy" : Fish(
            latin_name: "Xiphophorus maculatus",
            english_name: "Platy",
            colony: ["Alone", "Pairs", "School"],
            environment: ["Small", "Medium", "Large"],
            temperament: ["Peaceful"],
            diet: "Omnivore",
            compatibility: ["Guppy", "Neon Tetra", "Corydoras"],
            incompatibility: ["Cichlids", "Angelfish", "Betta"]
        ),
        "Tiger Barb" : Fish(
            latin_name: "Puntigrus tetrazona",
            english_name: "Tiger Barb",
            colony: ["School"],
            environment: ["Medium", "Large"],
            temperament: ["Semi-aggresive", "Aggresive"],
            diet: "Omnivore",
            compatibility: ["Zebra Danios", "Corydoras", "Harlequin Rasboras"],
            incompatibility: ["Neon Tetra", "Angelfish", "Betta"]
        ),
        "Betta" : Fish(
            latin_name: "Betta splendens",
            english_name: "Betta",
            colony: ["Alone", "Pairs"],
            environment: ["Small", "Medium", "Large"],
            temperament: ["Aggresive"],
            diet: "Carnivore",
            compatibility: ["Kuhli Loaches", "Pygmy Corydoras", "Brisltenose Plecos"],
            incompatibility: ["Guppy", "Angelfish", "Tiger Barb"]
        ),
        "Clownfish" : Fish(
            latin_name: "Amphiprion ocellaris",
            english_name: "Clownfish",
            colony: ["Alone", "Pairs", "School"],
            environment: ["Medium", "Large"],
            temperament: ["Peaceful", "Semi-Aggresive"],
            diet: "Omnivore",
            compatibility: ["Chromis", "Cleaner Wrasse", "Gobies"],
            incompatibility: ["Angelfish", "Triggerfish", "Pufferfish"]
        ),
        "Blue-green Chromis" : Fish(
            latin_name: "Chromis viridis",
            english_name: "Blue-green Chromis",
            colony: [],
            environment: [],
            temperament: [],
            diet: "",
            compatibility: [],
            incompatibility: []
        ),
        "Blue Neon Goby" : Fish(
            latin_name: "Elacatinus oceanops",
            english_name: "Blue Neon Goby",
            colony: ["Alone", "Pairs", "School"],
            environment: ["Medium", "Large"],
            temperament: ["Peaceful", "Semi-aggresive"],
            diet: "Omnivore",
            compatibility: ["Banggai Cardinalfish", "Royal Gramma", "Clownfish"],
            incompatibility: ["Pufferfish", "Humphead Wrasse", "Tetras"]
        ),
        "Bluestreak Cleaner Wrasse" : Fish(
            latin_name: "Labroides Dimidiatus",
            english_name: "Bluestreak Cleaner Wrasse",
            colony: ["Alone", "Pairs", "School"],
            environment: ["Large"],
            temperament: ["Peaceful"],
            diet: "Carnivore",
            compatibility: ["Cardinalfish", "Clownfish", "Damselfish"],
            incompatibility: ["Damselfish", "Tetras", "Aggresive Gobies"]
        ),
        "Koi" : Fish(
            latin_name: "Cyprinus rubrofuscus",
            english_name: "Koi",
            colony: ["Pairs", "School"],
            environment: ["Large"],
            temperament: ["Peaceful", "Semi-aggresive"],
            diet: "Omnivore",
            compatibility: ["Goldfish", "White Cloud Mountain Minnow", "Rosy Barb"],
            incompatibility: ["Small sized fish", "Barbs", "Aggresive Fish"]
        ),

    ]
    
}
