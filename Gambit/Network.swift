//
//  Network.swift
//  Gambit
//
//  Created by Руслан Алиев on 11.03.2022.
//
import Alamofire
import Foundation

class Network {
    func fetchEvents(ifSuccess: @escaping ([Gambit]) -> Void, ifFailure: @escaping () -> Void) {

                AF
                .request("https://api.gambit-app.ru/category/39?page=1", method: .get)
                .validate()
                .responseData { (response) in
                    switch response.result {
                    case .success(_):
                    if let data = try? response.result.get() {
                    let result = try! JSONDecoder().decode([Gambit].self, from: data)
                         ifSuccess(result)
                    }
                    case .failure(_): ifFailure()

}
}
}
}

