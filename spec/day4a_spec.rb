require 'rspec'
require_relative '../lib/day4a'

describe 'Day4a' do

  context 'load input data' do
    raw_input = Day4a.read_input('data/day4example.txt')
    call_numbers = Day4a.get_call_numbers(raw_input)
    cards = Day4a.get_cards(raw_input)

    it 'should have 27 call_numbers' do
      expect(call_numbers.count).to eq(27)
    end

    it 'a call_number should be an int' do
      expect(call_numbers[0].class).to eq(Integer)
    end

    it 'should have 3 cards' do
      expect(cards.size).to eq(3)
    end

    it 'a card should have 5 arrays of 5 values' do
      expect(cards[1].size).to eq(5)
      expect(cards[1][0].size).to eq(5)
    end
  end

  context 'play bingo' do
    raw_input = Day4a.read_input('data/day4example.txt')
    call_numbers = Day4a.get_call_numbers(raw_input)
    cards = Day4a.get_cards(raw_input)

    it 'after call_numbers[0] is called, each card should have one space marked' do
      marked_cards = Day4a.draw_number(call_numbers, 0, cards)
      is_card_marked = {}
      marked_cards.each do |card_num, card|
        is_card_marked[card_num] = 0
        card.each do |row|
          row.each do |num|
            if num == -1
              is_card_marked[card_num] = 1
            end
          end
        end
      end

      is_card_marked.each do |card_num, value|
        expect(value).to eq(1)
      end
    end

    context 'play full game' do
      marked_cards, card_num, call_index = Day4a.draw_until_win(cards, call_numbers)

      it 'winner should be 3rd card' do
        expect(card_num).to eq(3)
      end

      it 'last called number should be 24' do
        expect(call_numbers[call_index]).to eq(24)
      end

      it 'sum unmarked numbers on winning card = 188' do
        expect(Day4a.sum_unmarked(marked_cards[card_num])).to eq(188)
      end

      it 'final score = 4512' do
        expect(Day4a.calculate_score(marked_cards[card_num], call_numbers[call_index])).to eq(4512)
      end
    end
  end

  context 'part 2' do
    raw_input = Day4a.read_input('data/day4example.txt')
    call_numbers = Day4a.get_call_numbers(raw_input)
    cards = Day4a.get_cards(raw_input)

    completed_cards, winning_card_num, last_call_index = Day4a.draw_until_last_win(cards, call_numbers)

    it 'the last board to win is 2' do
      expect(winning_card_num).to eq(2)
    end

    it 'the last number called is 13' do
      expect(call_numbers[last_call_index]).to eq(13)
    end

    it 'the score of board 2 is 1924' do
      expect(Day4a.calculate_score(completed_cards[winning_card_num], call_numbers[last_call_index])).to eq(1924)
    end
  end

  it 'test complete part 2 flow' do
    expect(Day4a.get_answer_part_2('data/day4example.txt')).to eq(1924)
  end

end
