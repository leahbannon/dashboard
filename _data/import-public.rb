#! /usr/bin/env ruby
#
# Imports project data from the 18F Public Hub API.
#
# Author: Mike Bland (michael.bland@gsa.gov)
# Date:   2014-12-22

require 'json'
require 'open-uri'

DATA_DIR = File.dirname __FILE__
PROJECT_DATA_URL = 'https://team-api.18f.gov/public/api/projects/'

open(PROJECT_DATA_URL) do |projects|
  open(File.join(DATA_DIR, 'projects.json'), 'w') do |f|
    f.write JSON.pretty_generate(
      JSON.parse(projects.read)['results'].map { |p| [p['name'], p] }.to_h)
  end
end
