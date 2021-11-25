//
//  HttpUtility.swift
//  Feeds

import Foundation
struct HttpUtility {
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void) {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            guard let data = responseData else { return }
                        do {
                            let utf8Data = String(decoding: data, as: UTF8.self).data(using: .utf8)

                            let object = try JSONDecoder().decode(T.self, from: utf8Data ?? Data())
                            completionHandler(object)
                        } catch {
                            print(error.localizedDescription)
                        }

        }.resume()
    }
}
