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

    <md-toolbar class="md-primary" transition="scale-transition"  md-elevation="1">
      <h3 class="md-title" >
        <md-icon>menu</md-icon> Administrar Entidades
      </h3>
      <template>
        <v-btn color="primary"   @click="initialize">
          <md-icon>refresh</md-icon>Refrescar
        </v-btn>
      </template>
      <v-dialog v-model="dialog" transition="scale-transition" max-width="50%">
        <template v-slot:activator="{ on }">
          <v-btn color="success" dark class="mb-2" v-on="on">
            <md-icon>add</md-icon>Crear Entidad
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
                      <v-container grid-list-md>
                        <v-layout wrap>
                          <v-flex xs12 sm6 md4>
                            <v-text-field v-model="editedItem.nombre" :rules="nombre" required :counter="50" label="Nombre"></v-text-field>
                          </v-flex>
                          <v-flex xs12 sm6 md4>
                            <v-text-field v-model="editedItem.mail" required :rules="emailRules" label="Mail"></v-text-field>
                            
                          </v-flex>
                          <v-flex xs12 sm6 md4>
                            <v-text-field v-model="editedItem.poblacion" label="Población"></v-text-field>
                          </v-flex>
                          <v-flex xs12 sm6 md4>
                            <v-text-field v-model="editedItem.provincia" label="Provincia"></v-text-field>
                          </v-flex>
                          <v-flex xs12 sm6 md4>
                            <v-text-field v-model="editedItem.codigoPostal" label="Código Postal"></v-text-field>
                          </v-flex>
                          <v-flex xs12 sm6 md4>
                            <v-text-field v-model="editedItem.telefono" label="Teléfono"></v-text-field>
                          </v-flex>
                          <v-flex xs12 sm6 md4>
                            <v-text-field v-model="editedItem.direccion" label="Dirección"></v-text-field>
                          </v-flex>
                          <v-flex xs12 sm6 md4>
                            <v-text-field v-model="editedItem.logo" label="Logo"></v-text-field>
                          </v-flex>
                          <v-flex xs12 sm6 md4>
                            <v-checkbox v-model="editedItem.estadoActivo" label="¿Entidad Bancara Activa?"></v-checkbox>
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
        <v-data-table :headers="headers" :items="EntidadesBancarias" :search="search" class="elevation-1">
          
          <template v-slot:items="props">
            <td class="text-xs-left">{{ props.item.idEntidad }}</td>
            <td class="text-xs-left">{{ props.item.nombre }}</td>
            <td class="text-xs-left">{{ props.item.direccion }}</td>
            <td class="text-xs-left">{{ props.item.codigoPostal }}</td>
            <td class="text-xs-left">{{ props.item.mail }}</td>
            <td class="text-xs-left">{{ props.item.provincia }}</td>
            <td class="text-xs-left">{{ props.item.estadoActivo }}</td>
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
    dialog: false,
    valid: true,
    nombre:'',
      nombre: [
        v => !!v || 'Obligatorio',
        v => v.length <= 50 || 'El nombre debe tener menos de 50 caracteres.'
      ],
      mail: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+/.test(v) || 'E-mail must be valid'
      ],
    search: '',
    headers: [
      { text: "ID", value: "idEntidad" },
      { text: "Nombre", value: "nombre" },
      { text: "Dirección", value: "direccion" },
      { text: "Código Postal", value: "codigoPostal" },
      { text: "Email", value: "mail" },
      { text: "Provincia", value: "provincia" },
      { text: "¿Activo?", value: "estadoActivo" },
      { text: "Fecha Inserción", value: "fechaInsercion" },
      { text: "", value: "nombre", sortable: false }
    ],
    groups: [],
    EntidadesBancarias: [],
    editedIndex: -1,
    editedItem: {
      nombre: "",
      direccion: "",
      poblacion: "",
      provincia: "",
      codigoPostal: "",
      telefono: "",
      mail: "",
      logo: "",
      estadoActivo: true
    },
    defaultItem: {
      nombre: "",
      direccion: "",
      poblacion: "",
      provincia: "",
      codigoPostal: "",
      telefono: "",
      mail: "",
      logo: "",
      estadoActivo: true
    }
  }),

  computed: {
    formTitle() {
      return "Crear Entidad";
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
    },
     close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
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

    save() {
      this.guardar();
      this.close();
    },

    guardar() {
      this.axios
        .post(
          "https://api.gestionbancaria.cmceledon.com/Api/Entidad",
          this.createJSON()
        )
        .then(response => {
          //cargarNotificacion();
          this.alert = true;
                    
          this.fetchEntidadesBancarias();
          this.dialog = false;
        })
        .catch(e => {
          if (e.response.status === 401) {
            alert("Las credenciales introducidas no son correctas");
          }
        });
    },

    createJSON() {
      if (isNaN(this.editedItem.group)) {
        return {
          nombre: this.editedItem.nombre,
          direccion: this.editedItem.direccion,
          poblacion: this.editedItem.poblacion,
          provincia: this.editedItem.provincia,
          codigoPostal: this.editedItem.codigoPostal,
          telefono: this.editedItem.telefono,
          mail: this.editedItem.mail,
          logo: this.editedItem.logo,
          estadoActivo: this.editedItem.estadoActivo
        };
      } else {
        return {
          nombre: this.editedItem.nombre,
          direccion: this.editedItem.direccion,
          poblacion: this.editedItem.poblacion,
          provincia: this.editedItem.provincia,
          codigoPostal: this.editedItem.codigoPostal,
          telefono: this.editedItem.telefono,
          mail: this.editedItem.mail,
          logo: this.editedItem.logo,
          estadoActivo: this.editedItem.estadoActivo
        };
      }
    }
  }
};
</script>

<style lang="scss">
.form {
  max-width: 30% !important;
  text-align: center;
}
h3.md-title {
  flex: 1 1 0%;
  text-transform: uppercase;
}
.md-toolbar + .md-toolbar {
  margin-top: 16px;
}
</style>
