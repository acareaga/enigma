class FileIO

  attr_reader :file, :output_file

  def initialize(input_file)
    @file = File.open(input_file).read.chomp.gsub("\n\n", " ").downcase
  end

  def package_output_file
    output_file = File.open("encrypted.txt", 'w')
    # output_file.write(encrypt_text)
    date = Date.today.strftime("%d%m%y")
    puts "Created '#{output_file}' with the key .... and date #{date}"
  end

end
