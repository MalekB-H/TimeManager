<template>
  <div class="bg-white p-6 rounded-lg shadow-md">
    <h2 class="text-xl font-semibold mb-4">Répartition du temps de travail</h2>
    <DateRangeSelector @date-range-changed="updateDateRange" />
    <div class="chart-container mt-4">
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
            text: 'Heures'
          }
        }
      }
    });

    const startDate = ref(new Date(new Date().setDate(new Date().getDate() - 6)).toISOString());
    const endDate = ref(new Date().toISOString());

    const fetchWorkingTimes = async () => {
      if (!props.userId) return;

      try {
        const response = await api.getWorkingTimes(props.userId, startDate.value, endDate.value);
        const workingTimes = response.data.data;

        const labels = [];
        const hoursWorked = Array(7).fill(0);
        const currentDate = new Date(startDate.value);

        for (let i = 0; i < 7; i++) {
          labels.push(currentDate.toLocaleDateString());
          currentDate.setDate(currentDate.getDate() + 1);
        }

        workingTimes.forEach(wt => {
          const start = new Date(wt.start_time);
          const end = new Date(wt.end_time);
          if (end > start) {
            const hours = (end - start) / (1000 * 60 * 60);
            const dayIndex = Math.floor((start - new Date(startDate.value)) / (1000 * 60 * 60 * 24));
            if (dayIndex >= 0 && dayIndex < 7) {
              hoursWorked[dayIndex] += hours;
            }
          }
        });

        chartData.value = {
          labels: labels, 
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

    const fetchClockings = async () => {
      if (!props.userId) return;

      try {
        const response = await api.getClockings(props.userId);
        console.log('Clockings response:', response);
      } catch (error) {
        console.error('Error fetching clockings:', error);
      }
    };

    const updateDateRange = (range) => {
      startDate.value = new Date(range.startDate).toISOString();
      endDate.value = new Date(range.endDate).toISOString();
      fetchWorkingTimes();
      fetchClockings();
    };

    watch(() => props.userId, () => {
      fetchWorkingTimes();
      fetchClockings();
    });

    onMounted(() => {
      fetchWorkingTimes();
      fetchClockings();
    });

    return { chartData, chartOptions, updateDateRange, fetchWorkingTimes, fetchClockings };
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
