<template>
    <div class="hello">
        <h1>{{ msg }}</h1>
        <p class="text-light">We will perform the Crud Opertaion using VueJs, VuetifyJs and PHP</p>
        <v-app>
            <v-content>
                <v-container grid-list-md text-xs-center>
                    <v-layout row wrap>
                        <v-flex xs6>
                            <h2>
                                VueJS CRUD WITH PHP AND MySQL
                            </h2>
                        </v-flex>

                        <v-flex xs6>
                            <v-layout row justify-center>
                                <v-dialog v-model="dialog" persistent max-width="600px">
                                    <template v-slot:activator="{ on }">
                                        <v-btn color="success" dark v-on="on">Add new User</v-btn>
                                    </template>
                                    <v-card>
                                        <v-card-title>
                                            <span class="headline">User Profile</span>
                                        </v-card-title>
                                        <v-card-text>
                                            <v-container grid-list-md>

                                                <v-form ref="form">
                                                    <v-layout wrap>
                                                        <v-flex xs12>
                                                            <v-text-field label="Username*" v-model="newUser.username" :rules="[() => !!newUser.username || 'This field is required']" required></v-text-field>
                                                        </v-flex>

                                                        <v-flex xs12>
                                                            <v-text-field label="Email*" type="email" v-model="newUser.email" :rules="[() => !!newUser.email || 'This field is required']" required></v-text-field>
                                                        </v-flex>
                                                        <v-flex xs12>
                                                            <v-text-field label="Phone" type="number" v-model="newUser.mobile" counter="11" :rules="validatePhone" required></v-text-field>
                                                        </v-flex>
                                                    </v-layout>
                                                </v-form>

                                            </v-container>
                                            <small>*indicates required field</small>
                                        </v-card-text>
                                        <v-card-actions>
                                            <v-spacer></v-spacer>
                                            <v-btn color="blue darken-1" flat @click="dialog = false">Close</v-btn>
                                            <v-btn color="blue darken-1" flat @click="saveUser();">Save</v-btn>
                                        </v-card-actions>
                                    </v-card>
                                </v-dialog>
                            </v-layout>

                        </v-flex>
                    </v-layout>
                </v-container>
                <!-- Error & Success Message Container Starts -->
                <v-container>
                    <v-flex xs12>
                        <v-alert  v-model="alert"
      dismissible
                                 type="success">
                            {{  successMessage }}
                        </v-alert>
                        <v-alert v-if="errorMessage != ''"
                                 type="error">
                            {{ errorMessage }}
                        </v-alert>

                    </v-flex>

                </v-container>
                <!-- Error &  Success  Message Container Ends -->
                <v-container>
                    <!-- Datatable Starts -->
                    <v-data-table :headers="headers"
                                  :items="users"
                                  class="elevation-1">
                        <template v-slot:items="props">
                            <td class="text-xs-left">{{ props.item.user_id }}</td>
                            <td class="text-xs-left">{{ props.item.username }}</td>
                            <td class="text-xs-left">{{ props.item.email }}</td>
                            <td class="text-xs-left">{{ props.item.mobile }}</td>
                            <td>
                                <v-btn color="primary" @click="showingeditModal = true; selectUser(props.item);" dark>Edit</v-btn>
                            </td>
                            <td>
                                <v-btn color="error" @click="showingdeleteModal = true; selectUser(props.item)">Delete</v-btn>
                            </td>

                        </template>
                    </v-data-table>

                    <!-- Datatable Ends -->
                    <!-- Edit Modal Starts -->
                    <v-dialog v-model="showingeditModal"
                              width="500">
                        <v-card>
                            <v-card-title>
                                <span class="headline">User Profile</span>
                            </v-card-title>
                            <v-card-text>
                                <v-container grid-list-md>

                                    <v-form ref="form">
                                        <v-layout wrap>
                                            <v-flex xs12>
                                                <v-text-field label="User id" v-model="userClicked.user_id" disabled></v-text-field>

                                                <v-text-field label="Username*" v-model="userClicked.username" :rules="[() => !!userClicked.username || 'This field is required']" required></v-text-field>
                                            </v-flex>

                                            <v-flex xs12>
                                                <v-text-field label="Email*" type="email" v-model="userClicked.email" :rules="[() => !!userClicked.email || 'This field is required']" required></v-text-field>
                                            </v-flex>
                                            <v-flex xs12>
                                                <v-text-field label="Phone" type="number" v-model="userClicked.mobile" counter="11" :rules="validatePhone" required></v-text-field>
                                            </v-flex>
                                        </v-layout>
                                    </v-form>

                                </v-container>
                                <small>*indicates required field</small>
                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="blue darken-1" flat @click="showingeditModal = false">Close</v-btn>
                                <v-btn color="blue darken-1" flat @click="updateUser();showingeditModal = false">Save</v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    <!-- Edit Modal Ends -->
                    <!-- Delete Modal Starts -->
                    <v-dialog v-model="showingdeleteModal"
                              width="500">
                        <v-card>
                            <v-card-title>
                                <span class="headline">User Profile</span>
                            </v-card-title>
                            <v-card-text>
                                <v-container grid-list-md>

                                    <v-form ref="form">
                                        <v-layout wrap>
                                            <v-flex xs12>
                                                <h3 class="center">Are you sure to Delete? <span class="red-color">{{ userClicked.username }}</span> </h3>
                                            </v-flex>



                                        </v-layout>
                                    </v-form>

                                </v-container>
                                <small>*indicates required field</small>
                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="blue darken-1" flat @click="showingdeleteModal = false">Close</v-btn>
                                <v-btn color="warning darken-1" flat @click="deleteUser();showingdeleteModal = false">Delete</v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    <!-- Delete Modal Ends -->
                </v-container>
            </v-content>
        </v-app>
    </div>
</template>

<script>
    export default {
        name: 'HelloWorld',
        props: {
            msg: String
        },
        data() {
            return {
                dialog: false,
                successMessage: "",
                errorMessage: "",
                alert: false,
                showingdeleteModal: false,
                showingeditModal: false,
                userClicked: {},
                newUser: { username: null, email: null, mobile: null },
                validatePhone: [
                    v => !!v || 'Phone is required',
                    v => (v && v.length <= 11) || 'Phone must be equal to 11 characters'
                ],
                headers: [
                    {
                        text: 'User id',
                        align: 'left',
                        value: 'user_id'
                    },
                    { text: 'Username', value: 'username' },
                    { text: 'Email', value: 'email' },
                    { text: 'Phone', value: 'mobile' },
                    { text: 'Edit', sorting: false },
                    { text: 'Delete', sorting: false }
                ],
                users: []
            }
        },
        mounted: function () {
            this.getAllUsers();
        },
        methods: {
            getAllUsers: function () {
                var app = this;
                axios.get("http://localhost/vuecrud/api.php?action=read")
                    .then(function (response) {
                        if (response.data.error) {
                            app.errorMessage = response.data.message;
                        } else {
                            app.users = response.data.users;
                        }
                    });
            },
            saveUser: function () {
                var app = this;
                this.$refs.form.validate();
                var formData = app.toFormData(app.newUser);
                axios.post("http://localhost/vuecrud/api.php?action=create", formData)
                    .then(function (response) {
                        console.log(response);
                        app.newUser = { username: "", email: "", mobile: "" };
                        if (response.data.error) {
                            app.errorMessage = response.data.message;
                        } else {
                            app.successMessage = response.data.message;
                            app.alert = true;
                        }
                        app.dialog = false;
                         app.getAllUsers();
                    });
            },
            updateUser: function () {
                var app = this;
                this.$refs.form.validate();
                var formData = this.toFormData(this.userClicked);
                axios.post("http://localhost/vuecrud/api.php?action=update", formData)
                    .then(function (response) {
                        app.userClicked = {};
                        if (response.data.error) {
                            app.errorMessage = response.data.message;
                        } else {
                            app.successMessage = response.data.message;
                            app.alert = true;
                        }
                          app.getAllUsers();

                    });
            },
            deleteUser: function () {
                var app = this;
                var formData = app.toFormData(app.userClicked);
                axios.post("http://localhost/vuecrud/api.php?action=delete", formData)
                    .then(function (response) {
                        app.userClicked = {};
                        if (response.data.error) {
                            console.log(response.data.error);
                            app.errorMessage = response.data.message;
                        } else {
                            app.successMessage = response.data.message;
                            app.alert = true;
                        }
                          app.getAllUsers();
                    });
            },
            toFormData: function (obj) {
                var form_data = new FormData();
                for (var key in obj) {
                    form_data.append(key, obj[key]);
                }
                return form_data;
            },
            selectUser(user) {
                this.userClicked = user;
            }


        }
    }

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

    h1 {
        margin-top: 40px;
    }

    .text-light {
        padding-top: 20px;
        color: #858383;
    }

    .red-color {
        color: #f20c0c;
    }
</style>
