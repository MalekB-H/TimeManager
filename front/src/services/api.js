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
    return axios.get(`${API_URL}/working_times/user/${userId}`, {
      params: {
        start,
        end
      }
    });
  },

  postWorkingTimes(userId, start, end) {
    return axios.post(`${API_URL}/working_times/${userId}`, {
      working_time: {
        start_time: start,
        end_time: end,
        user_id: userId
      }
    });
  },

  getClockings(userId) {
    return axios.get(`${API_URL}/clockings/${userId}`);
  },

  // méthode pour enregistrer le début du travail
  startClocking(userId) {
    return axios.post(`${API_URL}/clockings/${userId}`);
  },

  // méthode pour enregistrer la fin du travail
  endClocking(userId, id) {
    return axios.put(`${API_URL}/clockings/${userId}/${id}`);
  },

  // méthode pour promouvoir un utilisateur
  promoteUser(userId, userData) {
    return axios.put(`${API_URL}/users/${userId}`, { user: userData });
  },

  teams(userId){
    return axios.post(`${API_URL}/teams/${userId}`);
  },

  createTeam(teamData) {
    return axios.post(`${API_URL}/teams`, teamData); 
  },  


  getUsers() {
    return axios.get(`${API_URL}/users`); 
  },

};
