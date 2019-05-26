<template>
  <v-container>
<v-alert
      v-model="alert"
      dismissible
      type="success"
      transition="scale-transition"
    >
     ¡Información guardada correctamente!
  </v-alert>
  
  <v-alert v-model="alerResultInsert" 
  dismissible
   color="error" 
   icon="warning" 
   transition="scale-transition"
   >
           Error, no se pudo almacenar el registro. <i>{{errorRegistro}}</i>
        </v-alert>

 <md-toolbar class="md-primary"  md-elevation="1">
      <h3 class="md-title" >
        <md-icon>menu</md-icon> Asociar Entidades a Grupos
      </h3>

      <template>
        <v-btn color="primary"   @click="initialize">
          <md-icon>refresh</md-icon>Refrescar
        </v-btn>
      </template>
  
</md-toolbar>
    <v-layout transition="scale-transition" text-xs-center wrap>
      
        <template>
          
                <v-container fluid grid-list-xl>
                  <v-form v-model="valid">
                  <v-layout wrap>
                      <v-flex xs12 sm4 d-flex>
                              <v-select
                              v-model="editedItem.idGrupo"
                                :items="gruposData"
                                item-text="nombre"
                                item-value="idGrupo"
                                label="Grupo"
                                solo
                                :rules="[v => !!v || 'Campo obligatorio']"
                              />
                    </v-flex>

                  <v-flex xs12 sm4 d-flex>         
                    <v-select
                      v-model="editedItem.idEntidad"
                      :items="EntidadesBancarias"
                      item-text="nombre"
                      item-value="idEntidad"
                      label="Seleccionar Entidad"
                      solo
                      :rules="[v => !!v || 'Campo obligatorio']"
                    >
                      
                    </v-select>
                  </v-flex>

 <v-flex xs12 sm4 d-flex>      
           
          <v-btn style="text-aling:center" @click="save" color="success" :disabled="!valid" dark class="mb-2">
            Asociar Entidad
          </v-btn>
      
 </v-flex>
    </v-layout>
    </v-form>
</v-container>

</template>

      <v-flex xs12>
        <v-flex xs12 sm6 md4>
        <v-text-field
        v-model="search"
        append-icon="search"
        label="Buscar"
        single-line
        hide-details
      ></v-text-field>
      </v-flex>
        <v-data-table :headers="headers" :items="groupsEntidad" :search="search" class="elevation-1">
          <template v-slot:items="props">
            <td class="text-xs-left">{{ props.item.nombreGrupo }}</td>
            <td class="text-xs-left">{{ props.item.nombreEntidad }}</td>
            <td class="text-xs-left">{{ props.item.fechaInsercion }}</td>
            <td class="justify-center layout px-0"></td>
          </template>
          <template v-slot:no-results>
        <v-alert :value="true" color="error" icon="warning">
          La búsqueda de: "{{ search }}" no arrojó ningún resultado.
        </v-alert>
      </template>
        </v-data-table>

      

      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  data: () => ({
    alert: false,
    alerResultInsert: false,
    dialog: false,
    search: '',
      valid: true,
      nombreGrupo: [
        v => !!v || 'Obligatorio',
        v => v.length <= 50 || 'El nombre debe tener menos de 50 caracteres.'
      ],
      
    headers: [
      { text: "Nombre Grupo", value: "nombreGrupo" },
      { text: "Nombre Entidad", value: "nombreEntidad" },
      { text: "Fecha Inserción", value: "fechaInsercion" },
      { text: "", value: "nombreGrupo", sortable: false }
    ],
    errorRegistro: "",
    groupsEntidad: [],
    rsultPost: [],
    gruposData: [],
    EntidadesBancarias: [],
    editedIndex: -1,
    editedItem: {
      idGrupo: "",
      nombre: "",
      color: "",
      idEntidad:""
    },
    defaultItem: {
      idGrupo: "",
      nombre: "",
      color: "",
      idEntidad:""
    }
  }),
  computed: {
    formTitle() {
      return  "Crear Grupo";
    },
selectedItems: {
      get() {
        return this.value;
      },
      set(item) {
      
        this.chosenItems.push(item)
        this.$emit("input", item);
      }
    }
  },
  watch: {
    dialog(val) {
      val || this.close();
    },
    alert(val) {
      val || this.close();
    }
  },
  created() {
    this.initialize();
  },
  methods: {
    initialize() {
      this.fetchGroups();
      this.fetchEntidadesBancarias();
      this.fetchgroupsEntidad();
    },
     
      reset () {
        this.$refs.form.reset()
      },
      resetValidation () {
        this.$refs.form.resetValidation()
      },
      fetchEntidadesBancarias() {
      this.axios
        .get("https://api.gestionbancaria.cmceledon.com/Api/Entidad", {})
        .then(response => {
          this.EntidadesBancarias = response.data;
        })
        .catch(e => {
          if (e.response.status === 401) {
            alert("No está logueado");
          } else {
            alert("Error en la carga de los datos. Error " + e.response.status);
          }
        });
    },
    fetchgroupsEntidad() {
      this.axios
        .get("https://api.gestionbancaria.cmceledon.com/Api/GrupoEntidad", {})
        .then(response => {
          this.groupsEntidad = response.data;
        })
        .catch(e => {
          alert("Error en la carga de los datos. Error " + e.response.status);
        });
    },
    fetchGroups() {
      this.axios
        .get("https://api.gestionbancaria.cmceledon.com/Api/Grupo", {})
        .then(response => {
          this.gruposData = response.data;
        })
        .catch(e => {
          alert("Error en la carga de los datos. Error " + e.response.status);
        });
    },
    close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },
    save() {
      this.alert = false;
      this.guardar();
      this.close();
    },
    
    guardar() {
      this.axios.post("https://api.gestionbancaria.cmceledon.com/Api/GrupoEntidad",this.createJSON()).then(response => {

this.data = response.data;
    this.data.forEach((item) => {
      // console.log("found: ", item)
      // console.log("found boolean: ", item.boolean)
      // console.log("found string: ", item.string)
        if(item.boolean==true){ 
          this.alerResultInsert = false;
          this.alert = true;
          this.fetchgroupsEntidad();
          this.dialog = false;
        }else{
          this.errorRegistro = item.string;
          this.alerResultInsert = true;
          this.alert = false;
        }
});
          
        })
        .catch(e => {
          this.errorRegistro = e.string;
          this.alerResultInsert = true;
          this.alert = false;
          alert("No se pudo guardar la asociación.");
        });
    },
    createJSON() {
    return {
              idGrupo: this.editedItem.idGrupo,
              idEntidad: this.editedItem.idEntidad
          }
          ;    
      }
  }
};
</script>
<style lang="scss">
.form {
  max-width: 30% !important;
  text-align: center;
}
</style>