defmodule Cards do

    @moduledoc """
        Provides methods for creating and handling a deck of cards
    """

    @doc """
        Returns a list of strings representing a deck of playing cards
    """
    def createDeck do
        values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
        suits = ["Spades", "Clubs", "Hearts", "Diamonds"];

        cards = for value <- values, suit <- suits do
                "#{value} of #{suit}"
        end

        List.flatten(cards)
    end

    #ENUM METHODS
    def shuffle(deck) do
        Enum.shuffle(deck);
    end

    #use ? at the end of method name for returning boolean (as a convention)
    def contains?(deck,card) do
        Enum.member?(deck,card)
    end

    @doc """
        Divides a deck into a hand and the remainder of the deck
        'size' argument is how many cards should be in hand

    ## Examples

        iex> deck = Cards.createDeck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]
    """
    def deal(deck,size) do
        Enum.split(deck,size)
    end

    #FILE IO
    def save(deck, fileName) do
        binary = :erlang.term_to_binary(deck)
        File.write(fileName,binary)
    end

    def load(fileName) do

        case File.read(fileName) do
            #pattern matching: first item must be same to match second item to return value
            {:ok, binary} -> :erlang.binary_to_term(binary)
            #_ means tells elixir that there will be an element reason, but we don't want it
            {:error, _reason} -> "#{fileName} doesn't exist"
        end
    end

    def create_hand(hand_size) do

        #Pipe operator
        Cards.createDeck
        |> Cards.shuffle
        #Automatically inserts the return value from the previous function as the first argument of the next function
        |> Cards.deal(hand_size)
    end

end
