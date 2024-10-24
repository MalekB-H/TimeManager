<template>
    <div class="manager-profile">
      <h2>Manager Information</h2>
      <form @submit.prevent="getManager" class="manager-form">
        <div class="form-group">
          <label for="manager-id">Manager ID:</label>
          <p id="manager-id">{{ managerID }}</p>
        </div>
        <div class="form-group">
          <label for="manager-name">Name:</label>
          <p id="manager-name">{{ manager.name }}</p>
        </div>
        <div class="form-group">
          <label for="manager-email">Email:</label>
          <p id="manager-email">{{ manager.email }}</p>
        </div>
      </form>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  axios.defaults.baseURL = "http://localhost:4000";
  export default {
    name: 'ManagerProfile',
    props: ['managerID'],
    data() {
      return {
        manager: {
          id: '',
          name: '',
          email: ''
        }
      };
    },
    methods: {
      async createManager() {
        try {
          const response = await axios.post('/api/managers', { name: this.manager.name, email: this.manager.email });
          this.manager.id = response.data.id;
          alert('Manager created successfully');
        } catch (error) {
          console.error("Error creating manager", error);
        }
      },
      async updateManager() {
        try {
          await axios.put(`/api/managers/${this.managerID}`, { name: this.manager.name, email: this.manager.email });
          alert('Manager updated successfully');
        } catch (error) {
          console.error("Error updating manager", error);
        }
      },
      async getManager() {
        try {
          const response = await axios.get(`/api/managers/${this.managerID}`);
          this.manager = response.data;
        } catch (error) {
          console.error("Error fetching manager", error);
        }
      },
      async deleteManager() {
        try {
          await axios.delete(`/api/managers/${this.managerID}`);
          this.manager = { id: '', name: '', email: '' };
          alert('Manager deleted successfully');
        } catch (error) {
          console.error("Error deleting manager", error);
        }
      }
    },
    mounted() {
      if (this.managerID) {
        this.getManager();
      }
    }
  };
  </script>
  
  <style scoped>
  .manager-profile {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    margin: 20px auto;
  }
  
  .manager-profile h2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 15px;
    color: #333;
  }
  
  .manager-form {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }
  
  .form-group {
    display: flex;
    flex-direction: column;
    margin-bottom: 10px;
  }
  
  .form-group label {
    font-weight: bold;
    color: #555;
  }
  
  .form-group p {
    background-color: #fff;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
  }
  </style>
  