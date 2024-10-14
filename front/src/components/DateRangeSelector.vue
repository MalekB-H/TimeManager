<template>
    <div class="mb-4">
      <label class="block text-sm font-medium text-gray-700 mb-2">Sélectionner une période</label>
      <div class="flex space-x-4">
        <input 
          type="date" 
          v-model="startDate" 
          @change="emitDates"
          class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"
        >
        <input 
          type="date" 
          v-model="endDate" 
          @change="emitDates"
          class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"
        >
      </div>
    </div>
</template>
  
<script>
  import { ref, watch } from 'vue';
  
  export default {
    name: 'DateRangeSelector',
    emits: ['date-range-changed'],
    setup(props, { emit }) {
      const startDate = ref(new Date(new Date().setDate(new Date().getDate() - 7)).toISOString().split('T')[0]);
      const endDate = ref(new Date().toISOString().split('T')[0]);
  
      const emitDates = () => {
        emit('date-range-changed', { startDate: startDate.value, endDate: endDate.value });
      };
  
      watch([startDate, endDate], emitDates);
  
      return { startDate, endDate, emitDates };
    }
  };
</script>