class OpponentTeam < ApplicationRecord
    belongs_to :user
    belongs_to :tournament
    has_many :opponent_roosters, dependent: :destroy
    has_many :event,dependent: :destroy
    has_many :opponent_team_line_up,dependent: :destroy
    has_one_attached :image ,dependent: :destroy
    validates :name, :short_name, presence: true
    has_many :batting_stats	, dependent: :destroy
    has_many :pitching_stats, dependent: :destroy	


    before_create :set_user_id
    private
  
    def set_user_id
      self.user_id = user.id if user
    end
end
