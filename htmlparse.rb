require 'open-uri'
require 'Nokogiri'


@result = []
@error = []

def webcrawl(link)
  i = 0
  doc = Nokogiri::HTML(open(link))
  doc.xpath("//a").each do |item|
    begin
      Nokogiri::HTML(open(item.values[0])) do |res|
        next if @result.include?(item.values[0])
        @result << item.values[0]
        webcrawl(item.values[0])
      end
    rescue OpenURI::HTTPError => e
      @error << i
      i += 1
       break if @error.length > 10
      next
    end
  end
  return @result.last
end
done = webcrawl("https://scottduane.github.io/TopSecretClue")

puts done
