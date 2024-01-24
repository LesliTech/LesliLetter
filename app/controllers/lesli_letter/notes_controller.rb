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
module LesliLetter
    class NotesController < ApplicationController
        before_action :set_note, only: %i[ show edit update destroy ]

        # GET /notes
        def index
            respond_to do |format|
                format.html {}
                format.json {
                    respond_with_pagination(NoteService.new(current_user, query).index())
                }
            end
        end

        # GET /notes/1
        def show
            respond_to do |format|
                format.html {}
                format.json {
                    pp "--------"
                    respond_with_successful(@note.show())
                    pp "--------"
                }
            end
        end

        # GET /notes/new
        def new
        @note = Note.new
        end

        # GET /notes/1/edit
        def edit
        end

        # POST /notes
        def create
        @note = Note.new(note_params)

        if @note.save
        redirect_to @note, notice: "Note was successfully created."
        else
        render :new, status: :unprocessable_entity
        end
        end

        # PATCH/PUT /notes/1
        def update

            @note.update(note_params)

            if @note.successful?
                return respond_with_successful(@note)
            end

            respond_with_error(@note.errors)
        end

        # DELETE /notes/1
        def destroy
        @note.destroy
        redirect_to notes_url, notice: "Note was successfully destroyed.", status: :see_other
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_note
            @note = NoteService.new(current_user, query).find(params[:id])
            respond_with_not_found unless @note.found?
        end

        # Only allow a list of trusted parameters through.
        def note_params
            params.fetch(:note, {}).permit(
                :title,
                :excerpt,
                :content,
                :icon
            )
        end
    end
end
