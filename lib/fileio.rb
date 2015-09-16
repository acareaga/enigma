class FileIO

  attr_reader :input_file, :output_file, :text

  def initialize(input_file)
    @input_file = input_file
    @text = File.open(input_file).read.chomp.gsub("\n\n", " ")
    Encrypt.new(text)
  end

  def package_output_file
    output_file = File.open("encrypted.txt", 'w')
    # output_file.write(encrypt_text)
    date = Date.today.strftime("%d%m%y")
    puts "Created '#{output_file}' with the key .... and date #{date}"
  end

end

# if im_running_code
#   input_file = ARGV[0]
#   output_file = ARGV[1]
# end
#
# im_running_code = ($PROGRAM_NAME == __FILE__)
