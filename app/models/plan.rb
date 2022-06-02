class Plan < ApplicationRecord
    validates :title, presence: true
    validates :start, presence: true
    validates :finish, presence: true

    validate :start_finish_check

    def start_finish_check
        errors.add(:finish, "は開始日より前の日付は登録できません。") unless
        self.start < self.finish
    end

end
