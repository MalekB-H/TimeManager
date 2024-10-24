<template>
    <div class="bg-white p-6 rounded-lg shadow-md">
        <h2 class="text-xl font-semibold mb-4">Sélection du temps de travail</h2>

        <button ref="dropdownTimepickerButton" @click="toggleDropdown"
            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
            type="button">
            Choose time
            <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                viewBox="0 0 10 6">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="m1 1 4 4 4-4" />
            </svg>
        </button>

        <!-- Dropdown menu -->
        <div v-show="dropdownVisible" class="z-10 bg-white rounded-lg shadow w-auto dark:bg-gray-700 p-3">
            <div class="max-w-[16rem] mx-auto grid grid-cols-2 gap-4 mb-2">
                <div>
                    <label for="date" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Date:</label>
                    <input type="date" id="date" v-model="selectedDate"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:text-white"
                        required />
                </div>
                <div>
                    <label for="start-time" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Start
                        time:</label>
                    <input type="time" id="start-time" v-model="startTime"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:text-white"
                        min="09:00" max="18:00" required />
                </div>
                <div>
                    <label for="end-time" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">End
                        time:</label>
                    <input type="time" id="end-time" v-model="endTime"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:text-white"
                        min="09:00" max="18:00" required />
                </div>
            </div>
            <button @click="saveTime" type="button"
                class="text-blue-700 dark:text-blue-500 text-sm hover:underline p-0">
                Save time
            </button>
        </div>

    </div>
</template>

<script>
import api from '../services/api';

export default {
    name: 'WorkingTimeSelector',
    props: ['userId'],
    data() {
        return {
            dropdownVisible: false,
            selectedDate: new Date().toISOString().split('T')[0], 
            startTime: "09:00", 
            endTime: "17:00" 
        };
    },
    methods: {
        toggleDropdown() {
            this.dropdownVisible = !this.dropdownVisible;
        },
        async saveTime() {
            console.log("Date:", this.selectedDate, "Start time:", this.startTime, "End time:", this.endTime);

            const formattedStartTime = `${this.selectedDate}T${this.startTime}:00Z`;
            const formattedEndTime = `${this.selectedDate}T${this.endTime}:00Z`;

            try {
                await api.postWorkingTimes(this.userId, formattedStartTime, formattedEndTime);
                console.log('Working time saved successfully');
            } catch (error) {
                console.error("Error saving working time", error);
            }
            this.dropdownVisible = false;
        }
    }
};
</script>

<style scoped>
.chart-container {
    position: relative;
    height: 300px;
    width: 100%;
}
</style>