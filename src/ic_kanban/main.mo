import Array "mo:base/Array";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";

import DB "mo:crud/Database";

import Types "./Types";

actor {

    type Id = Types.Id;
    type Card = Types.Card;
    type Column = Types.Column;

    let dbCards = DB.Database<Id, Card>(Types.getNextId, Nat.equal, #hash(Hash.hash));
    let dbColumns = DB.Database<Id, Column>(Types.getNextId, Nat.equal, #hash(Hash.hash));

    public func addColumn(title: Text) : async Id {
        dbColumns.create({ title; })
    };

    public func readColumn(columnId: Id) : async DB.Res<Column> {
        dbColumns.read(columnId)
    };

    public func updateColumn(columnId: Id, column: Column) : async DB.Res<()> {
        dbColumns.update(columnId, column)
    };

    func deleteColumn(id: Id) : DB.Res<()> {
        dbCards.delete(id)
    };

    public func addCard(title: Text, description: Text, columnId: Id) : async DB.Res<Id> {
        // Ensure column already exists
        switch (dbColumns.read(columnId)) {
            case (#ok(_)) #ok(dbCards.create({ title; description; columnId }));
            case (#err(e)) #err(e);
        }
    };

    public func readCard(cardId: Id) : async DB.Res<Card> {
        dbCards.read(cardId)
    };

    public func updateCard(cardId: Id, card: Card) : async DB.Res<()> {
        dbCards.update(cardId, card)
    };

    func deleteCard(id: Id) : DB.Res<()> {
        dbCards.delete(id)
    };

};
