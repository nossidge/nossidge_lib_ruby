#!/usr/bin/env ruby
# Encoding: UTF-8

################################################################################

require File.dirname(__FILE__) + '/spec_helper.rb'

################################################################################

describe NossidgeLibRuby::CoreExtensions::Array::SortByDistance do

  before(:all) do
    class Array
      include NossidgeLibRuby::CoreExtensions::Array::SortByDistance
    end
  end

  it "#sort_by_distance_from_index()" do
    array = (1..4).to_a * 2
    enum = array.sort_by_distance_from_index
    expect(enum.count).to eq 8
    expect(enum.next).to eq [1, 2, 3, 4, 1, 2, 3, 4]
    expect(enum.next).to eq [2, 1, 3, 4, 1, 2, 3, 4]
    expect(enum.next).to eq [3, 2, 4, 1, 1, 2, 3, 4]
    expect(enum.next).to eq [4, 3, 1, 2, 2, 1, 3, 4]
  end

  it "#sort_by_distance_from_index(reverse: true)" do
    array = (1..4).to_a * 2
    enum = array.sort_by_distance_from_index(reverse: true)
    expect(enum.count).to eq 8
    expect(enum.next).to eq [1, 2, 3, 4, 1, 2, 3, 4]
    expect(enum.next).to eq [2, 3, 1, 4, 1, 2, 3, 4]
    expect(enum.next).to eq [3, 4, 2, 1, 1, 2, 3, 4]
    expect(enum.next).to eq [4, 1, 3, 2, 2, 3, 1, 4]
  end

  it "#sort_by_distance_from_index(index)" do
    array = (1..8).to_a
    result = array.sort_by_distance_from_index(5)
    expect(result).to eq [6, 5, 7, 4, 8, 3, 2, 1]

    array = (1..4).to_a * 2
    array << 5
    result = array.sort_by_distance_from_index(3)
    expect(result).to eq [4, 3, 1, 2, 2, 1, 3, 4, 5]
  end

  it "#sort_by_distance_from_index(index, reverse: true)" do
    array = (1..8).to_a
    result = array.sort_by_distance_from_index(5, reverse: true)
    expect(result).to eq [6, 7, 5, 8, 4, 3, 2, 1]

    array = (1..4).to_a * 2
    array << 5
    result = array.sort_by_distance_from_index(3, reverse: true)
    expect(result).to eq [4, 1, 3, 2, 2, 3, 1, 4, 5]
  end

  it "#sort_by_distance_from_value(value)" do
    array = (1..4).to_a * 2
    array << 5

    enum = array.sort_by_distance_from_value(3)
    expect(enum.count).to eq 2
    expect(enum.next).to eq [3, 2, 4, 1, 1, 2, 3, 4, 5]
    expect(enum.next).to eq [3, 2, 4, 1, 5, 4, 3, 2, 1]

    enum = array.sort_by_distance_from_value(5)
    expect(enum.count).to eq 1
    expect(enum.next).to eq [5, 4, 3, 2, 1, 4, 3, 2, 1]
  end

  it "#sort_by_distance_from_value(value, reverse: true)" do
    array = (1..4).to_a * 2
    array << 5

    enum = array.sort_by_distance_from_value(3, reverse: true)
    expect(enum.count).to eq 2
    expect(enum.next).to eq [3, 4, 2, 1, 1, 2, 3, 4, 5]
    expect(enum.next).to eq [3, 4, 2, 5, 1, 4, 3, 2, 1]

    enum = array.sort_by_distance_from_value(5, reverse: true)
    expect(enum.count).to eq 1
    expect(enum.next).to eq [5, 4, 3, 2, 1, 4, 3, 2, 1]
  end

end

################################################################################
