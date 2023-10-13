//
//  SegmentCollectionViewCell.swift
//  Boyner
//
//  Created by Onur Başdaş on 13.10.2023.
//

import UIKit

class SegmentCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SegmentCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SegmentCollectionViewCell", bundle: nil)
    }

    @IBOutlet weak var segmentBgView: UIView!
    @IBOutlet weak var segmentTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        segmentBgView.layer.borderColor = UIColor.black.cgColor
        segmentBgView.layer.borderWidth = 1
    }

}
