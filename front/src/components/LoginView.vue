<template>
    <div class="max-w-md mx-auto mt-10 bg-white p-8 border rounded-lg shadow-lg">
      <h2 class="text-2xl font-bold mb-6 text-center">Connexion</h2>
      <form @submit.prevent="handleLogin">
        <div class="mb-4">
          <label for="email" class="block mb-2">Email</label>
          <input type="email" id="email" v-model="email" required class="w-full px-3 py-2 border rounded">
        </div>
        <div class="mb-6">
          <label for="password" class="block mb-2">Mot de passe</label>
          <input type="password" id="password" v-model="password" required class="w-full px-3 py-2 border rounded">
        </div>
        <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">Se connecter</button>
      </form>
      <p class="mt-4 text-center">
        Pas encore de compte ? <router-link to="/register" class="text-blue-600">S'inscrire</router-link>
      </p>
    </div>
  </template>
  
  <script>
  import AuthService from '@/services/auth.service';
  
  export default {
    name: 'LoginView',
    data() {
      return {
        email: '',
        password: ''
      };
    },
    methods: {
      async handleLogin() {
        try {
          await AuthService.login(this.email, this.password);
          this.$router.push('/');
        } catch (error) {
          console.error('Échec de la connexion', error);
          // Gérer l'erreur (par exemple, afficher un message à l'utilisateur)
        }
      }
    }
  };
  </script>