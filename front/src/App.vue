<template>
  <div id="app">
    <header>
      <h1>Employee Working Time Dashboard</h1>
    </header>
    <UserProfile />
    <nav>
      <ul>
        <li><router-link to="/working-times/1">Working Times</router-link></li>
        <li><router-link to="/working-time/1">Manage Working Time</router-link></li>
        <li><router-link to="/clock-manager/1">Clock Manager</router-link></li>
        <li><router-link to="/chart-manager/1">Charts</router-link></li>
      </ul>
    </nav>
    <main>
      <router-view />
    </main>
  </div>
</template>
<script>
import UserProfile from './components/UserProfile.vue';
export default {
  name: 'App',
  components: {
    UserProfile,
  },
};
</script>
<style>
#app {
  font-family: Arial, sans-serif;
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}
header {
  margin-bottom: 20px;
}
nav ul {
  list-style-type: none;
  padding: 0;
}
nav ul li {
  display: inline;
  margin-right: 10px;
}
main {
  margin-top: 20px;
}
</style>