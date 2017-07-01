#!/usr/bin/env ruby
# Encoding: UTF-8

module NossidgeLibRuby

  module CoreExtensions

    module Array

      module SortByDistance

        ##
        # Take an array index and return a permutation of the
        # items sorted by distance from that index.
        # If 'index' is not specified, return an Enumerator
        # of the results for all indices, in order.
        #
        # The ':reverse' keyword argument switches the equally close
        # neighbours from lowest index first to highest first.
        # It's an option added mostly for completeness, but it's
        # there if you need it.
        #
        def sort_by_distance_from_index index = nil, reverse: false

          # Return Enumerator of all possible output arrays.
          if index.nil?
            Enumerator.new do |y|
              self.each.with_index do |value, index|
                y << self.sort_by_distance_from_index(index, reverse: reverse)
              end
            end

          # Return an output array for a single index.
          else
            output = [self[index]]
            counter = 0
            loop do
              counter += 1

              # Consider negative indices OOB, not from array tail.
              below_index = index - counter
              below_index = nil if below_index < 0
              below = self[below_index] if below_index

              # This is fine, uses nil as default value if OOB.
              above = self[index + counter]

              # Both the elements with index one higher and one lower
              # are equally close neighbours to the subject element.
              # The default is to output the element with the lowest
              # index first. With ':reverse' set to true, the highest
              # index is appended first.
              if reverse
                output << above if above
                output << below if below
              else
                output << below if below
                output << above if above
              end

              # Break if we're at the last element.
              break if !above and !below
            end

            output
          end
        end

        ##
        # Find all elements that match 'value' and return the
        # sort_by_distance results for all, as an Enumerator.
        #
        def sort_by_distance_from_value value, reverse: false
          Enumerator.new do |y|
            self.each_index.select do |i|
              self[i] == value
            end.each do |index|
              y << self.sort_by_distance_from_index(index, reverse: reverse)
            end
          end
        end

      end
    end
  end
end
