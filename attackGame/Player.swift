//
//  Player.swift
//  attackGame
//
//  Created by user on 7/9/16.
//  Copyright © 2016 user. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var loot: [String]{
        return ["Strength", "Health", "Speed"]
    }
    
    var name: String{
        get{
            return _name
        } 
    }

    convenience init(name: String, hp: Int, attackPwr: Int){
        self.init(startingHP: hp, attackPwr: attackPwr)
        
        _name = name
    }
    
    func dropLoot () -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(2))
            return loot[rand]
        } else {
            return nil
        }
    }
}