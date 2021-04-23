import Array "mo:base/Array";

actor {
    // A board contains a collection of columns
    // Column ordering is maintained implicitly by array index
    type Board = {
        columns: [Column];
    };

    // A column contains a collection of cards and a variant describing the colum
    type Column = {
        column_type: ColumnType;
        cards: [Card];
    };

    // Column Type: To Do, In Progress, Done
    type ColumnType = Text;

    // A card contains a title and description of the work to be done
    type Card = {
        title: Text;
        description: Text;
    };

    // This should persist across updates in production
    stable var board : Board = { columns = []};

    func createColumn(name: Text) : Column {
        { column_type = name; cards = []; }
    };

    public func createBoard() {
        let todo = "Todo";
        let inprogress = "In Progress";
        let done = "Done";
        board := { columns = [createColumn(todo),
                              createColumn(inprogress),
                              createColumn(done)]};
    };



    // CRUD for a card
    // Create & Delete a board which contains Todo, In Progress, Done
        // Create for Columns

    // public query func getBoard() : async [Card] {
    //     board
    // };

    // public func addToBoard(newCard: Card) {
    //     board := Array.append<Card>(board, [newCard]);
    // };

    // public func greet(name : Text) : async Text {
    //     return "Hello, " # name # "!";
    // };



};
