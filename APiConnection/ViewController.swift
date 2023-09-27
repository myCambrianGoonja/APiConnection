//
//  ViewController.swift
//  APiConnection
//
//  Created by Goonja on 26/09/23.
//

import UIKit

class ViewController: UIViewController {

    private let breakingBadUrl = "https://api.breakingbadquotes.xyz/v1/quotes/10";
    private let gameOfThronesUrl = "https://api.gameofthronesquotes.xyz/v1/random";
    private let stoicUrl = "https://api.themotivate365.com/stoic-quote"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func breakingBad(_ sender: Any) {
        Task { @MainActor in
            await await fetch(url: breakingBadUrl)
        }
    }
   
    @IBAction func gameOfThrones(_ sender: Any) {
        Task { @MainActor in
            await await fetch(url: gameOfThronesUrl)
        }
    }
    
    @IBAction func stoic(_ sender: Any) {
        Task { @MainActor in
            await await fetch(url: stoicUrl)
        }
    }
    func fetch(url: String) async -> Any {
        guard
            let url = URL(string: url)
        else {preconditionFailure("Cannot get url from string")}
        
        let (data, response) = try! await URLSession.shared.data(from: url)
        
        let jsonObject = try! JSONSerialization.jsonObject(with: data)
        
        print(jsonObject)
        
        return jsonObject
    }


}

