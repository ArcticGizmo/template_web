import Vue from 'vue';
import App from './App.vue';

import store from './store/store.js';

import { createRouter } from './code/router.js';
import { API } from './code/api';
import { Channel } from './code/channel.js';

import VTooltip from 'v-tooltip';
import Toasted from 'vue-toasted';

Vue.use(VTooltip);
Vue.use(Toasted);

const IS_DEV = process.env.NODE_ENV === 'development';

export function createApp() {
  let hostname = '';

  if (IS_DEV) {
    hostname = 'http://localhost:4000';
  }

  // configure vue prototypes
  Vue.prototype.$hostname = hostname;
  Vue.prototype.$eventBus = new Vue();
  Vue.prototype.$api = new API(hostname);
  Vue.prototype.$channel = new Channel();

  // create the router
  const router = createRouter();

  new Vue({
    router,
    store,
    render: h => h(App),
  }).$mount('#app');
}

createApp();
