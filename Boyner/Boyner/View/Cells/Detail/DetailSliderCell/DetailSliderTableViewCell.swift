//
//  DetailSliderTableViewCell.swift
//  Boyner
//
//  Created by Onur Başdaş on 14.10.2023.
//

import UIKit

class DetailSliderTableViewCell: UITableViewCell {
    
    static let identifier = "DetailSliderTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "DetailSliderTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var detailSliderCollectionView: UICollectionView!
    @IBOutlet weak var detailSliderPageControl: UIPageControl!
    
    var currentIndex = 0
    var timer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        detailSliderCollectionView.delegate = dataSourceDelegate
        detailSliderCollectionView.dataSource = dataSourceDelegate
        detailSliderCollectionView.tag = row
        detailSliderCollectionView.reloadData()
    }
    
    func setupUI() {
        detailSliderCollectionView.register(DetailSliderCollectionViewCell.nib(), forCellWithReuseIdentifier: DetailSliderCollectionViewCell.identifier)
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true)
    }
    
    @objc func scrollToNextCell() {
        let itemCount = detailSliderCollectionView.numberOfItems(inSection: 0)
        if itemCount > 0 {
            let nextIndex = (currentIndex + 1) % itemCount
            let nextIndexPath = IndexPath(item: nextIndex, section: 0)
            detailSliderCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            currentIndex = nextIndex
            detailSliderPageControl.currentPage = currentIndex
        } else {
        }
    }
}
