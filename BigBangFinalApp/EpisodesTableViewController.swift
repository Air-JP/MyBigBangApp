//
//  EpisodesTableViewController.swift
//  BigBangFinalApp
//
//  Created by Jose Portilla Portilla on 8/4/23.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
    
    var logic = ModelLogic.shared
    var selectedSeason:Int?
    
    lazy var episodesDataSource: EpisodesDiffableDataSource = {
        EpisodesDiffableDataSource(tableView: tableView) { table, indexPath, episode in
            
            self.logic.getContentForRow(tableView: table, indexPath: indexPath, episode: episode)
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedSeason = selectedSeason else { return }
        title = "Episodes Season \(selectedSeason)"
        tableView.dataSource = episodesDataSource
        episodesDataSource.apply(logic.getEpisodesSnapShot(season: selectedSeason))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = tableView.indexPathForSelectedRow,
              let detailViewController = segue.destination as? DetailTableViewController,
              let selectedSeason else { return }
        
        if segue.identifier == "detailSegue" {
            detailViewController.selectedEpisode = logic.getDetailEpisode(season: selectedSeason, episode: indexPath.row)
        }
    }
}

