//
//  ConcentrationThemeChooseViewController.swift
//  Concentration
//
//  Created by Vyacheslav Pronin on 06/05/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import UIKit

class ConcentrationThemeChooseViewController: UIViewController {

    let themes: [String: Int] = [
        "Animals": 0,
        "Fruits": 1,
        "Faces": 2,
        "Objects": 3,
        "Sports": 4,
        "Whater": 5
    ]
    
    private var lastSeguedtToConcentrationViewController​: ConcentrationViewController?
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = lastSeguedtToConcentrationViewController​ {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
                }
                navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                    lastSeguedtToConcentrationViewController​ = cvc
                }
            }
            
        }
    }

}
