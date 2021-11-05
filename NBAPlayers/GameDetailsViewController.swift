//
//  GameDetailsViewController.swift
//  NBAPlayers
//
//  Created by Lev Makarenko on 27.01.2021.
//

import UIKit

class GameDetailsViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var homeTeamProfileButton: UIButton!
    @IBOutlet weak var visitorTeamLabel: UILabel!
    @IBOutlet weak var visitorTeamScoreLabel: UILabel!
    @IBOutlet weak var visitorTeamProfileButton: UIButton!
    
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = game?.fullName
        dateLabel.text = game?.date
        statusLabel.text = game?.status
        homeTeamLabel.text = game?.homeTeam.fullName
        homeTeamScoreLabel.text = game?.homeTeamScoreStr
        visitorTeamLabel.text = game?.visitorTeam.fullName
        visitorTeamScoreLabel.text = game?.visitorTeamScoreStr
    }

    @IBAction func homeTeamProfileButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController

        viewController.team = game?.homeTeam

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func visitorTeamProfileButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController

        viewController.team = game?.visitorTeam

        navigationController?.pushViewController(viewController, animated: true)
    }
}
