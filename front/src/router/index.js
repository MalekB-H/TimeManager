import { createRouter, createWebHistory } from 'vue-router';
import DashboardView from '../components/DashboardView.vue';
import WorkingTimes from '../components/WorkingTimes.vue';
import ClockManager from '../components/ClockManager.vue';

const routes = [
  { path: '/', component: DashboardView },
  { path: '/working-times', component: WorkingTimes },
  { path: '/clock-manager', component: ClockManager }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;