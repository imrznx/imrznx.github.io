require 'html_press'

Jekyll::Hooks.register :site, :post_write do |site|
  Dir.glob("#{site.config['destination']}/**/*.html") do |file|
    content = File.read(file)
    minified_content = HtmlPress.press(content)
    File.open(file, "w") { |f| f.write(minified_content) }
  end
end
