import axios from 'axios';

const API_URL = 'http://localhost:4000/api/';

class AuthService {
  async login(email, password) {
    const response = await axios.post(API_URL + 'login', { email, password });
    if (response.data.jwt) {
      localStorage.setItem('user', JSON.stringify(response.data));
    }
    return response.data;
  }

  logout() {
    localStorage.removeItem('user');
  }

  async register(username, email, password) {
    return axios.post('http://localhost:4000/api/register', {
      user: { username, email, password }
    });
  }

  getCurrentUser() {
    return JSON.parse(localStorage.getItem('user'));
  }
}

export default new AuthService();