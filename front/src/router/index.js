import { createRouter, createWebHistory } from 'vue-router';
import DashboardView from '../components/DashboardView.vue';
import WorkingTimes from '../components/WorkingTimes.vue';
import ClockManager from '../components/ClockManager.vue';
import Login from '../components/LoginView.vue';
import Register from '../components/RegisterView.vue';
import GrafanaDashboard from '../components/GrafanaDashboard.vue';

const routes = [
  { path: '/', component: DashboardView, meta: { requiresAuth: true } },
  { path: '/working-times', component: WorkingTimes, meta: { requiresAuth: true } },
  { path: '/clock-manager', component: ClockManager, meta: { requiresAuth: true } },
  { path: '/login', component: Login },
  { path: '/register', component: Register },
  { path: '/admin/metrics', component: GrafanaDashboard, meta: { 
      requiresAuth: true,
      requiresAdmin: true 
    } 
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

router.beforeEach((to, from, next) => {
  const publicPages = ['/login', '/register'];
  const authRequired = !publicPages.includes(to.path);
  const loggedIn = localStorage.getItem('user');
  const user = loggedIn ? JSON.parse(localStorage.getItem('user')) : null;

  if (authRequired && !loggedIn) {
    next('/login');
  } else if (to.meta.requiresAdmin && user?.role !== 'admin') {
    next('/'); // Redirection si l'utilisateur n'est pas admin
  } else {
    next();
  }
});

export default router;