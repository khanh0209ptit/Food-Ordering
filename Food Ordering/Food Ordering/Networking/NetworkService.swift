//
//  NetworkService.swift
//  Food Ordering
//
//  Created by Quang Khánh on 10/01/2023.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    //dat init o private de k the tao 1 phien ban cua chuc nang nay ben ngoai noi khac
    private init() {}
    
    //tim nap cac đơn đặt hàng
    func fetchOrders(completion: @escaping(Result<[Order], Error>) -> Void) {
        request(route: .fetchOrders, method: .get, completion: completion)
    }
    
    //get data list item in tung loai category
    func fetchCategoryDishes(categoryId: String, completion: @escaping(Result<[Dish], Error>) -> Void) {
        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
    }
    
    //name: ten nguoi order
    //dat hang
    func placeOrder(dishId: String, name: String, completion: @escaping(Result<Order, Error>) -> Void) {
        let params = ["name": name]
        request(route: .placeOrder(dishId), method: .post, parameters: params, completion: completion)
    }

    //get data food Category, Popolar dish, Chefs Special
    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>) -> Void) {
        request(route: .fetchAllCategories, method: .get, completion: completion)
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?, completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
            }
            
            //check co data hay k
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    //T.Type: metadata type in Swift, cho phép truy cập vào 1 kiểu biến hoặc hằng số
    //completion: (Result<T, Error>): la mot closure
    //Result<T, Error>: trả ket quả thanh cong hay thất bại (T thanh cong, Err: that bai)
    //make request to the backend
    private func request<T: Decodable>(route: Route,
                                     method: Method,
                                     parameters: [String: Any]? = nil,
                                     completion: @escaping(Result<T, Error>) -> Void ) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        //URLSession - gui yeu cau mang va nhan ket qua sever
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                print("The response is: \(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("The error is: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                //TODO decode our results and send back to the user
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    /// This function helps us to generate a urlRequest
        /// - Parameters:
        ///   - route: the path the the resource in the backend
        ///   - method: type of request to be made
        ///   - parameters: whatever extra information you need to pass to the backend
        /// - Returns: URLRequest
    private func createRequest(route: Route,
                      method: Method,
                      parameters: [String: Any]? = nil) -> URLRequest? {
        //create url
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asURL else {
            return nil
        }
        //create request từ url
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //method la kieu du lieu enum
        urlRequest.httpMethod = method.rawValue
        
        //neu co tham so truyen vao
        if let params = parameters {
            switch method {
            case .get:
                //URLComponents: thanh phân url
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {
                    // $0 là giá trị của phần tử đang xét, tương ứng với giá trị của key trong params, và $1 là giá trị tương ứng với giá trị của key.
                    URLQueryItem(name: $0, value: "\($1)")
                }
                //sau khi cac item duoc query thi chúng được gán vào thuộc tính queryItems của urlComponent
                //urlComponent chứa các item query va sử dụng cập nhật lại URL của URLRequest
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                //chuyển tham số vào dạng dữ liệu JSON và gán nó vào httpBody của URLRequest
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
