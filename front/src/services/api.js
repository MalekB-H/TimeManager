import axios from 'axios';

const API_URL = 'http://localhost:4000/api';

export default {
  searchUsers(email, username) {
    return axios.get(`${API_URL}/users`, { 
      params: { 
        ...(email && { email }),
        ...(username && { username })
      } 
    });
  },

  getUser(userId) {
    return axios.get(`${API_URL}/users/${userId}`);
  },

  getWorkingTime(userId, workingTimeId) {
    return axios.get(`${API_URL}/working_times/${userId}/${workingTimeId}`);
  },

  getWorkingTimes(userId, start, end) {
    return axios.get(`${API_URL}/working_times/${userId}`, { 
      params: { 
        ...(start && { start }),
        ...(end && { end })
      } 
    });
  },

  getClockings(userId) {
    return axios.get(`${API_URL}/clockings/${userId}`);
  }
};