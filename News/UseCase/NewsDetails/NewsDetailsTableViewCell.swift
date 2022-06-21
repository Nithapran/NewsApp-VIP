//
//  NewsDetailsTableViewCell.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-19.
//

import UIKit

class NewsDetailsTableViewCell: UITableViewCell {
    
    var news: News? {
        didSet {
            setUpView()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var publishedAtLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setUpView() {
        titleLabel.text = news?.title
        newsImage.sd_setImage(with: URL(string: news?.urlToImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        descriptionLabel.text = news?.description
        authorLabel.text = news?.author ?? "Unknown"
        publishedAtLabel.text = news?.publishedAt
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
