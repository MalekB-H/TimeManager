<template>
    <div>
      <h1 class="text-lg font-bold mb-4">Promouvoir un Employé</h1>
      <EmployeeSelector @employee-selected="handleEmployeeSelected" />
      <button @click="promouvoirEmploye" :disabled="!selectedEmployee" class="mt-4 bg-blue-500 text-white py-2 px-4 rounded">
        Promouvoir l'employé
      </button>
      <p v-if="error" class="text-red-500 mt-2">{{ error }}</p>
      <p v-if="successMessage" class="text-green-500 mt-2">{{ successMessage }}</p>
    </div>
  </template>
  
  <script>
  import EmployeeSelector from './EmployeeSelector.vue'; 
  import api from '../services/api';
  
  export default {
    components: {
      EmployeeSelector
    },
    data() {
      return {
        selectedEmployee: null,
        error: '',
        successMessage: ''
      };
    },
    methods: {
      handleEmployeeSelected(employee) {
        this.selectedEmployee = employee;
        this.error = ''; 
      },
      async promouvoirEmploye() {
        if (!this.selectedEmployee) {
            this.error = 'Aucun employé sélectionné pour la promotion.';
            return;
        }

        const { id, username, email } = this.selectedEmployee;

        // Log des données envoyées
        console.log('Données de promotion envoyées:', {
            username: username,
            email: email,
            role: 'manager'
        });

        try {
            const response = await api.promoteUser(id, { 
            username: username, 
            email: email, 
            role: 'manager',
            password: 'test123'
            });
            
            console.log('Réponse de promotion:', response);
            this.successMessage = 'Employé promu avec succès !';
        } catch (error) {
            if (error.response) {
            console.error('Erreur lors de la promotion de l\'employé:', error.response.data);
            this.error = error.response.data.message || 'Une erreur est survenue lors de la promotion de l\'employé.';
            } else {
            console.error('Erreur lors de la promotion de l\'employé:', error);
            this.error = 'Une erreur est survenue lors de la promotion de l\'employé.';
            }
        }
    }

    }
  };
  </script>
  
  <style scoped>
  .promouvoir-container {
    max-width: 400px;
    margin: auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #f9f9f9;
  }
  .form-group {
    margin-bottom: 15px;
  }
  .form-group label {
    display: block;
    margin-bottom: 5px;
  }
  .success {
    color: green;
  }
  .error {
    color: red;
  }
  </style>
  