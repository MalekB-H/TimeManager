<template>
  <div>
    <h2>Créer une équipe</h2>
    <div>
      <label for="managerId">ID du Manager:</label>
      <input type="text" v-model="managerId" id="managerId" />
    </div>
    <button @click="createTeam">Créer l'équipe</button>
    <div v-if="successMessage">{{ successMessage }}</div>
    <div v-if="errorMessage">{{ errorMessage }}</div>
  </div>
</template>

<script>
import api from '../services/api'; 

export default {
  data() {
    return {
      managerId: '', 
      successMessage: '',
      errorMessage: '',
    };
  },
  methods: {
    async createTeam() {
      if (!this.managerId) {
          this.errorMessage = 'Veuillez entrer l\'ID du manager.';
          return;
      }

      try {
          await api.createTeam({ managerId: this.managerId });
          this.successMessage = 'Équipe créée avec succès!';
          this.managerId = ''; 
      } catch (error) {
          this.errorMessage = 'Une erreur est survenue lors de la création de l\'équipe. Veuillez réessayer.';
          console.error('Erreur lors de la création de l\'équipe:', error.response ? error.response.data : error.message);
      }
     }

  },
};
</script>
