<template>
  <div class="bg-white p-6 rounded-lg shadow-md">
    <h2 class="text-xl font-semibold mb-4">Créer une équipe</h2>
    <form @submit.prevent="createTeam" class="space-y-4">
      <div>
        <label for="teamName" class="block text-sm font-medium text-gray-700">Nom de l'équipe:</label>
        <input 
          type="text" 
          v-model="teamName" 
          id="teamName" 
          class="mt-1 block w-full rounded-md border-gray-300 shadow-sm"
          required
        />
      </div>
      
      <div>
        <label for="managerId" class="block text-sm font-medium text-gray-700">Manager:</label>
        <select 
          v-model="managerId" 
          id="managerId" 
          class="mt-1 block w-full rounded-md border-gray-300 shadow-sm"
          required
        >
          <option value="">Sélectionnez un manager</option>
          <option v-for="manager in managers" :key="manager.id" :value="manager.id">
            {{ manager.username }}
          </option>
        </select>
      </div>

      <div class="alert alert-info" v-if="successMessage">{{ successMessage }}</div>
      <div class="alert alert-error" v-if="errorMessage">{{ errorMessage }}</div>

      <button 
        type="submit"
        class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700"
      >
        Créer l'équipe
      </button>
    </form>
  </div>
</template>

<script>
import api from '../services/api'; 

export default {
  props: {
    managers: {
      type: Array,
      required: true
    }
  },
  
  data() {
    return {
      teamName: '',
      managerId: '',
      members: [], // Pour l'instant vide, à implémenter si nécessaire
      successMessage: '',
      errorMessage: '',
    };
  },

  methods: {
    async createTeam() {
      if (!this.managerId || !this.teamName) {
        this.errorMessage = 'Veuillez remplir tous les champs requis.';
        return;
      }

      try {
        const teamData = {
          name: this.teamName,
          manager_id: this.managerId,
          members: this.members
        };

        await api.createTeam(teamData);
        this.successMessage = 'Équipe créée avec succès!';
        this.$emit('team-created', teamData);
        
        // Réinitialisation du formulaire
        this.teamName = '';
        this.managerId = '';
        this.errorMessage = '';
      } catch (error) {
        this.errorMessage = 'Une erreur est survenue lors de la création de l\'équipe. Veuillez réessayer.';
        console.error('Erreur lors de la création de l\'équipe:', error.response ? error.response.data : error.message);
      }
    }
  },
};
</script>