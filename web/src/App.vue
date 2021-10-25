<template>
  <div id="app">
    <b-navbar fixed="top" type="dark" variant="danger">
      <b-navbar-brand href="/">SearchFlix</b-navbar-brand>
    </b-navbar>
    <br>
    <router-view/>
  </div>
</template>

<script>

export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
