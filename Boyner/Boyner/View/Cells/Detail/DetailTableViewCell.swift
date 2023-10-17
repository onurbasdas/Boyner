//
//  DetailTableViewCell.swift
//  Boyner
//
//  Created by Onur Başdaş on 14.10.2023.
//

import UIKit
import Kingfisher

protocol DetailTableViewCellDelegate: AnyObject {
    func didSelectReadBtn(cell: DetailTableViewCell)
}

class DetailTableViewCell: UITableViewCell {
    
    static let identifier = "DetailTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "DetailTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailReadBtn: UIButton!
    @IBOutlet weak var detailPubDate: UILabel!
    
    var isInReadList: Bool = false
    //    var articleID: String = ""
    weak var delegate: DetailTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(data: DetailArticles) {
        let url = URL(string: data.urlToImage ?? "")
        detailImage.kf.setImage(with: url)
        detailTitle.text = data.title
        let dateString = data.publishedAt ?? ""
        Utils.shared.getDate(label: detailPubDate, dateStr: dateString)
        configureButton(isSelected: data.isSelected)
    }
    
    @IBAction func detailReadBtnPressed(_ sender: UIButton) {
        delegate?.didSelectReadBtn(cell: self)
    }
    
    func configureButton(isSelected: Bool) {
        if isSelected{
            detailReadBtn.setTitle("Okuma Listesine Çıkar", for: .normal)
        } else {
            detailReadBtn.setTitle("Okuma Listesinden Ekle", for: .normal)
        }
    }
}
