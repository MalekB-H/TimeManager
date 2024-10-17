<template>
    <div class="bg-white p-6 rounded-lg shadow-md">
      <h2 class="text-xl font-semibold mb-4">Répartition du temps de travail</h2>
      <DateRangeSelector @date-range-changed="updateDateRange" />
      <div class="chart-container">
        <Bar v-if="chartData" :data="chartData" :options="chartOptions" />
      </div>
      <p v-if="!chartData">Pas de données</p>
    </div>
</template>
  
<script>
  import { ref, watch, onMounted } from 'vue';
  import { Bar } from 'vue-chartjs';
  import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';
  import api from '../services/api';
  import DateRangeSelector from './DateRangeSelector.vue';
  
  ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);
  
  export default {
    name: 'WorkingTimeChart',
    components: { Bar, DateRangeSelector },
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
              text: 'Heure'
            }
          }
        }
      });
  
      const startDate = ref(new Date(new Date().setDate(new Date().getDate() - 7)).toISOString());
      const endDate = ref(new Date().toISOString());
  
      const fetchData = async () => {
        if (!props.userId) return;
  
        try {
          const response = await api.getWorkingTimes(props.userId, startDate.value, endDate.value);
          console.log('Working times response:', response);
  
          let workingTimes = response.data.data;
  
          const days = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
          const hoursWorked = Array(7).fill(0);
  
          workingTimes.forEach(wt => {
            const startDate = new Date(wt.start_time);
            const endDate = new Date(wt.end_time);
            const dayIndex = startDate.getDay();
            const hours = (endDate - startDate) / (1000 * 60 * 60);
            hoursWorked[dayIndex] += hours;
          });
  
          chartData.value = {
            labels: days,
            datasets: [{
              label: 'Heures travaillées',
              data: hoursWorked,
              backgroundColor: 'rgba(54, 162, 235, 0.6)'
            }]
          };
        } catch (error) {
          console.error('Error fetching working times:', error);
        }
      };
  
      const updateDateRange = (range) => {
        startDate.value = new Date(range.startDate).toISOString();
        endDate.value = new Date(range.endDate).toISOString();
        fetchData();
      };
  
      watch(() => props.userId, fetchData);
      onMounted(fetchData);
  
      return { chartData, chartOptions, updateDateRange };
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