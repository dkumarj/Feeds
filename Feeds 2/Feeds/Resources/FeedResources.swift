//
//  FeedResources.swift
//  Feeds


import Foundation
struct FeedResources {
    
    // MARK: - Get feeds
    
    func getFeeds(completion : @escaping (_ result: FeedsServiceResponse?) -> Void) {
        guard let feedUrl = URL(string: ServiceEndPoints.feeds) else {
            return
        }
        
        // Creating HttpUtility Instance
        
        let httpUtility = HttpUtility()
        do {
            //Calling HttpUtility instance method to get feeds
            
            httpUtility.getApiData(requestUrl: feedUrl, resultType: FeedsServiceResponse.self) { (feedApiResponse) in
                _ = completion(feedApiResponse)
            }
            
        }
    }
}
