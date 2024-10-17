import { createRouter, createWebHistory } from 'vue-router';
import DashboardView from '../components/DashboardView.vue';
import WorkingTimes from '../components/WorkingTimes.vue';
import ClockManager from '../components/ClockManager.vue';
import Login from '../components/LoginView.vue';
import Register from '../components/RegisterView.vue';

const routes = [
  { path: '/', component: DashboardView, meta: { requiresAuth: true } },
  { path: '/working-times', component: WorkingTimes, meta: { requiresAuth: true } },
  { path: '/clock-manager', component: ClockManager, meta: { requiresAuth: true } },
  { path: '/login', component: Login },
  { path: '/register', component: Register }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

router.beforeEach((to, from, next) => {
  const publicPages = ['/login', '/register'];
  const authRequired = !publicPages.includes(to.path);
  const loggedIn = localStorage.getItem('user');

  if (authRequired && !loggedIn) {
    next('/login');
  } else {
    next();
  }
});

export default router;