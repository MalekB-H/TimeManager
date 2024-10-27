<template>
  <div>
    <!-- Sélecteur de Manager -->
    <ManagerSelector @manager-selected="setSelectedManager" :managers="managers" />

    <!-- Sélecteur d'Employé -->
    <EmployeeSelector @employee-selected="setSelectedEmployee" />

    <!-- Informations sur l'employé sélectionné -->
    <div v-if="selectedEmployee" class="bg-white p-6 rounded-lg shadow-md mb-6">
      <h2 class="text-xl font-semibold mb-4">Information de l'employé</h2>
      <p><strong>Nom:</strong> {{ selectedEmployee.username }}</p>
      <p><strong>ID:</strong> {{ selectedEmployee.id }}</p>
      <p><strong>Email:</strong> {{ selectedEmployee.email }}</p>
      <p><strong>Role:</strong> {{ selectedEmployee.role }}</p>
    </div>

    <!-- Informations sur le manager sélectionné -->
    <div v-if="selectedManager" class="bg-white p-6 rounded-lg shadow-md mb-6">
      <h2 class="text-xl font-semibold mb-4">Information du manager</h2>
      <p><strong>Nom:</strong> {{ selectedManager.username }}</p>
      <p><strong>ID:</strong> {{ selectedManager.id }}</p>
      <p><strong>Email:</strong> {{ selectedManager.email }}</p>
    </div>

    <p v-if="!selectedEmployee && !selectedManager" class="text-gray-600">
      Veuillez sélectionner un manager ou un employé pour voir les informations.
    </p>

    <!-- Composants associés à l'employé sélectionné -->
    <div v-if="selectedEmployee" class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <WorkingTimeChart v-if="selectedEmployee.id" :userId="selectedEmployee.id" />
      <WorkingTimeSelector v-if="selectedEmployee.id" :userId="selectedEmployee.id" />
      <ClockingHistory :userId="selectedEmployee.id" />
      <WorkingHoursChart :userId="selectedEmployee.id" />
      <UserPerformance :userId="selectedEmployee.id" />
    </div>

    <!-- Affichage des composants associés au manager -->
    <div v-if="selectedManager" class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <PromouvoirEmploye v-if="selectedManager.id" @promote-employee="handlePromotion" />
      <TeamManager :userId="selectedManager.id" :managers="managersList" @team-created="handleTeamCreated" /> <!-- Ajout du composant TeamManager -->
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import api from '../services/api';
import EmployeeSelector from './EmployeeSelector.vue';
import ManagerSelector from './ManagerSelector.vue';
import WorkingTimeChart from './WorkingTimeChart.vue';
import WorkingTimeSelector from './WorkingTimeSelector.vue';
import ClockingHistory from './ClockingHistory.vue';
import WorkingHoursChart from './WorkingHoursChart.vue';
import UserPerformance from './UserPerformance.vue';
import PromouvoirEmploye from './PromouvoirEmploye.vue';
import TeamManager from './TeamManager.vue'; 

export default {
  name: 'DashboardView',
  components: {
    EmployeeSelector,
    ManagerSelector,
    WorkingTimeChart,
    WorkingTimeSelector,
    ClockingHistory,
    WorkingHoursChart,
    UserPerformance,
    PromouvoirEmploye,
    TeamManager,
  },
  setup() {
    const selectedEmployee = ref(null);
    const selectedManager = ref(null);
    const managersList = ref([]); 

    const loadManagers = async () => {
      try {
        const response = await api.searchUsers();
        if (response.data && Array.isArray(response.data.data)) {
          // Filtrer pour ne garder que les managers
          managersList.value = response.data.data.filter(user => user.role === 'manager');
        }
      } catch (error) {
        console.error('Erreur lors du chargement des managers:', error);
      }
    };

    const setSelectedEmployee = (employee) => {
      selectedEmployee.value = employee;
      console.log('Selected employee:', employee);
    };

    const setSelectedManager = (manager) => {
      selectedManager.value = manager; 
      console.log('Selected manager:', manager);
    };

    const handlePromotion = (promotedEmployee) => {
      if (selectedEmployee.value && selectedEmployee.value.id === promotedEmployee.id) {
        selectedEmployee.value.isManager = true;
        console.log(`L'employé ${selectedEmployee.value.username} a été promu au statut de manager.`);
        
        managersList.value.push({
          id: promotedEmployee.id,
          username: promotedEmployee.username, 
          email: promotedEmployee.email,
          role: 'manager'
        });
      }
    };

    const handleTeamCreated = (team) => {
      console.log('Nouvelle équipe créée:', team);
    };

    onMounted(loadManagers);

    return { 
      selectedEmployee, 
      selectedManager, 
      setSelectedEmployee, 
      setSelectedManager,
      handlePromotion,
      handleTeamCreated,
      managersList
    };
  },
};
</script>
