import Vue from 'vue';
import Vuex from 'vuex';

const state = {};

const getters = {};

const actions = {};

const mutations = {};

Vue.use(Vuex);
const useDebug = process.env.NODE_ENV !== 'production';

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations,
  // modules,
  strict: useDebug
})