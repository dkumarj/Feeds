//
//  FeedTableViewCell.swift
//  Feeds
//

import UIKit
import SDWebImage

class FeedTableViewCell : UITableViewCell {
    
    // Setting feed labels and images for cell
    
    var feedsRow : RowListData? {
        didSet {
            if let url = URL(string:feedsRow?.imageHref ?? "") {
                feedImage.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: .continueInBackground, context: nil)
            }
            if let title = feedsRow?.title {
                titleLabel.text = title
            }
            if let description = feedsRow?.description {
                titleDescriptionLabel.text = description
            }
        }
    }
    
    // MARK: - Title Label
    
    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // MARK: - TitleDescriptionLabel
    
    private let titleDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // MARK: - feedImage
    
    private let feedImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(titleDescriptionLabel)
        addSubview(feedImage)
        
        feedImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 70, enableInsets: false)
        titleLabel.anchor(top: topAnchor, left: feedImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
        
        titleDescriptionLabel.anchor(top: feedImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
