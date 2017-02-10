//: Playground - noun: a place where people can play

import UIKit


//  Creation of Dictionary for each Player

let joeSmith: [String: String] =
        ["Name": "Joe Smith",
         "Height": "42",
         "Soccer Experience": "YES",
         "Guardian Name(s)": "Jim and Jan Smith"]

let jillTanner: [String: String] =
        ["Name": "Jill Tanner",
         "Height": "36",
         "Soccer Experience": "YES",
         "Guardian Name(s)": "Clara Tanner"]

let billBon: [String: String] =
        ["Name": "Bill Bon", "Height": "43",
         "Soccer Experience": "YES",
         "Guardian Name(s)": "Sara and Jenny Bon"]

let evaGordon: [String: String] =
        ["Name": "Eva Gordon",
         "Height": "45",
         "Soccer Experience": "NO",
         "Guardian Name(s)": "Wendy and Mike Gordon"]

let mattGill: [String: String] =
    ["Name": "Matt Gill",
     "Height": "40",
     "Soccer Experience": "NO",
     "Guardian Name(s)": "Charles and Sylvia Gill"]

let kimmyStein: [String: String] =
        ["Name": "Kimmy Stein",
         "Height": "41",
         "Soccer Experience": "NO",
         "Guardian Name(s)": "Bill and Hillary Stein"]

let sammyAdams: [String: String] =
        ["Name": "Sammy Adams",
         "Height": "45",
         "Soccer Experience": "NO",
         "Guardian Name(s)": "Jeff Adams"]

let karlSaygan: [String: String] =
        ["Name": "Karl Saygan",
         "Height": "42",
         "Soccer Experience": "YES",
         "Guardian Name(s)": "Heather Bledsoe"]

let suzaneGreenberg: [String: String] =
        ["Name": "Suzane Greenberg",
         "Height": "44",
         "Soccer Experience": "YES",
         "Guardian Name(s)": "Henrietta Dumas" ]

let salDali: [String: String] =
        ["Name": "Sal Dali",
         "Height": "41",
         "Soccer Experience": "NO",
         "Guardian Name(s)": "Gala Dali"]

let joeKavalier: [String: String] =
        ["Name": "Joe Kavalier",
         "Height": "39",
         "Soccer Experience": "NO",
         "Guardian Name(s)": "Sam and Elaine Kavalier"]

let benFinkelstein: [String: String] =
        ["Name": "Ben Finkelstein",
         "Height": "44",
         "Soccer Experience": "NO",
         "Guardian Name(s)": "Aaron and Jill Finkelstein"]

let diegoSoto: [String: String] =
        ["Name": "Diego Soto",
         "Height": "41", "Soccer Experience": "YES",
         "Guardian Name(s)": "Robin and Sarika Soto"]

let chloeAlaska: [String: String] =
        ["Name": "Chloe Alaska",
         "Height": "47",
         "Soccer Experience": "NO",
         "Guardian Name(s)": "David and Jamie Alaska"]

let arnoldWillis: [String: String] =
        ["Name": "Arnold Willis",
         "Height": "43",
         "Soccer Experience": "NO",
         "Guardian Name(s)": "Claire Willis"]

let phillipHelm: [String: String] =
        ["Name": "Phillip Helm",
         "Height": "44",
         "Soccer Experience": "YES",
         "Guardian Name(s)": "Thomas Helm and Eva Jones"]

let lesClay: [String: String] =
        ["Name": "Les Clay",
         "Height": "42",
         "Soccer Experience": "YES",
         "Guardian Name(s)": "Wynonna Brown"]

let herschelKrustofski: [String: String] =
        ["Name": "Herschel Krustofski",
         "Height": "45",
         "Soccer Experience": "YES",
         "Guardian Name(s)": "Hyman and Rachel Krustofski"]

//Creation of Players Dictionary
var players =
    [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzaneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]

// Creation of Teams Arrary
var teamDragons: [[String: String]] = []
var teamSharks: [[String: String]] = []
var teamRaptors: [[String: String]] = []

var teams: [String:[[String: String]]] = ["Sharks" : teamSharks, "Dragons" : teamDragons, "Raptors": teamRaptors]


// Calculation Teamsize
let totalPlayers: Int = players.count
let teamSize: Int = totalPlayers / 3
    
var experiencedPlayerscount = 0
var notExperiencedPlayerscount = 0
    
    for player in players{
        if player["Soccer Experience"] == "YES" {
           experiencedPlayerscount += 1
            
        }else if player["Soccer Experience"] == "NO" {
            notExperiencedPlayerscount += 1
        }
        
    }

// Calculation of Distribution of experienced Players
let totalExperienced = experiencedPlayerscount
var experiencedPerTeam = totalExperienced/teams.count
let notexperiencedPerTeam = teamSize - experiencedPerTeam



// Put Players into teams by first adding experienced players to team
for var team in teams {
    for (index, player) in players.enumerated() {
        if player["Soccer Experience"] == "YES" {
            if team.value.count < experiencedPerTeam {
              team.value.append(player)
              players.remove(at: index)
            
            }
        }
        
    
    }
    teams.updateValue(team.value, forKey: team.key)
}

//and afterwards adding not experienced players to team
for var team in teams {
    for (index, player) in players.enumerated() {
        if player["Soccer Experience"] == "NO" {
            if team.value.count < notexperiencedPerTeam+experiencedPerTeam {
                team.value.append(player)
                players.remove(at: index)
                
            }
        }
        
        
    }
    teams.updateValue(team.value, forKey: team.key)
}



// Creating letter for teams with player name, team name, guardian names, practice date/time

var letters: [String] = []


for team in teams {
    for player in team.value {
        if let guardian = player["Guardian Name(s)"], let name = player["Name"]{
            if team.key == "Sharks"{
                letters.append("Dear \(guardian),\n Congratulation your child, \(name) is in Team \(team.key). We will start practice at March 17, 3pm. Kind Regards Your Soccer Coach")

        }else if team.key == "Dragons"{
          letters.append("Dear \(guardian),\n Congratulation your child, \(name) is in Team \(team.key). We will start practice at March 17, 1pm. Kind Regards Your Soccer Coach")
        }else if team.key == "Raptors"{
          letters.append("Dear \(guardian),\n Congratulation your child, \(name) is in Team \(team.key). We will start practice at March 18, 1pm. Kind Regards Your Soccer Coach")
        }
    }
    }
}

print(letters)





