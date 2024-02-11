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
import { useNote } from "LesliLetter/stores/note"
import { useNotes } from "LesliLetter/stores/notes"


// · import lesli components
import { editorRichText } from "lesli-vue/components"


// · 
const storeNote = useNote()
const storeNotes = useNotes()


// · translations
const translations = {
    lesli: {
        shared: i18n.t("lesli.shared")
    },
    notes: i18n.t("lesli_letter.notes")
}


// · 
function selectNote(id) {
    storeNote.get(id)
}


// · 
onMounted(() => {
    storeNotes.get()
})
</script>
<template>
    <lesli-application-container>
        <lesli-header :title="translations.notes.view_title">
            <lesli-link main icon="add" :to="url.letter('notes/new')">
                {{ translations.lesli.shared.button_add_new }}
            </lesli-link>
        </lesli-header>
        <lesli-toolbar :search-placeholder="translations.notes.toolbar_search_placeholder"></lesli-toolbar>
        <div class="columns mt-4 notebooks-notes">
            <div class="column is-3 has-background-white notes">
                <div v-for="note in storeNotes.index.records" @click="selectNote(note.id)">
                    <h5>{{ note.title }}</h5>
                    <p>{{ note.excerpt }}</p>
                </div>
            </div>
            <div class="column has-background-white editor">
                <editor-rich-text 
                    @save="storeNote.updateContent()"
                    v-model="storeNote.note.content">
                </editor-rich-text>
            </div>
        </div>
    </lesli-application-container>
</template>
