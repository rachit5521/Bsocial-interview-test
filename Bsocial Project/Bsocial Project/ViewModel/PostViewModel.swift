//
//  PostViewModel.swift
//  Bsocial Project
//
//  Created by Rachit Prajapati on 20/01/22.
//

import Foundation
import Apollo

final class PostViewModel: ObservableObject {
    
    func fetch(_ completion: @escaping(PostResponse?) -> Void) {
        Network.shared.apollo.fetch(query: TestpostQueryQuery()) { result in
            switch result {
            case .success(let graphQlResult):
                let postResponse = PostResponse(
                    username: graphQlResult.data?.post?.creator?.username,
                    profilePictureURLString: graphQlResult.data?.post?.creator?.avatar,
                    hashtagChallenge: graphQlResult.data?.post?.challenge?.hashtag,
                    mediaImageURL: graphQlResult.data?.post?.mediaUrl
                )
                completion(postResponse)
            case .failure(_):
                completion(nil)
            }
        }
    }
    
}

