//
//  CollectionViewTableViewCell.swift
//  NetflixClone
//
//  Created by Xasan Xasanov on 30/04/22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {


    static let identifier = "CollectionViewTableViewCell"
    
    private var titles: [Title] = [Title]()
    
    private let collectionView: UICollectionView = {
        
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 140, height: 200)
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollecCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollecCollectionViewCell.identifier)
            return collectionView
        }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    required init(coder:NSCoder) {
        fatalError()
    
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with titles:[Title]) {
        self.titles = titles
        DispatchQueue.main.async {
            [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource  {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollecCollectionViewCell.identifier, for: indexPath) as? TitleCollecCollectionViewCell else {
            return UICollectionViewCell()
        }
            
        guard let model = titles[indexPath.row].poster_path else {
                 return UICollectionViewCell()
             }
        
        cell.configure(with: model)
             
             return cell
         }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
     
 }
