# http://pwpreview.herokuapp.com/1_highvolumehdf.html

require 'json'
require "open-uri"
require 'nokogiri'

root = "http://pwpreview.herokuapp.com"
root = "http://localhost:9000"
pm = JSON.parse(open("#{root}/pocketmedia.json").read)
#puts pm.inspect
ext = "jpeg"

html = "<html><head><style>body,td{background-color: #EEE; font-family: 'helvetica'; font-size: 0.8em; color: #efefef;} img{width: 300px; margin:20px 10px 10px 10px; box-shadow: 0px 0px 8px #AAA;} img:hover{-webkit-transition: width 0.4s;width:310px;} td{text-align: center; vertical-align: top;} a img{border:none;} </style></head><body><table>"
pm["flows"].each do |i,flow|  
  html += "<tr><td>#{flow["title"] || ''}</td>"
  flow["slides"].each do |slide|
    url = "#{root}/#{slide["url"]}"
    html +="<td>"
    html += "<div style='position:relative;width:330px; text-align: center;'><a href='#{slide["url"]}'><img src='./thumbs/#{slide["url"].gsub(/\//,'_')}.#{ext}'></a></div><br/>#{slide["title"]}"
    html +="</td>"
  end
  html += "</tr>"
end

html += "</table>"

if false
  done = []
  pm["flows"].each do |i,flow|  
    flow["slides"].each do |slide|
      url = "#{root}/#{slide["url"]}"
      doc = Nokogiri::HTML(open(url))
      doc.css('img,video').each do |img|
      
        unless done.include?(img.attr('src')) or img.attr('src') =~ /thumbs/
          html += "<a href='#{url}'><div style='display: inline-block; width: 200px; height: 150px; margin: 1em; background-image: url(\"#{img.attr("src")}\"); background-size: contain; background-repeat: no-repeat; border: 5px solid rgba(255,255,255,0.9); background-color: white;'></div></a>"
        end
        done << img.attr('src')
      end
    end
  end
end

html += "</body></html>"
File.open('map.html','w').write(html)



pm["flows"].each do |i,flow|
  flow["slides"].each do |slide|
    
    url = "#{root}/#{slide["url"]}"
    puts url
    begin
      outfile = "thumbs/#{slide["url"].gsub(/\//,'_')}.#{ext}"
      #puts `webkit2png --delay=1 -s 0.5 -W 1024 -H 768 --user-agent="Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10" --selector=".page" -T #{url}`
      unless File.exist?(outfile) or outfile =~ /map\.html/
      puts `CutyCapt --out-format=#{ext} --delay=2.5 --plugins=on --zoom-factor=0.6 --url=#{url} --out=#{outfile} --min-width=1024 --user-agent="Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10"`
      end
    rescue
      puts "Skipping #{url}"
    end
  end
end




