<template>
  <div>
    <div v-if="errors.length" class="error-box">
      <ul>
        <li v-for="error in errors" class="errors-list">{{ error }}</li>
      </ul>
    </div>
    <div class="row search-box">
      <div class="col-md-4 col-md-offset-4">
        <form @submit.prevent="exec">
          <div class="input-group">
            <input v-model="word" class="form-control text-center" placeholder="Please input FirstNamedApplicant">
            <span class="input-group-addon btn"><button type="submit">検索</button></span>
          </div>
        </form>
      </div>
    </div>
    <div class="container">
    <div v-show="0 < pagedTableData.length" class="row">
      <div class="col-md-10 col-md-offset-1">
        <table border="1">
          <tbody>
            <tr>
              <th class="list-title">PatentNumber</th>
              <th class="list-title">patentTitle</th>
              <th class="list-title">FirstNamedApplicant</th>
            </tr>
            <tr v-for="e in pagedTableData">
              <td class="result-center results-responsive">{{ e["patentNumber"] }}</td>
              <td class="results-padding results-responsive">{{ e["patentTitle"] }}</td>
              <td class="result-center results-responsive">{{ e["firstNamedApplicant"][0] }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="col-sm-2 col-sm-offset-5">
        <el-pagination
          layout="prev, pager, next"
          :total="this.results.length"
          @current-change="setPage">
        </el-pagination>
      </div>
    </div>
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
        word:  "",
        page: 1,
        pageSize: 10,
      }
    },
    computed: {
      pagedTableData() {
        return this.results.slice(this.pageSize * this.page - this.pageSize, this.pageSize * this.page)
      }
    },

    methods: {
      setPage (val) {
        this.page = val
      },
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

.list-title{
  text-align: center;
}

.result-center{
  text-align: center;
}

.results-padding{
padding: 5px;
}

table{
background-color: #ffffff;
margin: 10px 0px;
}


@keyframes fadeOut {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

@media (max-width: 575px) {
  .results-responsive{
  font-size: 5px;
  }
}
</style>
