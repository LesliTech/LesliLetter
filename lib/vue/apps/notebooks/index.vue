<script setup>
/*
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
*/


// · import vue tools
import { ref, reactive, onMounted, watch, computed, inject } from "vue"
import { useRouter, useRoute } from "vue-router"


// · initialize/inject plugins
const router = useRouter()
const route = useRoute()
const url = inject("url")


// · import lesli stores
import { useNotebooks } from "LesliLetter/stores/notebooks"


// · 
const storeNotebooks = useNotebooks()


// · translations
const translations = {
    lesli: {
        shared: i18n.t("lesli.shared")
    },
    notes: i18n.t("lesli_letter.notes")
}


// · 
onMounted(() => {
    storeNotebooks.get()
    console.log("works")
})
</script>
<template>
    <lesli-application-container>
        <lesli-header :title="translations.notes.view_title">
            <lesli-button-link main icon="add" :to="url.letter('notes/new')">
                {{ translations.lesli.shared.button_add_new }}
            </lesli-button-link>
        </lesli-header>
        <lesli-toolbar :search-placeholder="translations.notes.toolbar_search_placeholder"></lesli-toolbar>
        <div class="columns is-multiline mt-4 notebooks">
            <div class="column is-3" v-for="notebook in storeNotebooks.index.records">
                <lesli-card>
                    <h5>{{ notebook.name }}</h5>
                    <p>{{ notebook.description }}</p>
                </lesli-card>
            </div>
        </div>
    </lesli-application-container>
</template>
