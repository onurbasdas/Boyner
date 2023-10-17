//
//  DetailViewController.swift
//  Boyner
//
//  Created by Onur Başdaş on 13.10.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    let detailViewModel = DetailViewModel()
    var sourceID: String?
    var sourceName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
    }
    
    func setupUI() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(DetailTableViewCell.nib(), forCellReuseIdentifier: DetailTableViewCell.identifier)
        detailTableView.register(DetailSliderTableViewCell.nib(), forCellReuseIdentifier: DetailSliderTableViewCell.identifier)
        navigationItem.title = sourceName ?? ""
    }
    
    func getData() {
        detailViewModel.getHeadlineData(sourceHeadlineId: sourceID ?? "") {
            DispatchQueue.main.async { [self] in
                detailTableView.reloadData()
            }
        }
    }
}

extension DetailViewController: DetailTableViewCellDelegate {
    func didSelectReadBtn(cell: DetailTableViewCell) {
        if let indexPath = detailTableView.indexPath(for: cell) {
//            var article = detailViewModel.articles[indexPath.row]
//            article.isSelected = !article.isSelected
//            detailTableView.reloadData()
//            Utils.shared.addOrRemove(withTitle: article.title ?? "")
            //MARK: Vaktim olmadığı için yetişmedi. Ama genel olarak hepsini taşıdım.
            print(indexPath.row)
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return detailViewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let slideCell = detailTableView.dequeueReusableCell(withIdentifier: DetailSliderTableViewCell.identifier, for: indexPath) as! DetailSliderTableViewCell
            slideCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            return slideCell
        } else {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
            cell.delegate = self
            cell.bind(data: detailViewModel.articles[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailViewModel.slideArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailSliderCollectionViewCell.identifier, for: indexPath) as! DetailSliderCollectionViewCell
        cell.bind(data: detailViewModel.slideArticles[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        return CGSize(width: collectionViewWidth, height: 300)
    }
}
