module.exports =  class User {
  constructor(ctx){
    this.ctx = ctx;
    this.map = {
      get: 'get'
    }
  }

  async get(params){
    console.log('-----------:', params)
  }
}
