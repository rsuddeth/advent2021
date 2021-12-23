require 'pry'

class Day4a
  def self.read_input(filename)
    File.readlines(filename).map(&:strip)
  end

  def self.get_call_numbers(input)
    input[0].split(',').map(&:to_i)
  end

  def self.get_cards(input)
    cards = {}
    card_number = 1
    cards[1] = []
    card_row = 0
    input.drop(2).each do |line|
      if line.size > 0
        cards[card_number][card_row] = line.split(' ').map(&:to_i)
        card_row += 1
      else
        card_number += 1
        cards[card_number] = []
        card_row = 0
      end
    end
    cards
  end

  def self.draw_number(call_numbers, index, cards)
    number = call_numbers[index]

    cards.each do |card_num, card|
      card.each do |row|
        next unless i = row.index(number)
        row[i] = -1
        break
      end
    end

    cards
  end

  def self.single_winner(card)
    row_count = card.count
    marked_positions = {}
    for i in 0..row_count-1
      marked_positions[i] = 0
    end

    # check for horizontal Bingo
    card.each do |row|
      if row.all? {|num| num == -1}
        return true
      end

      # check for vertical Bingo
      card.each_index do |row_num|
        card[row_num].each_index do |ind|
          if card[row_num][ind] == -1
            marked_positions[ind] += 1
          end
        end
      end
      marked_positions.any? {|position, quantity| quantity == row_count}
    end
  end

  def self.winner(cards)
    cards.each do |card_num, card|
      row_count = card.count
      marked_positions = {}
      for i in 0..row_count-1
        marked_positions[i] = 0
      end

      # check for horizontal Bingo
      card.each do |row|
        if row.all? {|num| num == -1}
          return card_num
        end
      end

      # check for vertical Bingo
      card.each_index do |row_num|
        card[row_num].each_index do |ind|
          if card[row_num][ind] == -1
            marked_positions[ind] += 1
          end
        end
      end
      if marked_positions.any? {|position, quantity| quantity == row_count}
        return card_num
      end
    end
    nil
  end

  def self.sum_unmarked(card)
    sum = 0
    card.each do |row|
      row.each do |num|
        unless num == -1
          sum += num
        end
      end
    end
    sum
  end

  def self.calculate_score(card, last_num)
    sum = sum_unmarked(card)
    sum * last_num
  end

  def self.draw_until_win(cards, call_numbers, call_index = 0)
    until card_num = winner(cards) do
      cards = draw_number(call_numbers, call_index, cards)
      call_index += 1
    end

    [cards, card_num, call_index - 1]
  end

  def self.draw_until_last_win(cards, call_numbers)
    call_index = 0

    until cards.size == 1 do
      cards = draw_number(call_numbers, call_index, cards)
      call_index += 1
      if card_num = winner(cards)
        cards.delete(card_num)
      end
    end
    cards, card_num, call_index = draw_until_win(cards, call_numbers, call_index)
  end

  def self.get_advent_answer(file)
    input = read_input(file)
    cards = get_cards(input)
    call_numbers = get_call_numbers(input)
    cards, card_num, call_num_index = draw_until_win(cards, call_numbers)
    calculate_score(cards[card_num], call_numbers[call_num_index])
  end

  def self.get_answer_part_2(file)
    input = read_input(file)
    cards = get_cards(input)
    call_numbers = get_call_numbers(input)
    completed_cards, card_num, call_num_index = draw_until_last_win(cards, call_numbers)
    calculate_score(completed_cards[card_num], call_numbers[call_num_index])
  end

end

#puts Day4a.get_answer_part_2('../data/JoDay4.txt')
