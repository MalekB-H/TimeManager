<template>
  <div>
    <EmployeeSelector @employee-selected="setSelectedEmployee" />
    
    <div v-if="selectedEmployee" class="bg-white p-6 rounded-lg shadow-md mb-6">
      <h2 class="text-xl font-semibold mb-4">Information de l'employée </h2>
      <p><strong>Nom:</strong> {{ selectedEmployee.username }}</p>
      <p><strong>ID:</strong> {{ selectedEmployee.id }}</p>
      <p><strong>Email:</strong> {{ selectedEmployee.email }}</p>
    </div>
    <p v-else class="text-gray-600">Sélectionner un employé pour voir ses informations</p>

    <div v-if="selectedEmployee" class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <WorkingTimeChart :userId="selectedEmployee.id" />
      <WorkingTimeSelector :userId="selectedEmployee.id" />
      <ClockingHistory :userId="selectedEmployee.id" />
      <WorkingHoursChart :userId="selectedEmployee.id" />
      <UserPerformance :userId="selectedEmployee.id" />
    </div>
  </div>
</template>

<script>
  import { ref } from 'vue';
  import EmployeeSelector from './EmployeeSelector.vue';
  import WorkingTimeChart from './WorkingTimeChart.vue';
  import WorkingTimeSelector from './WorkingTimeSelector.vue';
  import ClockingHistory from './ClockingHistory.vue';
  import WorkingHoursChart from './WorkingHoursChart.vue';
  import UserPerformance from './UserPerformance.vue';

  export default {
    name: 'DashboardView',
    components: {
      EmployeeSelector,
      WorkingTimeChart,
      WorkingTimeSelector,
      ClockingHistory,
      WorkingHoursChart,
      UserPerformance
    },
    setup() {
      const selectedEmployee = ref(null);

      const setSelectedEmployee = (employee) => {
        selectedEmployee.value = employee;
        console.log('Employé sélectionné:', employee); // Pour le debug
      };

      return { selectedEmployee, setSelectedEmployee };
    }
  };
</script>