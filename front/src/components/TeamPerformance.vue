<template>
    <div class="team-performance">
      <h2 class="title">Performance de l'équipe</h2>
      <div v-if="performanceData" class="performance-details">
        <p><strong>Score de performance :</strong> {{ performanceData.score }}</p>
        <p><strong>Projets complétés :</strong> {{ performanceData.completedProjects }}</p>
        <p><strong>Heures travaillées :</strong> {{ performanceData.hoursWorked }}</p>
      </div>
      <p v-else class="no-data">Aucune donnée de performance disponible.</p>
    </div>
  </template>
  
  <script>
  export default {
    name: 'TeamPerformance',
    props: {
      teamId: {
        type: Number,
        required: true,
      },
    },
    data() {
      return {
        performanceData: null,
      };
    },
    mounted() {
      this.fetchPerformanceData();
    },
    methods: {
      fetchPerformanceData() {
        setTimeout(() => {
          this.performanceData = {
            score: 85,
            completedProjects: 12,
            hoursWorked: 1200,
          };
        }, 1000);
      },
    },
  };
  </script>
  
  <style scoped>
  .team-performance {
    background-color: #fff;
    padding: 1.5rem;
    border-radius: 0.5rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin-bottom: 1.5rem;
  }
  
  .title {
    font-size: 1.25rem;
    font-weight: 600;
    margin-bottom: 1rem;
    color: #2c3e50;
  }
  
  .performance-details p {
    margin-bottom: 0.5rem;
    color: #555;
  }
  
  .no-data {
    color: #888;
  }
  </style>
  