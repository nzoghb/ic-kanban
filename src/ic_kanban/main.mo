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

    public query func getBoard() : async Board {
        board
    };

    public func createBoard() {
        let todo = "Todo";
        let inprogress = "In Progress";
        let done = "Done";
        board := {
            columns = [
                createColumn(todo),
                createColumn(inprogress),
                createColumn(done)
            ]
        };
    };

    public func addColumnToBoard(name: Text) {
        let oldColumns = board.columns;
        let newColumns = Array.append<Column>(oldColumns, [createColumn(name)]);
        board := { columns = newColumns };
    };

    public func addCardToColumn(columnName: ColumnType, cardName: Text, cardDescription: Text) {
        
    };

    func createColumn(name: Text) : Column {
        { column_type = name; cards = []; }
    };

    func deleteCard(column: Column, titleToDelete: Text) : Column {
        let oldCards = column.cards;

        let filterFn = func (c: Card) : Bool { c.title != titleToDelete };
        let newCards = Array.filter<Card>(
            oldCards,
            filterFn
        );

        {
            column_type = column.column_type;
            cards = newCards;
        }
    };

    func deleteColumn(columnTypeToDelete: ColumnType) : Board {
        let oldColumns = board.columns;

        let filterFn = func (c: Column) : Bool { c.column_type != columnTypeToDelete };
        let newColumns = Array.filter<Column>(
            oldColumns,
            filterFn
        );

        {
            columns = newColumns;
        }
    };

    // CRUD for a card
    // Create & Delete a board which contains Todo, In Progress, Done
        // Create for Columns
    // public func 



};
