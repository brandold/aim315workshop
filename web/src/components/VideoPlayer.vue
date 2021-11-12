<template>
  <div>
    <b-container>
      <!-- <h2>{{playerOptions.sources[0].src}}</h2> -->
      <video-player class="video-player-box" ref="videoPlayer" :options="playerOptions" :playsinline="true">
      </video-player>

      <br>

      <b-button @click="showCaptionsDialog()"> Load Captions </b-button>

      <div v-if="captionDialog">
        <br>
        <b-form-input v-model="captionName" placeholder="Enter the subtitle file name"></b-form-input>
        <br>
        <b-form-input v-model="captionLang" placeholder="Enter the two character lanaguage code"></b-form-input>
        <br>
        <b-form-input v-model="captionLabel" placeholder="Enter a label for the caption that will be seen in the video player"></b-form-input>
        <br>
        <b-button @click="loadCaptions()"> Submit </b-button>

      </div>
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
      captionDialog: false,
      captionLang: null,
      captionName: null,
      captionLabel: null,
      playerOptions: {
        sources: [{
            type: "video/mp4",
            src: '../../../videos/' + this.$route.query.file
          }],
        aspectRatio: "16:9"
      }
    }
  },
  computed: {
      player() {
        return this.$refs.videoPlayer.player
      }
  },
  methods: {
    showCaptionsDialog () {
      if (this.captionDialog == true) {
        this.captionDialog = false
      }
      else {
        this.captionDialog = true
      }
    },
    loadCaptions () {
      let captionOption = {
        kind: 'captions',
        srclang: this.captionLang,
        label: this.captionLabel,
        src: '../../../videos/' + this.captionName
      };
      this.player.addRemoteTextTrack(captionOption)
      this.captionFile = null
      this.captionLang = null
      this.captionLabel = null
      this.captionDialog = false
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
