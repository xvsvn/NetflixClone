//
//  TitleCollecCollectionViewCell.swift
//  NetflixClone
//
//  Created by Xasan Xasanov on 07/05/22.
//

import UIKit
import SDWebImage
class TitleCollecCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageVIew:UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageVIew)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageVIew.frame = contentView.bounds
        
    }
    
    public func  configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
                  return
    }
        posterImageVIew.sd_setImage(with: url,completed: nil)
  }
    
}
