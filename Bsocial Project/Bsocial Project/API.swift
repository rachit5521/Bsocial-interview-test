// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class TestpostQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query TestpostQuery {
      Post(id: "61beded87e81fb2da2944914") {
        __typename
        media_url
        media_thumbnail
        challenge {
          __typename
          hashtag
        }
        creator {
          __typename
          avatar
          username
        }
      }
    }
    """

  public let operationName: String = "TestpostQuery"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootQuery"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Post", arguments: ["id": "61beded87e81fb2da2944914"], type: .object(Post.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(post: Post? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQuery", "Post": post.flatMap { (value: Post) -> ResultMap in value.resultMap }])
    }

    /// You can fetch details of any Specific Post using it's unique ID.
    public var post: Post? {
      get {
        return (resultMap["Post"] as? ResultMap).flatMap { Post(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Post")
      }
    }

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Post"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("media_url", type: .scalar(String.self)),
          GraphQLField("media_thumbnail", type: .scalar(String.self)),
          GraphQLField("challenge", type: .object(Challenge.selections)),
          GraphQLField("creator", type: .object(Creator.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(mediaUrl: String? = nil, mediaThumbnail: String? = nil, challenge: Challenge? = nil, creator: Creator? = nil) {
        self.init(unsafeResultMap: ["__typename": "Post", "media_url": mediaUrl, "media_thumbnail": mediaThumbnail, "challenge": challenge.flatMap { (value: Challenge) -> ResultMap in value.resultMap }, "creator": creator.flatMap { (value: Creator) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mediaUrl: String? {
        get {
          return resultMap["media_url"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "media_url")
        }
      }

      public var mediaThumbnail: String? {
        get {
          return resultMap["media_thumbnail"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "media_thumbnail")
        }
      }

      public var challenge: Challenge? {
        get {
          return (resultMap["challenge"] as? ResultMap).flatMap { Challenge(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "challenge")
        }
      }

      public var creator: Creator? {
        get {
          return (resultMap["creator"] as? ResultMap).flatMap { Creator(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "creator")
        }
      }

      public struct Challenge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Challenge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hashtag", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hashtag: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Challenge", "hashtag": hashtag])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var hashtag: String? {
          get {
            return resultMap["hashtag"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "hashtag")
          }
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .scalar(String.self)),
            GraphQLField("username", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(avatar: String? = nil, username: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var avatar: String? {
          get {
            return resultMap["avatar"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatar")
          }
        }

        public var username: String? {
          get {
            return resultMap["username"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }
    }
  }
}
