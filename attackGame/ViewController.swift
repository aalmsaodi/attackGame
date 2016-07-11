//
//  ViewController.swift
//  attackGame
//
//  Created by user on 7/9/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var printLabl: UILabel!
   
    @IBOutlet weak var player1Labl: UILabel!
    
    @IBOutlet weak var player2Labl: UILabel!
    
    @IBOutlet weak var player1Image: UIImageView!

    @IBOutlet weak var player2Image: UIImageView!
    
    @IBOutlet weak var chestPlayer1: UIButton!

    @IBOutlet weak var chestPlayer2: UIButton!
 
    @IBOutlet weak var attackBtnPlayer1: UIButton!
    
    @IBOutlet weak var attackBtnPlayer2: UIButton!
    

   
    var player1: Player!
    var player2: Player!
    
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1 = Player(name: "Player1", hp: 110, attackPwr: 20)
        player1Labl.text = "\(player1.hp) HP"
        
        player2 = Player(name: "Player2", hp: 110, attackPwr: 20)
        player2Labl.text = "\(player2.hp) HP"
        
    }

    @IBAction func onPlayer1_attackPreseed(sender: AnyObject) {
        player2.attemptAttack(player1.attackPwr)
        printLabl.text = "Player1 Attacked Player2 for \(player1.attackPwr) HP"
        player2Labl.text = "\(player2.hp) HP"
        
        attackBtnPlayer2.enabled = false
        
        NSTimer.scheduledTimerWithTimeInterval(player2.recoveryTime, target: self, selector: "enablePlayer2Btn", userInfo: nil, repeats: false)
        
        if let loot = player2.dropLoot(){
            if loot == "Strength" {
                player1.addHpStength()
            } else if loot == "Health" {
                player1.addHealth()
                player1Labl.text = "\(player1.hp)"
            } else if loot == "Speed" {
                player1.addSpeed()
            }
            chestMessage = "\(player1.name) found \(loot)"
        }
        
        if !player2.isAlive {
            player2Labl.text = ""
            printLabl.text = "\(player1.name) Killed \(player2.name)"
            player2Image.hidden = true
            attackBtnPlayer2.hidden = true
            chestPlayer2.hidden = false
        }
    }
    
    @IBAction func onPlayer2_attackPressed(sender: AnyObject) {
        player1.attemptAttack(player2.attackPwr)
        printLabl.text = "Player2 Attacked Player1 for \(player2.attackPwr) HP"
        player1Labl.text = "\(player1.hp) HP"
        
        attackBtnPlayer1.enabled = false
        
        NSTimer.scheduledTimerWithTimeInterval(player1.recoveryTime, target: self, selector: "enablePlayer1Btn", userInfo: nil, repeats: false)
        
        if let loot = player1.dropLoot(){
            if loot == "Strength" {
                player2.addHpStength()
            } else if loot == "Health" {
                player2.addHealth()
                player2Labl.text = "\(player2.hp)"
            } else if loot == "Speed" {
                player2.addSpeed()
            }
            chestMessage = "\(player2.name) found \(loot)"
        }
        
        if !player1.isAlive {
            player1Labl.text = ""
            printLabl.text = "\(player2.name) Killed \(player1.name)"
            player1Image.hidden = true
            attackBtnPlayer1.hidden = true
            chestPlayer1.hidden = false
        }
    }
    


    @IBAction func player1Chest(sender: AnyObject) {
        chestPlayer1.hidden = true
        printLabl.text = chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "restartPlayer1", userInfo: nil, repeats: false)
    }
    
    @IBAction func player2Chest(sender: AnyObject) {
        chestPlayer2.hidden = true
        printLabl.text = chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "restartPlayer2", userInfo: nil, repeats: false)
    }

    func enablePlayer1Btn() {
        attackBtnPlayer1.enabled = true
    }
    
    func enablePlayer2Btn() {
        attackBtnPlayer2.enabled = true
    }
    
    func restartPlayer1(){
        player1.hp = 110
        player1.attackPwr = 20
        player1Labl.text = "\(player1.hp) HP"
        player1Image.hidden = false
        attackBtnPlayer1.hidden = false
    }

    func restartPlayer2(){
        player2.hp = 110
        player2.attackPwr = 20
        player2Labl.text = "\(player2.hp) HP"
        player2Image.hidden = false
        attackBtnPlayer2.hidden = false
    }
}

