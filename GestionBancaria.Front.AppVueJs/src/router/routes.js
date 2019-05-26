import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Entidad from '../components/Entidad.vue'
import Grupo from '../components/Grupo.vue'
import GrupoEntidad from '../components/EntidadesAsociadas'

Vue.use(VueRouter)

export const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/Entidad',
    name: 'Entidad',
    component: Entidad
  },
  {
    path: '/Grupo',
    name: 'Grupo',
    component: Grupo
  },
  {
    path: '/GrupoEntidad',
    name: 'GrupoEntidad',
    component: GrupoEntidad
  },
  {
    path: '/about',
    name: 'about',
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]
