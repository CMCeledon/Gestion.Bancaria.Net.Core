<template>
  <v-app>
    <v-toolbar app>
      <v-toolbar-title style="" class="headline text-uppercase">
        <span style="z-index: 10;text-transform: none;" >Gestion.Bancaria.Front.AppVuejs</span>
        
      </v-toolbar-title>

      <v-spacer></v-spacer>

      <v-toolbar-items class="hidden-sm-and-down">
<v-btn flat="" target="_blank" href="https://api.gestionbancaria.cmceledon.com/">
         Ver - Gestion.Bancaria.Net.Core - Web Api
         </v-btn>
<v-btn icon target="_blank" href="https://github.com/CMCeledon/Gestion.Bancaria.Net.Core" >
        <v-icon>fab fa-github</v-icon>
        <md-tooltip md-direction="left">DESCARGAR</md-tooltip>
      </v-btn>
        
    </v-toolbar-items>
    </v-toolbar>

    <v-content>

      <Entidad/>

      <Grupo/>

      <GrupoEntidad/>

    </v-content>
  
  <template>
  <v-footer
    dark
    height="auto"
  >
    <v-card
      class="flex"
      flat
      tile
    >
      <v-card-title class="teal">
        <strong class="subheading">GESTIÓN DE ENTIDADES BANCARIAS (Frontend)</strong>

        <v-spacer></v-spacer>

          <v-btn color="white" target="_blank" href="https://api.gestionbancaria.cmceledon.com/">
         Ver - Gestion.Bancaria.Net.Core - Web Api
         </v-btn>
          <v-btn color="white" class="mx-3" size="50px" icon target="_blank" href="https://github.com/CMCeledon/Gestion.Bancaria.Net.Core" >
        <v-icon>fab fa-github</v-icon>
        <md-tooltip md-direction="left">DESCARGAR</md-tooltip>
      </v-btn>
          
      </v-card-title>

      <v-card-actions class="grey darken-3 justify-center">
        &copy;2019 — <strong> www.cmceledon.com</strong>
      </v-card-actions>
    </v-card>
  </v-footer>
</template>
  </v-app>
  
</template>
<script>

import Grupo from './components/Grupo'
import Entidad from './components/Entidad'
import GrupoEntidad from './components/EntidadesAsociadas'

import { mapGetters, mapActions } from 'vuex'



export default {
  name: 'App',
  components: {
     GrupoEntidad,Grupo, Entidad
  } 
}
</script>
