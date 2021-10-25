<template>
  <div>
    <b-container>
        <br>
        <div v-for="item in content" v-bind:key="item.title" class="rows">
          <b-card @click="openVideo(item)" v-bind:title="item.title" img-src="https://upload.wikimedia.org/wikipedia/commons/b/be/I_Love_Lucy_title.svg" img-alt="Image" img-top>
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
            "title": "I Love Lucy, Meeting John Wayne",
            "fileLocation": "../../../videos/the_lucy_show_john_wayne.mp4"
        },
        {
            "title": "I Love Lucy, Ring a ding ding!",
            "fileLocation": "../../../videos/the_lucy_show_ring_a_ding_ding_tools.mp4"
        }
      ]
    }
  },
  methods: {
    openVideo (item) {
      console.log(item)
      this.$router.push({ path: '/video', query: { file: item.fileLocation} })
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
  margin: 2px;
}
</style>
