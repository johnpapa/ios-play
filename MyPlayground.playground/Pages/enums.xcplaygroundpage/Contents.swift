import UIKit

print("Switch/Case without enums")
var i = 0

switch i {
case 0:
  print("i is \(i)")
case 23:
  print("it is 23")
case 1..<10:
  print("it is 1 through 10")
case 11, 12:
  print("it is 12 or 11")
default:
  print("Who knows what it is")
}


print("Switch/Case without enums")

enum PrimaryColors {
  case Red, Blue, Yellow
}
var pm1 = PrimaryColors.Blue
var pm2:PrimaryColors = .Blue
var pm3 = PrimaryColors.Blue

switch pm1 {
case .Blue:
  print("Blue")
case .Red:
  print("Red")
case .Yellow:
  print("Yellow")
}

enum Direction: Int {
  case North = 0
  case South = 1
  case East = 2
  case West = 3
}

var direction: Direction = .East

switch direction {
case .East:
  print("East!")
case .South, .North:
  break;
case .West:
  break
}

enum CardSuits: String {
  case Spades = "♠️"
  case Diamonds = "♦️"
  case Hearts = "♥️"
  case Clubs = "♣️"
  static let allValues = [Spades, Diamonds, Hearts, Clubs]
}
print(CardSuits.Spades.rawValue)

enum CardRanks: Int {
  case Ace = 1
  case Two = 2
  case Three = 3
  case Four = 4
  case Five = 5
  case Six = 6
  case Seven = 7
  case Eight = 8
  case Nine = 9
  case Ten = 10
  case Jack = 11
  case Queen = 12
  case King = 13

  static let allValues = [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
  
  static func allRanks() -> [CardRanks] {
    return [.Ace, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten, .Jack, .Queen, .King]
  }
  
  static func faceCards() -> [CardRanks] {
    return [.Jack, .Queen, .King]
  }
}

print(CardRanks.allValues)
print(CardRanks.allRanks())
print(CardRanks.Ace)
print(CardRanks.Ace.rawValue)


class Card {
  var suit: CardSuits?
  var rank: CardRanks?
  
  init(suit: CardSuits, rank: CardRanks) {
    self.suit = suit
    self.rank = rank
  }
}

var cards: [Card] = [];

cards.append(Card(suit: CardSuits.Spades, rank: CardRanks.Ace))
cards.append(Card(suit: CardSuits.Spades, rank: CardRanks.King))
cards.append(Card(suit: CardSuits.Spades, rank: CardRanks.Queen))
cards.append(Card(suit: CardSuits.Spades, rank: CardRanks.Jack))
cards.append(Card(suit: CardSuits.Spades, rank: CardRanks.Ten))

cards.appendContentsOf(
  [
    Card(suit: .Hearts, rank: .Ace),
    Card(suit: .Diamonds, rank: .Ace)
  ]);

print(cards[0].rank)

func generateDeck() -> Array<Card> {
  var cards: [Card] = []
  for r in CardRanks.allValues {
    for s in CardSuits.allValues {
      cards.append(Card(suit: s, rank: r))
    }
  }
  return cards
}

generateDeck().forEach({print("\($0.rank) of \($0.suit)")})


func generatePinochleDeck() -> Array<Card> {
  var cards: [Card] = []
  CardRanks
    .allValues
    .filter({ suit in
      suit.rawValue >= 9 || suit.rawValue == 1
    })
    .forEach({ rank in
      for s in CardSuits.allValues {
        cards.append(Card(suit: s, rank: rank))
        cards.append(Card(suit: s, rank: rank))
      }
    })
  return cards
}

generatePinochleDeck().forEach({print("\($0.rank) of \($0.suit)")})
generatePinochleDeck().count

enum Delay {
  case Interval(NSTimeInterval)
  case Date(NSDate)
}

enum ServerResult {
  case NetworkError(NSError)
  case ServerError(NSHTTPURLResponse)
  case Success([String])
}

let result = ServerResult.Success(["Woo hoo!"])

func handleResult(result: ServerResult) {
  switch result {
  case .NetworkError, .ServerError:
    print("Error!")
  case .Success(let strings):
    print("Here we go: \(strings.description))")
  }
}

handleResult(.Success(["One"]))
handleResult(.NetworkError(NSError(domain: "My error domain", code: 0, userInfo: nil)))

enum RideStatus {
  case Operational, OutOfControl, Unknown
  case Offline(Int)

  func getRideStatus() {
    switch self {
    case .Operational, .OutOfControl, .Unknown:
      print("Ride status is \(self)")
    case .Offline(let minutes):
      print("Ride status is \(self) and will be up in \(minutes) minutes")
    }
  }
}

var teacupsStatus = RideStatus.Offline(77)
teacupsStatus.getRideStatus()










