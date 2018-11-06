# alfred-devhints

Search for Devhints.io cheatsheets from Alfred

Use `dh` to start searching across the cheatsheets.

## Installation

Download the [workflow](https://github.com/packal/repository/raw/master/com.kevinjalbert.alfred-devhints/devhints.alfredworkflow) and install it.

## How it works

The workflow is just a script filter in Alfred with all the cheatsheets present in a JSON string. The [generate-script.rb](./generate-script.rb) will extract the latest cheatsheets using the following URL: https://devhints.io/data/search-index.json. Right now it is a manual step to update the script filter to use the new JSON. 
