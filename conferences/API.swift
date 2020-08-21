// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ConferencesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query conferences {
      conferences {
        __typename
        ...ConferenceFragment
      }
    }
    """

  public let operationName: String = "conferences"

  public var queryDocument: String { return operationDefinition.appending(ConferenceFragment.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("conferences", type: .nonNull(.list(.nonNull(.object(Conference.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(conferences: [Conference]) {
      self.init(unsafeResultMap: ["__typename": "Query", "conferences": conferences.map { (value: Conference) -> ResultMap in value.resultMap }])
    }

    public var conferences: [Conference] {
      get {
        return (resultMap["conferences"] as! [ResultMap]).map { (value: ResultMap) -> Conference in Conference(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Conference) -> ResultMap in value.resultMap }, forKey: "conferences")
      }
    }

    public struct Conference: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Conference"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ConferenceFragment.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Conference", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var conferenceFragment: ConferenceFragment {
          get {
            return ConferenceFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct ConferenceFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ConferenceFragment on Conference {
      __typename
      id
      name
    }
    """

  public static let possibleTypes: [String] = ["Conference"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String) {
    self.init(unsafeResultMap: ["__typename": "Conference", "id": id, "name": name])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }
}
