# encoding: UTF-8

require 'rubygems'
require 'nokogiri'
require 'fileutils'

def download(url, des_dir, name)
  FileUtils.mkdir_p(des_dir) unless Dir.exist?(des_dir)
  p "### curl -o #{des_dir}/#{name} #{url} ###"
  `curl -o #{des_dir}/#{name} #{url}`
end

ZIP_PATTERN = /^\/XML\/\d*\.zip$/
def parse_file_list(dir, html_file)
  html = Nokogiri::HTML(File.open("#{dir}/#{html_file}"))
  files = html.root.xpath('/html/body/pre/*').map do |elem|
    href = elem.attribute('href')
    next if href.nil?
    value = href.value
    next unless ZIP_PATTERN.match(value)
    value
  end
  p files.uniq.compact.size
end

# Main

@host = 'http://163.29.3.98'
# download("#{@host}/XML/", 'data', 'file-list.html')
# parse_file_list('data', 'file-list.html')
download("#{@host}/XML/45Days.zip", 'data', '45Days.zip')
p 'Unzip file'
xml_dir = 'data/xml'
FileUtils.mkdir_p(xml_dir) unless Dir.exist?(xml_dir)
`unzip -d #{xml_dir} ./data/45Days.zip`
