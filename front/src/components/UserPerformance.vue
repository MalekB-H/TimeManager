<template>
  <div class="bg-white p-6 rounded-lg shadow-md">
    <h2 class="text-xl font-semibold mb-4">Performance de l'employé</h2>
    <div class="flex items-center justify-between mb-2">
      <span>Productivité</span>
      <div class="w-full bg-gray-200 rounded-full h-2.5">
        <div class="w-full bg-blue-600 h-2.5 rounded-full" :style="{ width: productivityPercentage + '%' }"></div>
      </div>
    </div>
    <div class="flex items-center justify-between">
      <span>Heures travaillées</span>
      <div class="w-full bg-gray-200 rounded-full h-2.5">
        <div class="w-full bg-green-500 h-2.5 rounded-full" :style="{ width: hoursWorkedPercentage + '%' }"></div>
      </div>
    </div>
    <div class="mt-4">
      <p>Total des heures travaillées: {{ totalHoursWorked.toFixed(2) }}</p>
      <p>Moyenne d'heures par jour: {{ averageHoursPerDay.toFixed(2) }}</p>
    </div>
  </div>
</template>
  
<script>
  import { ref, watch, onMounted } from 'vue';
  import api from '../services/api';
  
  export default {
    name: 'UserPerformance',
    props: ['userId'],
    setup(props) {
      const productivityPercentage = ref(0);
      const hoursWorkedPercentage = ref(0);
      const totalHoursWorked = ref(0);
      const averageHoursPerDay = ref(0);
  
      const fetchPerformanceData = async () => {
        if (!props.userId) return;
  
        try {
          const endDate = new Date();
          const startDate = new Date();
          startDate.setDate(endDate.getDate() - 30); // Sur les 30 derniers jours
  
          const response = await api.getWorkingTimes(props.userId, startDate.toISOString(), endDate.toISOString());
          const workingTimes = response.data.data;
  
          // Calcul du total d'heure de travail
          totalHoursWorked.value = workingTimes.reduce((total, wt) => {
            const start = new Date(wt.start_time);
            const end = new Date(wt.end_time);
            return total + (end - start) / (1000 * 60 * 60);
          }, 0);
  
          // Calcul du nombre d'heure moyen
          const daysWorked = new Set(workingTimes.map(wt => new Date(wt.start_time).toDateString())).size;
          averageHoursPerDay.value = totalHoursWorked.value / daysWorked;
  
          // Calcul des pourcentages
          const expectedHoursPerDay = 8; // 8 heures de travail par jour
          const expectedTotalHours = daysWorked * expectedHoursPerDay;
          
          productivityPercentage.value = Math.min((totalHoursWorked.value / expectedTotalHours) * 100, 100);
          hoursWorkedPercentage.value = Math.min((averageHoursPerDay.value / expectedHoursPerDay) * 100, 100);
  
        } catch (error) {
          console.error('Error fetching performance data:', error);
        }
      };
  
      watch(() => props.userId, fetchPerformanceData);
      onMounted(fetchPerformanceData);
  
      return {
        productivityPercentage,
        hoursWorkedPercentage,
        totalHoursWorked,
        averageHoursPerDay
      };
    }
  };
</script>