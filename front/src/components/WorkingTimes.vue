<template>
   <div>
      <h2>Manage Working Time</h2>
      <form @submit.prevent="saveWorkingTime">
        <input v-model="workingTime.start" placeholder="Start time (YYYY-MM-DD hh:mm:ss)" />
        <input v-model="workingTime.end" placeholder="End time (YYYY-MM-DD hh:mm:ss)" />
        <button type="submit">Save Working Time</button>
      </form>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    name: 'WorkingTime',
    props: ['userId', 'workingTimeId'],
    data() {
      return {
        workingTime: {
          start: '',
          end: ''
        }
      };
    },
    methods: {
      async saveWorkingTime() {
        try {
          if (this.workingTimeId) {
            
            await axios.put(`/api/working_times/${this.userId}/${this.workingTimeId}`, {
              start_time: this.workingTime.start,
              end_time: this.workingTime.end
            });
          } else {
            
            await axios.post(`/api/working_times/${this.userId}`, {
              start_time: this.workingTime.start,
              end_time: this.workingTime.end
            });
          }
        } catch (error) {
          console.error("Error saving working time", error);
        }
      },
      async deleteWorkingTime() {
        try {
          await axios.delete(`/api/working_times/${this.userId}/${this.workingTimeId}`);
        } catch (error) {
          console.error("Error deleting working time", error);
        }
      }
    },
    mounted() {
      if (this.workingTimeId) {
        this.getWorkingTime();
      }
    }
  };
  </script>
  