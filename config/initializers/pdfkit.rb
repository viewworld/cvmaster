PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'A4',
    :print_media_type => true,
	:no_outline => true,
  :disable_smart_shrinking=>false,
	:margin_left => 0,
	:margin_right => 0,
	:margin_top => 30,
	:margin_bottom => 14
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost:3000"
  config.verbose = false
end