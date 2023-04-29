//
//  DetailTableViewController.swift
//  BigBangFinalApp
//
//  Created by Jose Portilla Portilla on 9/4/23.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var Season: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var sumaryLabel: UILabel!
    
    var selectedEpisode:EpisodesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedEpisode else { return }
        episodeTitle.text = selectedEpisode.name
        episodeImageView.image = UIImage(named: selectedEpisode.image)
        Season.text = "Season: \(selectedEpisode.season)"
        episode.text = "Episode: \(selectedEpisode.number)"
        airDate.text = "Air Date: \(selectedEpisode.airdate)"
        runTime.text = "Run Time: \(selectedEpisode.runtime)"
        sumaryLabel.text = selectedEpisode.summary
    }

    @IBAction func navigateToEpisodeIMDB(_ sender: Any) {
        guard let urlString = selectedEpisode?.url,
              let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 1
        }
        
        return 20
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 1
    
        }
        
        return 20
    }
  
 
}

