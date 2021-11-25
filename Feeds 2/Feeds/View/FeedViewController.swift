//
//  FeedViewController.swift
//  Feeds

import UIKit
class FeedViewController: UITableViewController {
    
    // MARK: - Properties
    
    var feeds : FeedsServiceResponse?
    private var feedViewModel = FeedViewModel()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Code to refresh table view
        if #available(iOS 10.0, *) {
            let refreshControl = UIRefreshControl()
            let title = NSLocalizedString("PullToRefresh", comment: pullToRefresh)
            refreshControl.attributedTitle = NSAttributedString(string: title)
            refreshControl.addTarget(self,
                                     action: #selector(refreshOptions(sender:)),
                                     for: .valueChanged)
            tableView.addSubview(refreshControl)
        }
        // Setting model delgate
        feedViewModel.delegate = self
        
        //Register feed table cell
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: feedCellIdentifier)
        
        // Get feed data from service
        feedViewModel.getfeeds()
    }
    
    // MARK: - Refresh Table Data
    
    @objc private func refreshOptions(sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }
    
}

extension FeedViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: feedCellIdentifier, for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        let currentFeed = feeds?.rows?[indexPath.row]
        cell.feedsRow = currentFeed
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds?.rows?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension FeedViewController: FeedViewModelDelegate {
    
    // MARK: - Receive Service Response And Reload Feed Table
    
    func didReceiveServiceResponse(response: FeedsServiceResponse?) {
        guard let response = response else {
            return
        }
        self.feeds = response
        self.title = feeds?.title ?? ""
        if response.rows?.count != 0 {
            self.tableView.reloadData()
        }
    }
}

