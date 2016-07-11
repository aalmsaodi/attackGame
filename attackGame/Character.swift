//
//  File.swift
//  attackGame
//
//  Created by user on 7/9/16.
//  Copyright © 2016 user. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPwr = 10
    private var _recoveryTime = 3.0
    
    var attackPwr: Int {
        get {
            return _attackPwr
        } set {
            _attackPwr = newValue
        }
    }
    
    var hp: Int {
        get {
            return _hp
        } set {
            _hp = newValue
        }
    }
    
    var recoveryTime: Double {
        get {
            return _recoveryTime
        } set {
            _recoveryTime = newValue
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHP: Int, attackPwr:Int){
        self._attackPwr = attackPwr
        self._hp = startingHP
    }
    
    func addHpStength() {
        _attackPwr += 5
    }
    
    func addHealth() {
        _hp += 20
    }
    
    func addSpeed () {
        if _recoveryTime >= 0.0 {
            _recoveryTime -= 0.5
        }
    }
    
    
    func attemptAttack (attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
}