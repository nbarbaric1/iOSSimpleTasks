//
//  SecondViewController.swift
//  drugiZadatak
//
//  Created by Infinum on 02.07.2021..
//

import Foundation
import UIKit

class SecondViewController: UIViewController{
    
    var players: Int
    var direction: Int
    var skip: Int
    var goal: Int
    
    // views
    private let resultView: UIView = {
        
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 20
        return uiView
    }()
    
    // labels
    private let playerLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Igrač koji je završio igru"
        label.textColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let playerNumber: UILabel = {
       
        let label = UILabel()
        
        label.text = "23"
        label.textColor = .white
        label.backgroundColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    private let directionLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Koliko je puta igra promijenila smjer"
        label.textColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let directionNumber: UILabel = {
       
        let label = UILabel()
        
        label.text = "23"
        label.textColor = .white
        label.backgroundColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let skipPlayerLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Koliko se puta preskočio igrač u igri"
        label.textColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let skipPlayerNumber: UILabel = {
       
        let label = UILabel()
        
        label.text = "23"
        label.textColor = .white
        label.backgroundColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        
        view.backgroundColor = .clear
        
        resultView.addSubview(playerLabel)
        resultView.addSubview(playerNumber)
        resultView.addSubview(directionLabel)
        resultView.addSubview(directionNumber)
        resultView.addSubview(skipPlayerLabel)
        resultView.addSubview(skipPlayerNumber)
        
        
        view.addSubviews([resultView])
        
        setupConstraints()
        let result: (Int, Int, Int) = playGame()
        playerNumber.text = String(result.0)
        directionNumber.text = String(result.1)
        skipPlayerNumber.text = String(result.2)
    }
    
    private func setupConstraints(){
        
        let safeZone = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            
            
        
            resultView.heightAnchor.constraint(equalTo: safeZone.heightAnchor, multiplier: 0.45),
            resultView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultView.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor),
            resultView.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor),
            
            playerLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            playerNumber.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            directionLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            directionNumber.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            skipPlayerLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            skipPlayerNumber.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            
            playerLabel.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 35),
            playerNumber.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 11),
            directionLabel.topAnchor.constraint(equalTo: playerNumber.bottomAnchor, constant: 30),
            directionNumber.topAnchor.constraint(equalTo: directionLabel.bottomAnchor, constant: 11),
            skipPlayerLabel.topAnchor.constraint(equalTo: directionNumber.bottomAnchor, constant: 30),
            skipPlayerNumber.topAnchor.constraint(equalTo: skipPlayerLabel.bottomAnchor,constant: 11)
            
        
        
        
        
        ])
        
    }
    
    func playGame() -> (Int, Int, Int){
        
        var clockwiseDirection = true
        var currentlyCounter = 1
        var n: Int
        var i = 1
        var skipCounter = 0
        var directionChangeCounter = 0

        n = goal

        func nextCounter(){
            
            if clockwiseDirection {
                if currentlyCounter == players{
                    currentlyCounter = 1
                }
                else {
                    currentlyCounter+=1
                }
            }
            else{
                if currentlyCounter == 1{
                    currentlyCounter = players
                }
                else{
                    currentlyCounter-=1
                }
                
            }
        }

        func count(){
            
            nextCounter()
            i+=1
        }





        while(i <= n){
            
            if i == n {
                print("Zadani će broj reći osoba \(currentlyCounter)")
                return (currentlyCounter, directionChangeCounter, skipCounter)
                break
            }
            
            
            
            
            
            if i % direction == 0{
                clockwiseDirection = !clockwiseDirection
                directionChangeCounter += 1
            }
            
            if i % skip == 0 {
                nextCounter()
                skipCounter += 1
            }
            
            count()
            
        }
        return (0, 0, 0)
    }
    
    
    
    
    init(plyNo: Int, dirChngNo: Int, skipNo: Int, goalNo: Int) {
        players = plyNo
        direction = dirChngNo
        skip = skipNo
        goal = goalNo
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




