<template>
    <div class="bg-white p-6 rounded-lg shadow-md">
      <h2 class="text-xl font-semibold mb-4">Historique de pointage</h2>
      <ul v-if="recentClockings.length" class="space-y-2">
        <li v-for="clocking in recentClockings" :key="clocking.id" class="flex justify-between items-center">
          <span>{{ clocking.status }}</span>
          <span class="text-gray-600">{{ formatDate(clocking.time) }}</span>
        </li>
      </ul>
      <p v-else>Pas d'entrée valable</p>
    </div>
</template>
  
<script>
  import { ref, onMounted, watch } from 'vue';
  import api from '../services/api';
  
  export default {
    name: 'ClockingHistory',
    props: ['userId'],
    setup(props) {
      const recentClockings = ref([]);
  
      const fetchClockings = async () => {
        if (!props.userId) return;
  
        try {
          const response = await api.getClockings(props.userId);
          console.log('Réponse de pointage', response); // POur le debug
  
          if (response.data && response.data.data) {
            recentClockings.value = response.data.data.slice(0, 5);
          } else if (Array.isArray(response.data)) {
            recentClockings.value = response.data.slice(0, 5);
          } else {
            console.error('Pas la bonne entrée de données:', response.data);
            recentClockings.value = [];
          }
        } catch (error) {
          console.error('Erreur du fetch:', error);
          recentClockings.value = [];
        }
      };
  
      const formatDate = (dateString) => {
        return new Date(dateString).toLocaleString();
      };
  
      onMounted(fetchClockings);
      watch(() => props.userId, fetchClockings);
  
      return { recentClockings, formatDate };
    }
  };
</script>