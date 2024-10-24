<template>
  <div class="mb-6">
    <label for="employee-select" class="block text-sm font-medium text-gray-700 mb-2">Sélectionner un employé</label>
    <select
      id="employee-select"
      v-model="selectedEmployeeId"
      @change="selectEmployee"
      class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"
    >
      <option value="">Sélectionner un employé</option>
      <option v-for="employee in filteredEmployees" :key="employee.id" :value="employee.id">
        {{ employee.username || employee.email || `Employee ${employee.id}` }}
      </option>
    </select>
    <p v-if="error" class="mt-2 text-sm text-red-600">{{ error }}</p>
  </div>
</template>

<script>
import { ref, onMounted, computed } from 'vue';
import api from '../services/api';

export default {
  name: 'EmployeeSelector',
  emits: ['employee-selected'],
  setup(props, { emit }) {
    const employees = ref([]);
    const selectedEmployeeId = ref('');
    const error = ref('');

    const fetchEmployees = async () => {
      try {
        const response = await api.searchUsers();
        console.log('Réponse API:', response); // For debugging
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

    // Filtre pour exclure les managers
    const filteredEmployees = computed(() => {
      return employees.value.filter(employee => employee.role !== 'manager');
    });

    const selectEmployee = () => {
      if (!selectedEmployeeId.value) {
        emit('employee-selected', null);
        return;
      }
      const selectedEmployee = employees.value.find(emp => emp.id == selectedEmployeeId.value);
      if (selectedEmployee) {
        emit('employee-selected', selectedEmployee);
      } else {
        console.error('Employé sélectionné non trouvé');
        error.value = 'Erreur lors de la sélection de l\'employé. Veuillez réessayer.';
      }
    };

    onMounted(fetchEmployees);

    return { filteredEmployees, selectedEmployeeId, selectEmployee, error };
  }
};
</script>