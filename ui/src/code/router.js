import Vue from 'vue';
import VueRouter from 'vue-router';

import MainPage from '@/components/pages/MainPage.vue';

Vue.use(VueRouter);

const ROUTES = [
  { path: '*', redirect: '/home' },
  { name: 'Home', path: '/home', component: MainPage },
];

export function createRouter() {
  return new VueRouter({ routes: ROUTES });
}
