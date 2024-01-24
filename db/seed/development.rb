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

Lesli · Ruby on Rails SaaS Development Framework.

Made with ♥ by https://www.lesli.tech
Building a better future, one line of code at a time.

@contact  hello@lesli.tech
@website  https://www.lesli.tech
@license  GPLv3 http://www.gnu.org/licenses/gpl-3.0.en.html

// · ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~
// · 
=end

current_user = Lesli::User.first

10.times do |index| 
    notebook = current_user.account.letter.notebooks.create!({
        :name => "Demo notebook ##{index}",
        :description => "My printer number #{index} is not working",
        :active => true,
        :user => current_user
    })

    25.times do |index| 
        notebook.notes.create!({
            :name => "Demo note ##{index}",
            #:type => "",
            :privacy => "private",
            :content => "In the shadowy realms where darkness prevails, a fellowship emerges, forged in the crucible of adversity. Hearts ablaze with courage, swords unsheathed, they embark on an odyssey through perilous lands. Bound by a singular ring and destiny's intertwining threads, they traverse the daunting landscapes of Middle-earth. Each step echoes with the weight of history, a journey marked by sacrifice and valor. Amidst the towering peaks of Mordor, their unwavering unity stands as a beacon against the encroaching night. In this epic tale, even the smallest among them carries the potential to alter the course of history, proving that strength lies not in size but in the bonds forged on the precipice of doom.",
            :user => current_user,
            :account => current_user.account
        })
    end 
end 
