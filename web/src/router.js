import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);

import Home from '@/components/Home.vue'
import VideoPlayer from '@/components/VideoPlayer.vue'

const router = new VueRouter({
  base: process.env.BASE_URL,
  mode: 'history',
  routes: [
    {
        path: '/',
        name: 'home',
        component: Home,
    },
    {
        path: '/video',
        name: 'video',
        component: VideoPlayer,
    }
]
})

export default router;