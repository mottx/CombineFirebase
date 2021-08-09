//
//  WriteBatch+Combine.swift
//  CombineFirebase
//
//  Created by Kumar Shivang on 23/02/20.
//  Copyright © 2020 Kumar Shivang. All rights reserved.
//

import Combine
import FirebaseFirestore

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension WriteBatch {
    public func commit() -> AnyPublisher<Void, Error> {
        Future<Void, Error> { [weak self] promise in
            self?.commit { error in
                guard let error = error else {
                    promise(.success(()))
                    return
                }
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
}
