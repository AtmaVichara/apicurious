class Repo < ApplicationRecord

  def initialize(repos = {})
    @name           = repos[:name]
    @full_name      = repos[:full_name]
    @owner          = repos[:owner][:login]
    @private        = repos[:private]
    @fork           = repos[:fork]
    @html_url       = repos[:html_url]
    @size           = repos[:size]
    @language       = repos[:language]
    @forks          = repos[:forks]
    @open_issues    = repos[:open_issues]
    @watchers       = repos[:watchers]
    @default_branch = repos[:default_branch]
  end

end
