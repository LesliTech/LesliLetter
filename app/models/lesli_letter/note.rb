module LesliLetter
    class Note < Lesli::ApplicationLesliRecord
        belongs_to :notebook
        belongs_to :user, class_name: "Lesli::User"
        belongs_to :account, class_name: "Lesli::Account"
    end
end
