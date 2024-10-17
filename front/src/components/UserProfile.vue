<template>
  <div>
    <h2>User Information</h2>
    <form @submit.prevent="getUser">
      <p>User ID: {{ userID }}</p>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

axios.defaults.baseURL = "http://localhost:4000"
export default {
  name: 'UserProfile',
  props: ['userID'],
  data() {
    return {
      user: {
        id: '',
        name: '',
        email: ''
      }
    };
  },
  methods: {
    async createUser() {
      try {
        const response = await axios.post('/api/users', { name: this.user.name, email: this.user.email });
        this.user.id = response.data.id;
      } catch (error) {
        console.error("Error creating user", error);
      }
    },
    async updateUser() {
      try {
        await axios.put(`/api/users/${this.userId}`, { name: this.user.name, email: this.user.email });
      } catch (error) {
        console.error("Error updating user", error);
      }
    },
    async getUser() {
      try {
        const response = await axios.get(`/api/users/${this.userID}`);
        this.user = response.data;
      } catch (error) {
        console.error("Error fetching user", error);
      }
    },
    async deleteUser() {
      try {
        await axios.delete(`/api/users/${this.userId}`);
        this.user = { id: '', name: '', email: '' };
      } catch (error) {
        console.error("Error deleting user", error);
      }
    }
  },
  mounted() {
    this.getUser();
  }
};
</script>
