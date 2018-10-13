<template>
    <div class="container">
        <div class="row">
            <div class="col-4 align-left"></div>
            <div class="col-4">
                <form @submit.prevent="save" v-if="isOwner">
                    <div class="form-group">
                        <label for="courseCode">Código curso</label>
                        <input type="text" class="form-control" id="courseCode" placeholder="Entre el código del curso" v-model="form.courseCode">
                    </div>
                    <div class="form-group">
                        <label for="courseName">Nombre del curso</label>
                        <input type="text" class="form-control" id="courseName" placeholder="Nombre curso" v-model="form.courseName">
                    </div>
                    <div class="form-group">
                        <label for="courseCost">Costo del curso</label>
                        <input type="number" class="form-control" id="courseCost" placeholder="Costo curso" v-model="form.courseCost">
                    </div>
                    <div class="form-group">
                        <label for="courseDuration">Duración del curso</label>
                        <input type="number" class="form-control" id="courseDuration" placeholder="Duración del curso" v-model="form.courseDuration">
                    </div>
                    <div class="form-group">
                        <label for="courseThreshold">Umbral del curso</label>
                        <input type="number" class="form-control" id="courseThreshold" placeholder="Umbral del curso" v-model="form.courseThreshold">
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-primary" @click="sessions++">Agregar sesión</button>
                        &nbsp;
                        <button type="button" class="btn btn-danger" @click="sessions--" v-if="sessions">Borrar sesión</button>
                    </div>
                    <div class="form-group" v-for="(code, idx) in sessions" v-if="sessions">
                        <input type="text" class="form-control" :placeholder="`Session ${code}`" v-model="form.codes[idx]">
                    </div>
                    <button type="submit" class="btn btn-success">Enviar</button>
                </form>
                <div class="alert alert-danger" role="alert" v-else>
                    No eres el dueño , no has iniciado sesión o no tienes MetaMask.
                    Puedes obtenerlo haciendo click <a href="https://metamask.io/" target="_blank"> acá </a>
                </div>
            </div>
            <div class="col-4 align-right"></div>
        </div>
    </div>
</template>

<script>
  import {mapActions, mapState} from 'vuex'
  import * as constants from '@/store/constants'

  export default {
    name: "Bform",
    data () {
      return {
        sessions: 3,
        form: {
          courseCode: null,
          courseName: null,
          courseCost: null,
          courseDuration: null,
          courseThreshold: null,
          codes: []
        }
      }
    },
    computed: {
      ...mapState({
        isOwner: state => state.Course.isOwner
      })
    },
    methods: {
      ...mapActions({
        init: constants.COURSE_INIT,
        addCourse: constants.COURSE_ADD_COURSE
      }),
      save () {
        this.addCourse(this.form)
      }
    },
    created () {
      this.init()
    }
  }
</script>

<style scoped>

</style>