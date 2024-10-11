<template>
  <div>
    <h2>Chart Manager</h2>

    <div class="chart-container">
      <canvas id="barChart"></canvas>
    </div>

    <div class="chart-container">
      <canvas id="lineChart"></canvas>
    </div>

    <div class="chart-container">
      <canvas id="pieChart"></canvas>
    </div>
  </div>
</template>

<script>
import { onMounted, ref } from 'vue';
import axios from 'axios';
import Chart from 'chart.js/auto';

export default {
  name: 'ChartManager',
  props: ['userId'],
  setup(props) {
    const chartData = ref(null);

    const fetchChartData = async () => {
      try {
        const response = await axios.get(`/api/chartManager/${props.userId}`);
        chartData.value = response.data;
        renderCharts(chartData.value);
      } catch (error) {
        console.error("Error fetching chart data", error);
      }
    };

    const renderCharts = (data) => {
      
      const ctxBar = document.getElementById('barChart').getContext('2d');
      new Chart(ctxBar, {
        type: 'bar',
        data: {
          labels: data.bar.labels,
          datasets: [{
            label: 'Bar Dataset',
            data: data.bar.data,
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
          }],
        },
        options: {
          responsive: true,
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });

      
      const ctxLine = document.getElementById('lineChart').getContext('2d');
      new Chart(ctxLine, {
        type: 'line',
        data: {
          labels: data.line.labels,
          datasets: [{
            label: 'Line Dataset',
            data: data.line.data,
            fill: false,
            borderColor: 'rgba(75, 192, 192, 1)',
            tension: 0.1
          }],
        },
      });

      
      const ctxPie = document.getElementById('pieChart').getContext('2d');
      new Chart(ctxPie, {
        type: 'pie',
        data: {
          labels: data.pie.labels,
          datasets: [{
            data: data.pie.data,
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
            ],
            borderColor: [
              'rgba(255, 99, 132, 1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
            ],
            borderWidth: 1,
          }],
        },
      });
    };

    onMounted(fetchChartData);

    return {
      fetchChartData,
    };
  }
};
</script>

<style scoped>
.chart-container {
  width: 100%;
  max-width: 600px;
  margin: 20px auto;
}

h2 {
  text-align: center;
  color: #333;
  font-size: 24px;
  margin-bottom: 20px;
}
</style>
