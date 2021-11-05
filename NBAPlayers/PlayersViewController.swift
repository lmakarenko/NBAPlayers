//
//  PlayersViewController.swift
//  NBAPlayers
//
//  Created by Aleksandr Anosov on 04.11.2020.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!

    var players: [Player] = []
    let apiClient: ApiClient = ApiClientImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Players"
        navigationController?.navigationBar.prefersLargeTitles = true
        reloadData()
    }

    @IBAction func onReloadButtonTap(_ sender: Any) {
        reloadData()
    }

    private func showLoading() {
        errorLabel.isHidden = true
        reloadButton.isHidden = true
        activityIndicatorView.startAnimating()
    }

    private func showData() {
        errorLabel.isHidden = true
        reloadButton.isHidden = true
        activityIndicatorView.stopAnimating()
    }

    private func showError() {
        errorLabel.isHidden = false
        reloadButton.isHidden = false
        activityIndicatorView.stopAnimating()
    }

    private func reloadData() {
        showLoading()
        apiClient.getPlayers(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let players):
                    self.players = players
                    self.showData()
                case .failure:
                    self.players = []
                    self.showError()
                }
                self.tableView.reloadData()
            }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)

        let player = players[indexPath.row]

        cell.textLabel?.text = player.fullName
        cell.detailTextLabel?.text = player.team.fullName

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "PlayerDetailsViewController") as! PlayerDetailsViewController

        let player = players[indexPath.row]
        viewController.player = player

        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
