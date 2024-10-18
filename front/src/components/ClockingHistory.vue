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

    <!-- Boutons pour enregistrer les temps de travail -->
    <div class="mt-4">
      <button @click="recordStartTime" class="bg-blue-500 text-white px-4 py-2 rounded mr-2">Enregistrer le début du travail</button>
      <button @click="recordEndTime" class="bg-red-500 text-white px-4 py-2 rounded">Enregistrer la fin du travail</button>
    </div>

    <!-- Affichage des heures d'arrivée et de départ -->
    <div v-if="startTime || endTime" class="mt-4">
      <p v-if="startTime" class="text-green-600">Heure d'arrivée: {{ formatDate(startTime) }}</p>
      <p v-if="endTime" class="text-red-600">Heure de départ: {{ formatDate(endTime) }}</p>
    </div>
  </div>
</template>

<script>
import { ref, onMounted, watch } from 'vue';
import api from '../services/api';

export default {
  name: 'ClockingHistory',
  props: ['userId'],
  emits: ['refreshWorkingTime'],
  setup(props, { emit }) {
    const recentClockings = ref([]);
    const startTime = ref(null);
    const endTime = ref(null);

    const fetchClockings = async () => {
      if (!props.userId) return;

      try {
        const response = await api.getClockings(props.userId);
        console.log('Réponse de pointage', response);

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

    const recordStartTime = async () => {
      if (!props.userId) return;

      try {
        await api.startClocking(props.userId);
        console.log('Temps de début enregistré:', startTime.value);
        emit('refreshWorkingTime'); 
      } catch (error) {
        console.error('Erreur lors de l\'enregistrement du début:', error);
      }
    };

    const recordEndTime = async () => {
      if (!props.userId || !startTime.value) return;

      endTime.value = new Date();
      try {
        await api.endClocking(props.userId);
        console.log('Temps de fin enregistré:', endTime.value);
        emit('refreshWorkingTime'); 
      } catch (error) {
        console.error('Erreur lors de l\'enregistrement de la fin:', error);
      }
    };

    onMounted(fetchClockings); 
    watch(() => props.userId, fetchClockings);

    return { 
      recentClockings, 
      formatDate, 
      recordStartTime, 
      recordEndTime,
      startTime,
      endTime 
    };
  }
};
</script>
