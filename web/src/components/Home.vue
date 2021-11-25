<template>
  <div>
    <b-container>
        <b-img src="../public/../search_flix.png" fluid alt="Responsive image"></b-img>
        <br>
        <div v-for="item in content" v-bind:key="item.title" class="rows">
          <b-card @click="openVideo(item)" v-bind:title="item.title" v-bind:img-src="item.img" img-alt="Image" img-top>
            <!-- <b-card-text>
            </b-card-text> -->
            </b-card>
        </div>
    </b-container>
  </div>

</template>

<script>
export default {
  name: 'Home',
  data () {
    return {
      content: [
        {
            "title": "John Wayne",
            "fileName": "the_lucy_show_john_wayne.mp4",
            "img": "../../ilovelucy.png"
        },
        {
            "title": "Ring a ding!",
            "fileName": "the_lucy_show_ring_a_ding_ding_tools.mp4",
            "img": "../../ilovelucy.png"
        },
        {
            "title": "French Movie Star",
            "fileName": "the_lucy_show_french_movie_star.mp4",
            "img": "../../ilovelucy.png"
        },
        {
            "title": "Yellowstone Tips",
            "fileName": "yellowstone.mp4",
            "img": "../../yellowstone.png"
        },
        {
            "title": "Fight Flu",
            "fileName": "fightflu.mp4",
            "img": "../../fightflu.png"
        },
        {
            "title": "Vanlife",
            "fileName": "VanlifeAcoustic.mp4",
            "img": "../../VanlifeAcoustic.png"
        }

      ]
    }
  },
  methods: {
    openVideo (item) {
      console.log(item)
      this.$router.push({ path: '/video', query: { file: item.fileName} })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.rows{
  display: inline-block;
  border: 1px solid silver;
  width: 30%;
  height: 30%;
  margin: 2px;
}
</style>
