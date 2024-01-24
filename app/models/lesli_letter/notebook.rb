module LesliLetter
    class Notebook < ApplicationRecord
        belongs_to :account
        belongs_to :user, class_name: "Lesli::User"
        has_many :notes
    end
end
