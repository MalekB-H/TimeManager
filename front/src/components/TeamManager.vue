<template>
  <div>
    <!-- Sélecteur de manager -->
    <ManagerSelector @manager-selected="setSelectedManager" />

    <div v-if="selectedManager" class="bg-white p-6 rounded-lg shadow-md mb-6">
      <h2 class="text-xl font-semibold mb-4">Informations du manager</h2>
      <p><strong>Nom:</strong> {{ selectedManager.username }}</p>
      <p><strong>ID:</strong> {{ selectedManager.id }}</p>
      <p><strong>Email:</strong> {{ selectedManager.email }}</p>
    </div>
    <p v-else class="text-gray-600">Veuillez sélectionner un manager pour voir ses informations.</p>

    <!-- Sélection d'équipe -->
    <EmployeeSelector v-if="selectedManager" @employee-selected="addEmployeeToTeam" />

    <!-- Liste des employés de l'équipe -->
    <div v-if="team.length > 0" class="mt-6">
      <h3 class="text-lg font-semibold mb-4">Équipe de travail</h3>
      <ul>
        <li v-for="employee in team" :key="employee.id" class="flex justify-between items-center bg-gray-100 p-4 mb-2 rounded-lg">
          <span>{{ employee.username }} (ID: {{ employee.id }})</span>
          <button @click="removeEmployeeFromTeam(employee)" class="text-red-600">Supprimer</button>
        </li>
      </ul>
    </div>
    <p v-else class="text-gray-600">Aucun employé dans l'équipe.</p>

    <!-- Composants pour gérer le temps de travail -->
    <div v-if="selectedManager && team.length > 0" class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
      <WorkingTimeChart :userIds="team.map(e => e.id)" />
      <WorkingTimeSelector :userIds="team.map(e => e.id)" />
      <ClockingHistory :userIds="team.map(e => e.id)" />
      <WorkingHoursChart :userIds="team.map(e => e.id)" />
      <TeamPerformance :userIds="team.map(e => e.id)" />
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';
import ManagerSelector from './ManagerSelector.vue';
import EmployeeSelector from './EmployeeSelector.vue';

export default {
  name: 'TeamManager',
  components: {
    ManagerSelector,
    EmployeeSelector,
  },
  setup() {
    const selectedManager = ref(null);
    const team = ref([]);

    const setSelectedManager = (manager) => {
      selectedManager.value = manager;
      team.value = []; // Réinitialise l'équipe lorsque le manager est sélectionné
      console.log('Selected manager:', manager);
    };

    const addEmployeeToTeam = (employee) => {
      if (!team.value.some(e => e.id === employee.id)) {
        team.value.push(employee);
        console.log('Added employee to team:', employee);
      }
    };

    const removeEmployeeFromTeam = (employee) => {
      team.value = team.value.filter(e => e.id !== employee.id);
      console.log('Removed employee from team:', employee);
    };

    return {
      selectedManager,
      team,
      setSelectedManager,
      addEmployeeToTeam,
      removeEmployeeFromTeam
    };
  }
};
</script>

<style scoped>
.bg-white {
  background-color: #ffffff;
}
.p-6 {
  padding: 1.5rem;
}
.rounded-lg {
  border-radius: 0.5rem;
}
.shadow-md {
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
.mb-6 {
  margin-bottom: 1.5rem;
}

.text-xl {
  font-size: 1.25rem;
  font-weight: 700;
}
.font-semibold {
  font-weight: 600;
}
.text-gray-600 {
  color: #718096;
}
.text-red-600 {
  color: #e53e3e;
}

.mt-6 {
  margin-top: 1.5rem;
}
.text-lg {
  font-size: 1.125rem;
}
.flex {
  display: flex;
}
.justify-between {
  justify-content: space-between;
}
.items-center {
  align-items: center;
}
.bg-gray-100 {
  background-color: #f7fafc;
}
.p-4 {
  padding: 1rem;
}
.mb-2 {
  margin-bottom: 0.5rem;
}

button {
  cursor: pointer;
  border: none;
  background: none;
  font-size: 0.875rem;
  font-weight: 500;
  transition: color 0.3s;
}
button:hover {
  color: #c53030; 
}
</style>
