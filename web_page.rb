require_relative 'request'

api_key = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=AbDJ4yz4uugHls1v3PAXCMLeV4t8Rx1pBaCEpten'

def build_web_page(url)
    images = get_data("#{url}")

    head = "<!doctype html>\n" +
            "<html lang='es'>\n" +
            "\t<head>\n" +
            "\t\t<title>Mars Rover Photos</title>\n" +
            "\t\t<!-- Required meta tags -->\n" +
            "\t\t<meta charset='utf-8'>\n" +
            "\t\t<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>\n" +
            "\t\t<!-- Bootstrap CSS -->\n" +
            "\t\t<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>\n" +
            "\t</head>\n" +
            "\t<body>\n"+
            
            "\t\t<h1 class='text-center'>Mars Rover Photos</h1>\n"

    lista = "\t\t<ul>\n"

    images.each do |key, value|
        value.each do |info|
            lista += "\t\t\t<li><img src='#{info['img_src']}'></li>\n"
        end
    end

    lista += "\t\t</ul>\n"

    foot = "\t\t<!-- Optional JavaScript -->\n" +
            "\t\t<!-- jQuery first, then Popper.js, then Bootstrap JS -->\n" +
            "\t\t<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>\n" +
            "\t\t<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js' integrity='sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1' crossorigin='anonymous'></script>\n" +
            "\t\t<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js' integrity='sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM' crossorigin='anonymous'></script>\n" +
            "\t</body>\n" +
            "</html>"

    total = head + lista + foot
    return total
end

index = build_web_page(api_key)
File.write('./index.html', index)