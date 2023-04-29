//
//  ModelLogic.swift
//  BigBangFinalApp
//
//  Created by Jose Portilla Portilla on 7/4/23.
//

import UIKit

final class ModelLogic {
    static let shared = ModelLogic()
    let persistance = ModelPersistance.shared
    
    var episodes = [EpisodesModel]()
    var seasons:[Int] {
        Array(Set(episodes.map(\.season))).sorted { $0 < $1}
    }
    
    var snapshot:NSDiffableDataSourceSnapshot<String, Int> {
        var snapshot = NSDiffableDataSourceSnapshot<String, Int>()
        snapshot.appendSections([""])
        snapshot.appendItems(seasons)
        
        
        
        return snapshot
    }
    
    init() {
        do {
            episodes = try persistance.getEpisodes()
        } catch {
            episodes = []
        }
    }
    
    func getEpisodesSnapShot(season: Int) -> NSDiffableDataSourceSnapshot<String, EpisodesModel> {
        var snapshot = NSDiffableDataSourceSnapshot<String, EpisodesModel>()
        snapshot.appendSections([""])
        
        let episodesBySeason = getEpisodesBySeason(season: season)
        snapshot.appendItems(episodesBySeason)
        
        return snapshot
    }
    
    func getEpisodesBySeason(season:Int) -> [EpisodesModel] {
        let episodes = episodes.filter { episode in
            episode.season == season
        }
        return episodes
    }
    
    func getContentForRow(tableView:UITableView, indexPath: IndexPath, episode: EpisodesModel) -> UITableViewCell {
        var content = UIListContentConfiguration.subtitleCell()
        content.text = episode.name
        content.image = UIImage(named: episode.image)
        content.imageProperties.maximumSize = CGSize(width: 100, height: 80)
        content.imageProperties.cornerRadius = 10
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodesCell", for: indexPath)
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func getDetailEpisode(season:Int, episode:Int) -> EpisodesModel {
        let episodesList = getEpisodesBySeason(season: season)
        return episodesList[episode]
    }
}
