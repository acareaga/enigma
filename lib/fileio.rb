require 'pry'
require_relative 'key'

class Fileio

  attr_reader :file, :output_file, :encrypted_text

  def initialize(input_file)
    @file = File.open(input_file).read.chomp.gsub("\n\n", " ").downcase
  end

  def package_encrypted_file(text)
    output_file = File.open("encrypted.txt", 'w')
    output_file.write(text)
  end

  def package_decrypted_file(text)
    output_file = File.open("decrypted.txt", 'w')
    output_file.write(text)
  end

  def package_cracked_file(text)
    output_file = File.open("cracked.txt", 'w')
    output_file.write(text)
  end

end
