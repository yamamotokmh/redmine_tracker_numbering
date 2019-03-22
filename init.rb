Redmine::Plugin.register :redmine_tracker_numbering do
  name 'Redmine Tracker Numbering plugin'
  author 'yamamotokmh'
  description ''
  version '0.0.1'
  url ''
  author_url ''
end

Dir[File.expand_path('../lib/redmine_tracker_numbering', __FILE__) << '/*.rb'].each do |file|
    require_dependency file
end