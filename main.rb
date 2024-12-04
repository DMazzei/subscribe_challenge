# frozen_string_literal: true

require_relative 'lib/item'
require_relative 'lib/receipt'

DEFAULT_INPUT_FILE = 'resources/input_01.txt'

def parse_input_file(file_path)
  receipt = Receipt.new

  File.readlines(file_path).each do |line|
    match = line.match(/^(\d+)\s(.+?)\sat\s([\d.]+)$/)
    quantity = match[1].to_i
    name = match[2].downcase
    price = match[3].to_f

    item = Item.new(quantity, name, price)
    receipt.add_item(item)
  end

  receipt
end

if ARGV.empty?
  file_path = DEFAULT_INPUT_FILE

  puts('Usage: ruby main.rb <input_file>')
  puts("Using example data as no input file was informed: #{file_path}")
else
  file_path = ARGV[0]

  unless File.exist?(file_path)
    puts "File not found: #{file_path}"
    exit
  end
end

receipt = parse_input_file(file_path)
puts("\nReceipt:")
puts(receipt.generate_receipt)
