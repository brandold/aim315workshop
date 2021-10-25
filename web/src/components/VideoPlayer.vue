<template>
  <div>
    <b-container>
      <h2>{{playerOptions.sources[0].src}}</h2>
      <video-player class="video-player-box" ref="videoPlayer" :options="playerOptions" :playsinline="true">
      </video-player>
    </b-container>
  </div>

</template>

<script>
import 'video.js/dist/video-js.css'

import { videoPlayer } from 'vue-video-player'

export default {
  name: 'VideoPlayer',
  components: {
    videoPlayer
  },
  data () {
    return {
      playerOptions: {
        sources: [{
            type: "video/mp4",
            src: this.$route.query.file
          }],
        aspectRatio: "16:9"
      }
    }
  },
  methods: {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
