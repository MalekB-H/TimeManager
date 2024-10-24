<template>
  <div class="bg-white p-6 rounded-lg shadow-md">
    <h2 class="text-xl font-semibold mb-4">Heures de travail</h2>
    <div class="mb-4">
      <label for="period-select" class="block text-sm font-medium text-gray-700 mb-2">Sélectionner une Période</label>
      <select
        id="period-select"
        v-model="selectedPeriod"
        @change="fetchData"
        class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"
      >
        <option value="week">Semaine</option>
        <option value="month">Mois</option>
        <option value="year">Année</option>
      </select>
    </div>
    <div class="chart-container">
      <Bar v-if="chartData" :data="chartData" :options="chartOptions" />
    </div>
    <p v-if="!chartData">Pas de données valides</p>
  </div>
</template>

<script>
import { ref, watch, onMounted } from 'vue';
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';
import api from '../services/api';

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);

export default {
  name: 'WorkingHoursChart',
  components: { Bar },
  props: ['userId'],
  setup(props) {
    const chartData = ref(null);
    const chartOptions = ref({
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: true,
          position: 'top',
        },
      },
      scales: {
        y: {
          beginAtZero: true,
          title: {
            display: true,
            text: 'Heures'
          }
        }
      }
    });

    const selectedPeriod = ref('week');

const fetchData = async () => {
  if (!props.userId) return;

  try {
    const end = new Date();
    let start = new Date();
    let labels = [];

    switch (selectedPeriod.value) {
      case 'week':
        start.setDate(end.getDate() - 7);
        labels = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
        break;
      case 'month':
        start.setMonth(end.getMonth() - 1);
        labels = Array.from({ length: 31 }, (_, i) => i + 1);
        break;
      case 'year':
        start.setFullYear(end.getFullYear() - 1);
        labels = ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Jun', 'Jul', 'Aoû', 'Sep', 'Oct', 'Nov', 'Déc'];
        break;
    }

    const workingTimesResponse = await api.getWorkingTimes(props.userId, start.toISOString(), end.toISOString());
    console.log('Réponse des heures de travail:', workingTimesResponse);

    // Assurez-vous que workingTimes est toujours un tableau
    let workingTimes = [];
    if (Array.isArray(workingTimesResponse.data?.data)) {
      workingTimes = workingTimesResponse.data.data;
    } else if (workingTimesResponse.data?.data) {
      // Si c'est un objet unique, le mettre dans un tableau
      workingTimes = [workingTimesResponse.data.data];
    }

    const hoursWorked = labels.map(() => 0);

    workingTimes.forEach(time => {
      const startTime = new Date(time.start_time);
      const endTime = time.end_time ? new Date(time.end_time) : new Date();
      const totalSeconds = (endTime - startTime) / 1000;
      const hours = totalSeconds / 3600;

      let index;
      switch (selectedPeriod.value) {
        case 'week':
          index = startTime.getDay() - 1; 
          if (index === -1) index = 6; 
          break;
        case 'month':
          index = startTime.getDate() - 1;
          break;
        case 'year':
          index = startTime.getMonth();
          break;
      }

      if (index >= 0 && index < hoursWorked.length) {
        hoursWorked[index] += hours;
      }
    });

    chartData.value = {
      labels,
      datasets: [{
        label: 'Heures travaillées',
        data: hoursWorked,
        backgroundColor: 'rgba(75, 192, 192, 0.6)'
      }]
    };

    console.log('Données du graphique:', chartData.value);

  } catch (error) {
    console.error('Erreur lors de la récupération des heures de travail:', error);
  }
};

    watch(() => props.userId, fetchData);
    watch(() => selectedPeriod.value, fetchData);
    onMounted(fetchData);

    return { chartData, chartOptions, selectedPeriod, fetchData };
  }
};
</script>

<style scoped>
.chart-container {
  position: relative;
  height: 300px;
  width: 100%;
}
</style>