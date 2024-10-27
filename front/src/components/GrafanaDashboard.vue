<template>
    <div class="grafana-dashboard">
      <div v-if="isAdmin" class="container mx-auto p-4">
        <h1 class="text-2xl font-bold mb-6">Dashboard d'administration</h1>
        
        <!-- Panneau de statistiques rapides -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
          <div v-for="(stat, index) in quickStats" 
               :key="index" 
               class="bg-white rounded-lg shadow p-4">
            <h3 class="text-gray-600 text-sm">{{ stat.label }}</h3>
            <p class="text-2xl font-semibold">{{ stat.value }}</p>
          </div>
        </div>
  
        <!-- Iframe Grafana -->
        <div class="bg-white rounded-lg shadow p-4">
          <iframe
            :src="grafanaUrl"
            width="100%"
            height="800"
            frameborder="0"
            class="grafana-iframe"
          ></iframe>
        </div>
      </div>
      <div v-else class="text-center p-8">
        <h2 class="text-xl text-red-600">Accès non autorisé</h2>
        <p class="text-gray-600 mt-2">Vous devez être administrateur pour accéder à cette page.</p>
      </div>
    </div>
</template>
  
<script>
    import { ref, onMounted } from 'vue';
    import api from '../services/api';
    
    export default {
        name: 'GrafanaDashboard',
        setup() {
        const isAdmin = ref(false);
        const quickStats = ref([
            { label: 'Utilisateurs Total', value: '...' },
            { label: 'Connexions Aujourd\'hui', value: '...' },
            { label: 'Pointages Actifs', value: '...' }
        ]);
    
        // L'URL de votre dashboard Grafana avec authentification intégrée
        const grafanaUrl = 'http://localhost:3000/d/your-dashboard-id/your-dashboard-name?orgId=1&kiosk';
    
        onMounted(async () => {
            try {
            // Vérifier le rôle de l'utilisateur
            const user = JSON.parse(localStorage.getItem('user'));
            isAdmin.value = user?.role === 'admin';
    
            // Si admin, charger les statistiques rapides
            if (isAdmin.value) {
                await fetchQuickStats();
            }
            } catch (error) {
            console.error('Erreur lors du chargement du dashboard:', error);
            }
        });
    
        const fetchQuickStats = async () => {
            try {
            // Vous devrez implémenter ces endpoints dans votre API
            const [usersCount, todayLogins, activeClockings] = await Promise.all([
                api.getUsersCount(),
                api.getTodayLoginCount(),
                api.getActiveClockingsCount()
            ]);
    
            quickStats.value = [
                { label: 'Utilisateurs Total', value: usersCount },
                { label: 'Connexions Aujourd\'hui', value: todayLogins },
                { label: 'Pointages Actifs', value: activeClockings }
            ];
            } catch (error) {
            console.error('Erreur lors du chargement des statistiques:', error);
            }
        };
    
        return {
            isAdmin,
            quickStats,
            grafanaUrl
        };
        }
    };
</script>
  
<style scoped>
  .grafana-iframe {
    min-height: 800px;
  }
</style>