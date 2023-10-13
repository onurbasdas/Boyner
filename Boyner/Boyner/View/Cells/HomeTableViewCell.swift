//
//  HomeTableViewCell.swift
//  Boyner
//
//  Created by Onur Başdaş on 13.10.2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }

    @IBOutlet weak var homeBgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(source: Source) {
        titleLabel.text = source.name
        descLabel.text = source.description
    }
    
}
