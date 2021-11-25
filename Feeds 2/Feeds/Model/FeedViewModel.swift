//
//  FeedViewModel.swift
//  Feeds

import Foundation
protocol FeedViewModelDelegate {
    func didReceiveServiceResponse(response: FeedsServiceResponse?)
}

struct FeedViewModel {
    var delegate : FeedViewModelDelegate?
    func getfeeds() {
        let feedResources = FeedResources()
        feedResources.getFeeds(completion: { (feedsResponse) in
            DispatchQueue.main.async {
                if self.delegate != nil {
                    // Send back data to FeedViewController
                    self.delegate?.didReceiveServiceResponse(response: feedsResponse)
                }
                
            }
        })
        
    }
}
