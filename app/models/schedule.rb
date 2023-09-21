class Schedule < ApplicationRecord
    validates :title, length: {maximum:20}
    validates :start, presence: true
    validates :finish, presence: true
    validates :memo, length: {maximum:500}
    validate  :start_finish_check

    def start_finish_check
        unless self.start == nil || self.finish == nil
            if  self.start > self.finish
            errors.add(:base, "終了日は開始日よりも後に設定してください")
            end
        end
    end
end