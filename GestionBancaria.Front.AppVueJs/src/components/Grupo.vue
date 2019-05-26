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
 <md-toolbar class="md-primary"  md-elevation="1">
      <h3 class="md-title" >
        <md-icon>menu</md-icon> Administrar Grupos
      </h3>

      <template>
        <v-btn color="primary"   @click="initialize">
          <md-icon>refresh</md-icon>Refrescar
        </v-btn>
      </template>
  <v-dialog v-model="dialog" max-width="30%">
            <template v-slot:activator="{ on }">
               <v-btn @click="alert = false" color="success" dark class="mb-2" v-on="on">
            <md-icon>add</md-icon>Crear Grupo
          </v-btn>
            </template>
            <v-card>
             <md-toolbar>
            <h3 class="md-title" >{{ formTitle }}</h3>
            <md-button  @click="dialog = false" class="md-icon-button">
              <md-icon>close</md-icon>
            </md-button>
          </md-toolbar>

              <v-card-text>
                 <v-form v-model="valid">
                <v-container>
                  
                  <v-layout wrap>
                    <v-flex xs12  md6>
                      <v-text-field v-model="editedItem.nombre" :rules="nombre" required :counter="50" label="Nombre"></v-text-field>
                    </v-flex>
                    <v-flex xs12  md6>
                    <v-select
                      v-model="editedItem.color"
                      :items="listacolores"
                      :rules="[v => !!v || 'Color es obligatorio']"
                      label="Color"
                      required
                    ></v-select>
                      
                    </v-flex>



                  </v-layout>

                </v-container>
                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
 <v-btn
            color="blue darken-1"
            flat="flat"
            @click="dialog = false"
          >
            Cancelar
          </v-btn>
                <v-btn color="green darken-1" :disabled="!valid" flat @click="save">Guardar</v-btn>
              </v-card-actions>
            </v-card>
    </v-dialog>
</md-toolbar>
    <v-layout text-xs-center wrap>
      
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

        <v-data-table :headers="headers" :items="groups" :search="search" class="elevation-1">
          <template v-slot:items="props">
            <td class="text-xs-left">{{ props.item.nombre }}</td>
            <td class="text-xs-left">{{ props.item.color }}</td>
            <td class="justify-center layout px-0"></td>
          </template>
          <template v-slot:no-results>
        <v-alert :value="true" color="error" max-width="100%" icon="warning">
          La búsqueda de: "{{ search }}" no arrojó ningún resultado.
        </v-alert>
      </template>
        </v-data-table>

        <template>
 
</template>

      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  data: () => ({
    alert: false,
    dialog: false,
      valid: true,
      nombre: [
        v => !!v || 'Obligatorio',
        v => v.length <= 50 || 'El nombre debe tener menos de 50 caracteres.'
      ],
      color: [
        v => !!v || 'Obligatorio',
        v => v.length <= 30 || 'El nombre debe tener menos de 30 caracteres.'
      ],
      
    search: '',
    headers: [
      { text: "Nombre", value: "nombre" },
      { text: "Color", value: "color" },
      { text: "", value: "nombre", sortable: false }
    ],
    listacolores: [
        'Rojo',
        'Verde',
        'Azul',
        'Amarillo'
      ],
    groups: [],
    editedIndex: -1,
    editedItem: {
      idGrupo: "",
      nombre: "",
      color: ""
    },
    defaultItem: {
      idGrupo: "",
      nombre: "",
      color: ""
    }
  }),
  computed: {
    formTitle() {
      return  "Crear Grupo";
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
    },
     validate () {
        if (this.$refs.form.validate()) {
          this.snackbar = true
        }
      },
      reset () {
        this.$refs.form.reset()
      },
      resetValidation () {
        this.$refs.form.resetValidation()
      },
    fetchGroups() {
      this.axios
        .get("https://api.gestionbancaria.cmceledon.com/Api/Grupo", {})
        .then(response => {
          this.groups = response.data;
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
     close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },
    guardar() {
      this.axios
        .post("https://api.gestionbancaria.cmceledon.com/Api/Grupo", {
          Nombre: this.editedItem.nombre,
          Color: this.editedItem.color
        })
        .then(response => {
          this.alert = true;
          this.fetchGroups();
          this.dialog = false;
        })
        .catch(e => {
          alert("No se pudo guardar el grupo.");
        });
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