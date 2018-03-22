class FollowerActivity

  attr_reader :count,
              :type,
              :repo_name,
              :date

  def initialize(activity)
    @count        = activity.count
    @type         = activity[:type]
    @repo_name    = activity[:repo][:name]
    @date         = activity[:created_at]
    @commits      = activity[:payload][:commits]
  end

  def commits_msg
    @commits.map do |commit|
      commit[:message]
    end
  end

end
