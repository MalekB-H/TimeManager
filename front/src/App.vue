<template>
  <div id="app" class="bg-gray-100 min-h-screen">
    <header class="bg-blue-600 text-white p-4 shadow-md">
      <h1 class="text-2xl font-bold">Dashboard des employées</h1>
    </header>
    <nav class="bg-white shadow-md">
      <div class="container mx-auto px-4">
        <ul class="flex space-x-4 py-3">
          <li><router-link to="/" class="text-blue-600 hover:text-blue-800">Dashboard</router-link></li>
          <li><router-link to="/working-times" class="text-blue-600 hover:text-blue-800">Temps de travail</router-link></li>
          <li><router-link to="/clock-manager" class="text-blue-600 hover:text-blue-800">Gestion du pointeur</router-link></li>
        </ul>
      </div>
    </nav>
    <main class="container mx-auto px-4 py-8">
      <router-view />
    </main>
  </div>
</template>

<script>
export default {
  name: 'App'
};
</script>