<template>
  <div class="manager-selector">
    <h3>Sélectionnez un Manager</h3>
    <select @change="selectManager($event.target.value)" class="select">
      <option value="" disabled selected>Choisir un manager</option>
      <option 
        v-for="employee in filteredManagers" 
        :key="employee.id" 
        :value="employee.id"
      >
        {{ employee.username || employee.email || `Manager ${employee.id}` }}
      </option>
    </select>
    <p v-if="error" class="text-red-500">{{ error }}</p> 
  </div>
</template>

<script>
import { ref, onMounted, computed } from 'vue';
import api from '../services/api';

export default {
  name: 'ManagerSelector',
  props: {
    managers: {
      type: Array,
      required: true
    }
  },
  emits: ['manager-selected'],
  setup(props, { emit }) {
    const employees = ref([]);
    const error = ref('');

    const fetchEmployees = async () => {
      try {
        const response = await api.searchUsers();
        if (response.data && Array.isArray(response.data.data)) {
          employees.value = response.data.data;
        } else {
          throw new Error('Format de réponse inattendu');
        }
        error.value = '';
      } catch (err) {
        console.error('Erreur lors du chargement des employés:', err);
        error.value = 'Échec du chargement des employés. Veuillez réessayer.';
        employees.value = [];
      }
    };

    const filteredManagers = computed(() => {
      return employees.value.filter(employee => employee.role === 'manager');
    });

    const selectManager = (userId) => {
      const manager = filteredManagers.value.find(m => m.id.toString() === userId); // Comparer les chaînes
      if (manager) {
        emit('manager-selected', manager); 
      } else {
        console.warn('Manager non trouvé pour l’ID:', userId); // Ajout d'un log pour le débogage
      }
    };

    onMounted(fetchEmployees);

    return { filteredManagers, selectManager, error };
  }
};
</script>
