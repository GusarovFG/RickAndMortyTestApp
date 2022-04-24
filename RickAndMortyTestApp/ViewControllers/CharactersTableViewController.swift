//
//  CharactersTableViewController.swift
//  RickAndMortyTestApp
//
//  Created by Фаддей Гусаров on 24.04.2022.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    
    private var characters: RickAndMorty?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaviBar()
        fetchData(from: URLS.rickAndMortyapi.rawValue)
        
        self.tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "charCell")
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.share.fetchData(url: url) { data in
            self.characters = data
            self.tableView.reloadData()
        }
    }
    
    private func setupNaviBar() {
        self.title = "Rick and Morty"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let prevBarButton = UIBarButtonItem(title: "Prev", style: .done, target: self, action: #selector(fetchPrevData))
        let nextBarButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(fetchNextPrevData))
        
        self.navigationItem.leftBarButtonItem = prevBarButton
        self.navigationItem.rightBarButtonItem = nextBarButton
    }
    
    @objc func fetchPrevData() {
        NetworkManager.share.fetchData(url: self.characters?.info.prev) { data in
            self.characters = data
            self.tableView.reloadData()
        }
    }
    
    @objc func fetchNextPrevData() {
        NetworkManager.share.fetchData(url: self.characters?.info.next) { data in
            self.characters = data
            self.tableView.reloadData()
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.characters?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charCell", for: indexPath) as! CharacterTableViewCell
        cell.setupCell(character: self.characters?.results[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.character = self.characters?.results[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
