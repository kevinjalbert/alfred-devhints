# This script does the following:
# - Fetch the search-index.json from devhints.io
# - Constructs the script filter's script from the response
# - Prints the results to then be copy and pasted in Alfred
#
require "open-uri"
require "json"

response = open("https://devhints.io/data/search-index.json").read

items = JSON.parse(response).map do |element|
  next if element["category"] == "Hidden"

  id = element["id"]
  title = element["title"]
  category = element["category"]
  url = "https://devhints.io#{element["url"]}"

  {
    uid: id,
    title: title,
    subtitle: category,
    match: [title, category].join,
    autocomplete: title,
    quicklookurl: url,
    text: { copy: url },
    icon: { path: "./icon.png" },
    arg: url
  }
end.compact

puts <<-HEREDOC
cat << EOB
#{{ "items" => items }.to_json}
EOB
HEREDOC
