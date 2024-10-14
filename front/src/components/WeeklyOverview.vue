<template>
    <div class="bg-white p-6 rounded-lg shadow-md">
      <h2 class="text-xl font-semibold mb-4">Résumé de la semaine</h2>
      <Line :chart-data="chartData" :chart-options="chartOptions" />
    </div>
</template>
  
<script>
  import { Line } from 'vue-chartjs';
  import { Chart as ChartJS, Title, Tooltip, Legend, LineElement, LinearScale, PointElement, CategoryScale } from 'chart.js';
  
  ChartJS.register(Title, Tooltip, Legend, LineElement, LinearScale, PointElement, CategoryScale);
  
  export default {
    name: 'WeeklyOverview',
    components: { Line },
    data() {
      return {
        chartData: {
          labels: ['Semaine 1', 'Semaine 2', 'Semaine 3', 'Semaine 4'],
          datasets: [{
            label: 'Heures totales',
            data: [38, 42, 35, 40],
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1
          }]
        },
        chartOptions: {
          responsive: true,
          maintainAspectRatio: false
        }
      };
    }
  };
</script>