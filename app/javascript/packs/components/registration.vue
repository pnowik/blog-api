<template>
    <div class="registration">
        <input type="text" v-model="input.name" placeholder="Name" />
        <input type="text" v-model="input.email" placeholder="Email" />
        <input type="password" v-model="input.password" placeholder="Password" />
        <input type="password" v-model="input.password_confirmation" placeholder="Password Confirmation" />
        <button v-on:click="sendData()">Send</button>
        <br />
        <br />
        <textarea>{{ response }}</textarea>
    </div>
</template>

<script>

    export default {
        name: 'registration',
        data () {
            return {
                input: {
                    name: "",
                    email: "",
                    password: "",
                    password_confirmation: "",
                },
                response: ""
            }
        },
        mounted() { },
        methods: {
            sendData() {
                this.$http.post("http://localhost:3000/signup", this.input, { headers: { "content-type": "application/json" } }).then(result => {
                    this.response = result.data.auth_token;
                }, error => {
                    console.error(error);
                });

            }
        }
    }
</script>

<style scoped>
    h1, h2 {
        font-weight: normal;
    }

    ul {
        list-style-type: none;
        padding: 0;
    }

    li {
        display: inline-block;
        margin: 0 10px;
    }

    a {
        color: #42b983;
    }

    textarea {
        width: 600px;
        height: 200px;
    }
</style>
