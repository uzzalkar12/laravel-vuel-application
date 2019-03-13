<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12 mt-3">
                <div class="card card-widget widget-user">
                    <!-- Add the bg color to the header using any of the bg-* classes -->
                    <div class="widget-user-header text-white"
                         style="background: url('./img/photo1.png') center center;">
                        <h3 class="widget-user-username">{{ this.form.name }}</h3>
                        <h5 class="widget-user-desc">{{ this.form.type }}</h5>
                    </div>
                    <div class="widget-user-image">
                        <!--<img class="img-circle" :src="getProfilePhoto()" alt="User Avatar">-->
                        <img class="img-circle" :src="getProfilePhoto()" alt="User Avatar">
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header">3,200</h5>
                                    <span class="description-text">SALES</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header">13,000</h5>
                                    <span class="description-text">FOLLOWERS</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4">
                                <div class="description-block">
                                    <h5 class="description-header">35</h5>
                                    <span class="description-text">PRODUCTS</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <ul class="nav nav-pills">
                            <li class="nav-item"><a class="nav-link active show" href="#activity" data-toggle="tab">Activity</a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">Settings</a>
                            </li>
                        </ul>
                    </div><!-- /.card-header -->
                    <div class="card-body">
                        <div class="tab-content">
                            <div class="tab-pane active show" id="activity">
                                <h3>Display User Activity</h3>
                            </div>

                            <div class="tab-pane" id="settings">
                                <form @keydown="form.onKeydown($event)"
                                      class="form-horizontal">
                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 control-label">Name</label>

                                        <div class="col-sm-10">
                                            <input type="text" v-model="form.name" class="form-control" id="name"
                                                   :class="{ 'is-invalid': form.errors.has('name') }"
                                                   placeholder="Name">
                                            <has-error :form="form" field="name"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">Email</label>

                                        <div class="col-sm-10">
                                            <input type="email" v-model="form.email" class="form-control" id="email"
                                                   :class="{ 'is-invalid': form.errors.has('email') }"
                                                   placeholder="Email">
                                            <has-error :form="form" field="email"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bio"
                                               class="col-sm-2 control-label">Bio</label>

                                        <div class="col-sm-10">
                                                <textarea class="form-control" v-model="form.bio" id="bio"
                                                          :class="{ 'is-invalid': form.errors.has('bio') }"
                                                          placeholder="Bio"></textarea>
                                            <has-error :form="form" field="bio"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="photo" class="col-sm-6 control-label">Profile Photo</label>
                                        <div class="col-sm-10">
                                            <input type="file" name="photo" @change="updateProfile" class="form-control"
                                                   id="photo">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-sm-6 control-label">Password (Leave empty if
                                            not changing)</label>

                                        <div class="col-sm-10">
                                            <input type="password" v-model="form.password" class="form-control"
                                                   id="password"
                                                   :class="{ 'is-invalid': form.errors.has('password') }"
                                                   placeholder="Password">
                                            <has-error :form="form" field="password"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button @click.prevent="updateInfo" type="submit" class="btn btn-success">
                                                Update
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                form: new Form({
                    id: '',
                    name: '',
                    email: '',
                    password: '',
                    type: '',
                    bio: '',
                    photo: '',
                }),
            }
        },
        created() {
            this.form.get('api/profile')
                .then(({data}) => (
                    this.form.fill(data)
                ))
                .catch()
        },
        methods: {
            updateProfile(event) {
                let file = event.target.files[0];
                let reader = new FileReader();
                if (file['size'] < 2111775) {
                    let vm = this;
                    reader.onloadend = function (file) {
                        //console.log('RESULT', reader.result)
                        vm.form.photo = reader.result;
                    };

                    reader.readAsDataURL(file);
                } else {
                    swal({
                        type: 'error',
                        title: 'Oops..',
                        text: 'You are uploading large file',
                    })
                }
            },

            updateInfo() {
                this.$Progress.start();
                if (this.form.password == ''){
                    this.form.password = undefined;
                }

                this.form.put('api/profile')
                    .then(() => {
                        Fire.$emit('AfterCreate');

                        this.$Progress.finish();
                    })
                    .catch(() => {

                        this.$Progress.fail();
                    })
            },

            getProfilePhoto() {
               let photo = (this.form.photo.length > 200)
                            ? this.form.photo
                            : "img/profile/" + this.form.photo;
               return photo;
            }
        }
    }
</script>
<style scoped>
    .widget-user .widget-user-header {
        padding: 1rem;
        height: 260px;
        border-top-left-radius: 0.25rem;
        border-top-right-radius: 0.25rem;
    }

    .widget-user .card-footer {
        padding-top: 10px;
    }
</style>
