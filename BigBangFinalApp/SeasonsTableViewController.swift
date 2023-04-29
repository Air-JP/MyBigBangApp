//
//  SeasonsTableViewController.swift
//  BigBangFinalApp
//
//  Created by Jose Portilla Portilla on 7/4/23.
//

import UIKit

class SeasonsTableViewController: UITableViewController {
    var logic = ModelLogic.shared
    
    lazy var dataSource: SeasonDiffableDataSource = {
        SeasonDiffableDataSource(tableView: tableView) { [self] tableView, indexPath, season in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonCell", for: indexPath) as? SeasonViewCell
            
            cell?.seasonImage.image = UIImage(named: "season\(season)")
            cell?.seasonLabel.text = "Season: \(season)"
            
            return cell
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        dataSource.apply(logic.snapshot)
    }
    
    
    @IBSegueAction func ShowEpisodesSegue(_ coder: NSCoder, sender: Any?) -> EpisodesTableViewController? {
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }
        
        let episodesVC = EpisodesTableViewController(coder: coder)
        episodesVC?.selectedSeason = logic.seasons[indexPath.row]
                
        return episodesVC
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EpisodesSegue" {
            guard let indexPath =
                    tableView.indexPathForSelectedRow,
                  let episodes = segue.destination as?
                    EpisodesTableViewController else {
                return }
            
            episodes.selectedSeason = logic.seasons[indexPath.row]
        }
    }
}
