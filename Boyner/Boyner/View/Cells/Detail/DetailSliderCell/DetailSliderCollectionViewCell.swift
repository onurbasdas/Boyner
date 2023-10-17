//
//  DetailSliderCollectionViewCell.swift
//  Boyner
//
//  Created by Onur Başdaş on 14.10.2023.
//

import UIKit
import Kingfisher

class DetailSliderCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DetailSliderCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "DetailSliderCollectionViewCell", bundle: nil)
    }

    @IBOutlet weak var detailSliderImageView: UIImageView!
    @IBOutlet weak var detailSliderTitleLabel: UILabel!
    @IBOutlet weak var detailSliderPubDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(data: DetailArticles) {
        let url = URL(string: data.urlToImage ?? "")
        detailSliderImageView.kf.setImage(with: url)
        detailSliderTitleLabel.text = data.title
        let dateString = data.publishedAt ?? ""
        Utils.shared.getDate(label: detailSliderPubDateLabel, dateStr: dateString)
    }

}
