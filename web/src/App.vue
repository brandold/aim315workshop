<template>
  <div id="app">
  <br>
    <b-navbar id="navbar" fixed="top">
      <b-navbar-brand id="brand" href="/">SearchFlix</b-navbar-brand>
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
  /* margin-top: 60px; */
}

#brand {
  padding-left: 10px;
  color: #31255D;
}

#navbar {
  background-color: #99D7F7;
}

</style>
