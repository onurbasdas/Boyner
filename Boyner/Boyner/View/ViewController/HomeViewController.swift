//
//  HomeViewController.swift
//  Boyner
//
//  Created by Onur Başdaş on 13.10.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    let homeViewModel = HomeViewModel()
    var selectedSourceID: String?
    var selectedSourceName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
    }
    
    func getData() {
        homeViewModel.getData { 
            DispatchQueue.main.async { [self] in
                homeTableView.reloadData()
                homeCollectionView.reloadData()
            }
        }
    }
    
    func setupUI() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeTableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
        homeCollectionView.register(SegmentCollectionViewCell.nib(), forCellWithReuseIdentifier: SegmentCollectionViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.bind(source: homeViewModel.sources[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSourceID = homeViewModel.sources[indexPath.row].id
        selectedSourceName = homeViewModel.sources[indexPath.row].name
        self.performSegue(withIdentifier: "goToDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailSegue" {
            if let destinationViewController = segue.destination as? DetailViewController {
                destinationViewController.sourceID = selectedSourceID
                destinationViewController.sourceName = selectedSourceName
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let segmentInfo = homeViewModel.getSegmentInfo()
        return segmentInfo.segmentTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "SegmentCollectionViewCell", for: indexPath) as! SegmentCollectionViewCell
        let segmentInfo = homeViewModel.getSegmentInfo()
        let segmentTitle = segmentInfo.segmentTitles[indexPath.row]
        cell.segmentTitleLabel.text = segmentTitle
        return cell
    }
}
