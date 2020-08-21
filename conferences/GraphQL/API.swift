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

  public var queryDocument: String { return operationDefinition.appending(ConferenceFragment.fragmentDefinition).appending(OrganizerFragment.fragmentDefinition) }

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

public struct OrganizerFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment OrganizerFragment on Contact {
      __typename
      name
      about
      company
      image {
        __typename
        url
      }
    }
    """

  public static let possibleTypes: [String] = ["Contact"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("about", type: .nonNull(.scalar(String.self))),
    GraphQLField("company", type: .scalar(String.self)),
    GraphQLField("image", type: .nonNull(.object(Image.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(name: String, about: String, company: String? = nil, image: Image) {
    self.init(unsafeResultMap: ["__typename": "Contact", "name": name, "about": about, "company": company, "image": image.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
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

  public var about: String {
    get {
      return resultMap["about"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "about")
    }
  }

  public var company: String? {
    get {
      return resultMap["company"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "company")
    }
  }

  public var image: Image {
    get {
      return Image(unsafeResultMap: resultMap["image"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "image")
    }
  }

  public struct Image: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Image"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("url", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(url: String) {
      self.init(unsafeResultMap: ["__typename": "Image", "url": url])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var url: String {
      get {
        return resultMap["url"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "url")
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
      organizer {
        __typename
        ...OrganizerFragment
      }
    }
    """

  public static let possibleTypes: [String] = ["Conference"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("organizer", type: .nonNull(.object(Organizer.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, organizer: Organizer) {
    self.init(unsafeResultMap: ["__typename": "Conference", "id": id, "name": name, "organizer": organizer.resultMap])
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

  public var organizer: Organizer {
    get {
      return Organizer(unsafeResultMap: resultMap["organizer"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "organizer")
    }
  }

  public struct Organizer: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Contact"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(OrganizerFragment.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
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

      public var organizerFragment: OrganizerFragment {
        get {
          return OrganizerFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}
