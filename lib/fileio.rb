require 'pry'
require_relative 'key'

class FileIO

  attr_reader :file, :output_file, :encrypted_text

  def initialize(input_file)
    @file = File.open(input_file).read.chomp.gsub("\n\n", " ").downcase
  end

  def package_output_file(text)
    output_file = File.open("encrypted.txt", 'w')
    output_file.write(text)
  end

end
