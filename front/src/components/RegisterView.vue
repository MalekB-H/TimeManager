<template>
    <div class="max-w-md mx-auto mt-10 bg-white p-8 border rounded-lg shadow-lg">
      <h2 class="text-2xl font-bold mb-6 text-center">Inscription</h2>
      <form @submit.prevent="handleRegister">
        <div class="mb-4">
          <label for="username" class="block mb-2">Nom d'utilisateur</label>
          <input type="text" id="username" v-model="username" required class="w-full px-3 py-2 border rounded">
        </div>
        <div class="mb-4">
          <label for="email" class="block mb-2">Email</label>
          <input type="email" id="email" v-model="email" required class="w-full px-3 py-2 border rounded">
        </div>
        <div class="mb-6">
          <label for="password" class="block mb-2">Mot de passe</label>
          <input type="password" id="password" v-model="password" required class="w-full px-3 py-2 border rounded">
        </div>
        <button type="submit" class="w-full bg-green-600 text-white py-2 rounded hover:bg-green-700">S'inscrire</button>
      </form>
      <p class="mt-4 text-center">
        Déjà un compte ? <router-link to="/login" class="text-blue-600">Se connecter</router-link>
      </p>
    </div>
  </template>
  
  <script>
  import AuthService from '@/services/auth.service';
  
  export default {
    name: 'RegisterView',
    data() {
      return {
        username: '',
        email: '',
        password: ''
      };
    },
    methods: {
      async handleRegister() {
        try {
          await AuthService.register(this.username, this.email, this.password);
          this.$router.push('/login');
        } catch (error) {
          console.error('Échec de l\'inscription', error);
          // Gérer l'erreur (par exemple, afficher un message à l'utilisateur)
        }
      }
    }
  };
  </script>