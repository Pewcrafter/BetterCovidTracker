//
//  HomepageViewController.swift
//  CSFinal
//
//  Created by Michael Stoneman on 11/20/20.
//

import UIKit

class HomepageViewController: UIViewController {
    
    @IBOutlet weak var graph: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var graphLabel: UILabel!
    @IBOutlet weak var footerLabel: UILabel!
    @IBOutlet var CityButtons: [UIButton]!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "image")!)
        super.viewDidLoad()
    }
    
    @IBAction func selectCountyClicked(_ sender: UIButton) {
            hideEm()
    }
    
    enum Counties: String {
        case ada = "Ada"
        case canyon = "Canyon"
        case boise = "Boise"
        case payette = "Payette"
    }
    @IBAction func hideEm(){
        CityButtons.forEach {(button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBAction func countyTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let county = Counties(rawValue: title) else {
            return
            }
        
        switch county {
        case .ada:
            //do ada stuff here
            graphLabel.text = "Ada County Data"
            graph.image = UIImage(named: "adaCountyGraph")
            hideEm()
            footerLabel.text = "Data supplied from https://covid.jesse-riggs.com and parsed for Ada"
            
        case .canyon:
            //Canyon stuff here
            graphLabel.text = "Canyon County Data"
            graph.image = UIImage(named: "boiseCountyGraph")
            hideEm()
            footerLabel.text = "Data supplied from https://covid.jesse-riggs.com and parsed for Canyon"
            
        case .boise:
            //do boise stuff here
            graphLabel.text = "Boise County Data"
            graph.image = UIImage(named: "boiseCountyGraph")
            hideEm()
            footerLabel.text = "Data supplied from https://covid.jesse-riggs.com and parsed for Boise"
            
        case .payette:
            //payette stuff here
            graphLabel.text = "Payette County Data"
            graph.image = UIImage(named: "adaCountyGraph")
            hideEm()
            footerLabel.text = "Data supplied from https://covid.jesse-riggs.com and parsed for Payette"
            
        default:
                //default stuff here
            graphLabel.text = "Ada County Data"
            graph.image = UIImage(named: "adaCountyGraph")
            hideEm()
            footerLabel.text = "Data supplied from https://covid.jesse-riggs.com and parsed for Ada"
            
        }
    }
}
