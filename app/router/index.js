module.exports = Router;

function Router(opts) {
  // console.log(this.user)
  // this.group = new Group();
  // this.opts = opts || {};
  // this.methods = this.opts.methods || [
  //   'HEAD',
  //   'OPTIONS',
  //   'GET',
  //   'PUT',
  //   'PATCH',
  //   'POST',
  //   'DELETE'
  // ];
  // this.params = {};
  // this.stack = [];
}

Router.prototype.routes = async function(ctx, next) {
  let url = ctx.request.url;
  if (!url.startsWith('/api')) return await next();
  let urls = url.split('/');
  if (urls.length < 4) return await next();
  let action = urls[2];
  let func = urls[3];
  try {
    let controller = getController(ctx, action);
    if(controller.map && controller.map[func]){
      let params = getParams(ctx);
      return controller[func](params);
    }
    await next();
  } catch (error) {
    console.log(error)
    await next();
  }
};

function getController (ctx, action){
  let controller = require('../controller/' + action);
  if(typeof controller == 'function') return new controller(ctx);
  throw new Error('url error')
}


function getParams(ctx){
  let query = ctx.request.body;
  if(query instanceof Object) return query;
  return {};
}