//
//  NewsTableViewCell.swift
//  NetworkLayer
//
//  Created by Nithaparan Francis on 2022-06-09.
//

import UIKit
import SDWebImage

enum NewsTableViewCellStates {
    case summary
    case detailed
}

class NewsTableViewCell: UITableViewCell {
    var state: NewsTableViewCellStates = .detailed
    
    var news: News?
    
    var saveClickAction: ((_ news: News?) -> Void)?
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        
        self.addStandardShadow()
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
        //set background color when select a cell
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = bgColorView
        
        switch state {
        case .summary:
            self.imageViewHeightConstraint.constant = 0
        case .detailed:
            self.imageViewHeightConstraint.constant = 198
        }
        
        authorLabel.text = news?.author ?? "Unknown"
        newsTitle.text = news?.title
        newsImageView.sd_setImage(with: URL(string: news?.urlToImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        newsImageView.layer.masksToBounds = true
        if let isPesisted = self.news?.isPersisted, isPesisted == true {
            saveButton.imageView?.image = UIImage(systemName: "square.and.arrow.down.fill")
            //saveButton.setImage(UIImage(named: "square.and.arrow.down.fill"), for: .normal)
        } else {
            saveButton.imageView?.image = UIImage(systemName: "square.and.arrow.down")
            //saveButton.setImage(UIImage(named: "square.and.arrow.down"), for: .normal)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        saveClickAction?(self.news)
    }
}
