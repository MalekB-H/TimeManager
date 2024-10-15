import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './assets/main.css'
import axios from 'axios'

const app = createApp(App);

// Configurer axios pour inclure le token JWT dans les en-têtes
axios.interceptors.request.use(
  (config) => {
    const user = JSON.parse(localStorage.getItem('user'));
    if (user && user.jwt) {
      config.headers['Authorization'] = 'Bearer ' + user.jwt;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

app.use(router);
app.mount('#app');