<template>
    <div>
      <h2>Clock Manager</h2>
      <button @click="toggleClock">{{ clockIn ? 'Clock Out' : 'Clock In' }}</button>
      <p>{{ clockIn ? 'Working period in progress.' : 'No working period in progress.' }}</p>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    name: 'ClockManager',
    props: ['userId'],
    data() {
      return {
        clockIn: false,
        startDateTime: null
      };
    },
    methods: {
      async toggleClock() {
        if (this.clockIn) {
          
          try {
            await axios.post(`/api/clockings/${this.userId}`, {
              start_time: this.startDateTime,
              end_time: new Date().toISOString()
            });
            this.clockIn = false;
            this.startDateTime = null;
          } catch (error) {
            console.error("Error clocking out", error);
          }
        } else {
          
          this.startDateTime = new Date().toISOString();
          this.clockIn = true;
        }
      }
    }
  };
  </script>
  