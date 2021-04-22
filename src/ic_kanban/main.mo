import Array "mo:base/Array";

actor {

    type Card = {
        title: Text;
        description: Text;
    };

    var board: [Card] = [];

    public query func getBoard() : async [Card] {
        board
    };

    public func addToBoard(newCard: Card) {
        board := Array.append<Card>(board, [newCard]);
    };

    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };

};
