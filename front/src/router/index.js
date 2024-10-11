import { createRouter, createWebHistory } from 'vue-router';
import WorkingTimes from '../components/WorkingTimes.vue';
import WorkingTime from '../components/WorkingTime.vue';
import ClockManager from '../components/ClockManager.vue';
import ChartManager from '../components/ChartManager.vue';
import UserProfile from '../components/UserProfile.vue';

const routes = [
  {
    path: '/user/:userID',
    name: 'UserProfile',
    component: UserProfile,
    props: true, 
  },
  {
    path: '/working-times/:userId',
    name: 'WorkingTimes',
    component: WorkingTimes,
    props: true,
  },
  {
    path: '/working-time/:userId/:workingTimeId?',
    name: 'WorkingTime',
    component: WorkingTime,
    props: true,
  },
  {
    path: '/clock/:userID',
    name: 'ClockManager',
    component: ClockManager,
    props: true,
  },
  {
    path: '/charts/:userId',
    name: 'ChartManager',
    component: ChartManager,
    props: true,
  },
  {
    path: '/',
    redirect: '/user/',
  }
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
