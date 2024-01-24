=begin

Lesli

Copyright (c) 2023, Lesli Technologies, S. A.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see http://www.gnu.org/licenses/.

Lesli · Ruby on Rails SaaS development platform.

Made with ♥ by https://www.lesli.tech
Building a better future, one line of code at a time.

@contact  hello@lesli.tech
@website  https://www.lesli.tech
@license  GPLv3 http://www.gnu.org/licenses/gpl-3.0.en.html

// · ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~
// · 
=end

module LesliLetter
    class NoteService < Lesli::ApplicationLesliService

        def find id 
            super(current_user.account.letter.notes.find_by_id(id))
        end 

        def index 
            current_user.account.letter.notes
            .select(
                "lesli_letter_notes.id as id",
                "lesli_letter_notes.name as title",
                "SUBSTRING(lesli_letter_notes.content, 1, 35) as excerpt"
            )
            .page(query[:pagination][:page])
            .per(query[:pagination][:perPage])
            #.order(updated_at: :desc, name: :asc)
            .order(id: :asc)
        end

        def show 
            self.resource
        end

        def update params
            if self.resource.update(params)
                return self
            end
            self.error(self.resource.errors.full_messages.to_sentence)
        end
    end
end
