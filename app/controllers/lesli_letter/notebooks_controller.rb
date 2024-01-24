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
    class NotebooksController < ApplicationController
        before_action :set_notebook, only: %i[ show edit update destroy ]

        # GET /notebooks
        def index
            respond_to do |format|
                format.html {}
                format.json {
                    respond_with_pagination(NotebookService.new(current_user, query).index())
                }
            end
        end

        # GET /notebooks/1
        def show
        end

        # GET /notebooks/new
        def new
            @notebook = Notebook.new
        end

        # GET /notebooks/1/edit
        def edit
        end

        # POST /notebooks
        def create
            @notebook = Notebook.new(notebook_params)

            if @notebook.save
            redirect_to @notebook, notice: "Notebook was successfully created."
            else
            render :new, status: :unprocessable_entity
            end
        end

        # PATCH/PUT /notebooks/1
        def update
            if @notebook.update(notebook_params)
            redirect_to @notebook, notice: "Notebook was successfully updated.", status: :see_other
            else
            render :edit, status: :unprocessable_entity
            end
        end

        # DELETE /notebooks/1
        def destroy
            @notebook.destroy
            redirect_to notebooks_url, notice: "Notebook was successfully destroyed.", status: :see_other
        end

        private

        # Use callbacks to share common setup or constraints between actions.
        def set_notebook
        @notebook = Notebook.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def notebook_params
        params.fetch(:notebook, {})
        end
    end
end
