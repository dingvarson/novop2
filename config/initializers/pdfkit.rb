PDFKit.configure do |config|
#RODANDO O PDF NO HEROKU
config.wkhtmltopdf = 'bin/wkhtmltopdf/wkhtmltopdf-linux-amd64'
#RODANDO O PDF LOCALMENTE
#config.wkhtmltopdf = 'bin/wkhtmltopdf/wkhtmltopdf.exe'
config.default_options = {
:page_size => 'Legal',
:print_media_type => true
}
#config.root_url = "http://localhost" # Use only if your external hostname is unavailable on the server
end