//
//  ViewController.swift
//  triva game
//
//  Created by Morgan w Rees on 12/2/20.
//
//nessacry items
//menu screen
//game screen
//answer object
//question object

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func startGame() {
        let vc = storyboard?.instantiateViewController(identifier: "game") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

