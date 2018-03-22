class StarredRepos

  attr_reader :name,
              :count

  def initialize(repo)
    @count    = repo.count
    @name     = repo[:name]
  end

end
