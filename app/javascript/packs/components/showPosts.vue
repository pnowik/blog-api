<template>
    <div id="app">
        <p>{{ message }}</p>
        <ol>
            <li v-for="todo in todos">
                {{ todo.text }}
            </li>
        </ol>

        <p>{{ message2 }}</p>
        <button v-on:click="reverseMessage">Reverse Message</button>

        <p>Title: {{ title }}</p>
        <p>Created by: {{ created_by }}</p>
        <p>Subtitle: {{ subtitle }}</p>
        <p>Body: {{ body }}</p>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                title: null,
                subtitle: null,
                body: null,
                created_by: null,
                message: "Hello Vue!",
                todos: [
                    { text: 'Learn JavaScript' },
                    { text: 'Learn Vue' },
                    { text: 'Build something awesome' }
                ],
                message2: 'Hello Vue.js!'
            }

        },

        mounted () {
            this.$http.get('http://localhost:3000/posts').then(result => {
                this.title = result.data[0].title, this.created_by = result.data[0].created_by, this.subtitle = result.data[0].subtitle, this.body = result.data[0].body
            }, error => {
                console.error(error);
            });
        },

        methods: {
            reverseMessage: function () {
                this.message2 = this.message2.split('').reverse().join('')
            }
        }

    }
</script>

<style scoped>
    p {
        font-size: 2em;
        text-align: center;
    }
</style>
