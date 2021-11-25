//
//  FeedModel.swift
//Feeds

import UIKit

struct FeedsServiceResponse : Decodable {
    var title : String?
    var rows : [RowListData]?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case rows = "rows"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        rows = try values.decodeIfPresent([RowListData].self, forKey: .rows)
    }
}

struct RowListData : Decodable
{
    let title : String?
    let description : String?
    let imageHref : String?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case description = "description"
        case imageHref = "imageHref"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        imageHref = try values.decodeIfPresent(String.self, forKey: .imageHref)
    }
}
