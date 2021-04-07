<template>
  <div>
    <div v-if="errors.length" class="error-box">
      <ul>
        <li v-for="error in errors" class="errors-list">{{ error }}</li>
      </ul>
    </div>
    <div class="row justify-content-center search-box">
      <div class="col-offset-2 col-sm-8 col-offset-2">
        <form @submit.prevent="exec">
          <div class="input-group">
            <input v-model="word" class="form-control text-center" placeholder="Please input FirstNamedApplicant">

            <span class="input-group-addon btn"><button type="submit">検索</button></span>
          </div>
        </form>
      </div>
    </div>
    <div class="row justify-content-center">


      <table>
        <tbody>
          <tr>
            <th>PatentNumber</th>
            <th>patentTitle</th>
            <th>FirstNamedApplicant</th>
          </tr>
          <tr v-for="e in results">
            <td>{{ e["patentNumber"] }}</td>
            <td>{{ e["patentTitle"] }}</td>
            <td>{{ e["firstNamedApplicant"] }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>


<script>
  let alert = document.getElementsByClassName("errors-list");
  let alert_box = document.getElementsByClassName("error-box");

  import axios from 'axios';
  export default{
    data: function(){
      return{
        errors: [],
        results: [],
        word:  ""
      }
    },
    methods: {
      exec: function(){
        this.errors.length = 0;
        if(!this.word){
          this.errors.push("文字を入力してください");
        }
        if(this.errors.length){
          for(let i = 0; i < alert.length; i++){
            alert[i].style.display="block";
          }
          setTimeout(function(){
             for(let i = 0; i < alert.length; i++){
                alert[i].style.display="none";
              }
          },3000);
          return;
        }

        axios.get('/api/v1/searches',{
          params: {
            word: this.word
          },
        })
        .then((response) => {
          this.results.length = 0;
          if(!response.data.length){
            for(let i = 0; i < alert.length; i++){
              alert[i].style.display="block";
            }
            this.errors.push("指定された条件の特許が存在しません");
            setTimeout(function(){
              for(let i = 0; i < alert.length; i++){
                alert[i].style.display="none";
                }
            },3000);
          }
          for(let i = 0; i < response.data.length; i++) {
            this.results.push(response.data[i]);
          }
         }, (error) => {
           console.log(error);
         });
      }
    }
  };
</script>

<style scoped>
.search-box{
  margin-top:70px;
}

.result-list{
  margin:15px;
}

.food-form{
  margin-left:10px !important;
}

.de-style{
  font-size:25px;
}

.errors-list{
  list-style: none;
}

.error-box{
  position: absolute;
  top: 65px;
  left: 25%;
  color:red;
  font-size: 1.2rem;
}

.errors-list{
  animation : fadeOut 3s;
  animation-fill-mode: both;
}
@keyframes fadeOut {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
</style>
