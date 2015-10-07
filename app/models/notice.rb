class Notice < ActiveRecord::Base
    belongs_to :user
    before_save :set_qcomments
    def set_qcomments
        self.qcomments = 0 if self.qcomments.blank?
    end
    validates :title, presence: true
    validates :message, presence: true
    validates :user, presence: true
end
