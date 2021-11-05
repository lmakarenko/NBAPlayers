//
//  TeamDetailsViewController.swift
//  NBAPlayers
//
//  Created by Aleksandr Anosov on 23.01.2021.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!

    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = team?.name
        cityLabel.text = team?.city
        conferenceLabel.text = team?.conference
    }

}
