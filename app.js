const Koa = require('koa');
const Router = require('./app/router');
const bodyParser = require('koa-bodyparser');

const app = new Koa();
const router = new Router();

app
  .use(async (ctx, next) => {   // error handle
    try {
      await next();
    } catch (error) {
      console.log(error);
      ctx.status = 200;
      ctx.body = JSON.stringify({
        errno: 1010,
        errcode: 'unknown_route_error',
        errmsg: 'unknown route error',
      });
    }
  })
  .use(bodyParser())
  .use(router.routes)
  .use(async (ctx, next) => {
    ctx.status = 404;
    ctx.body = 'Not Found';
  });

app.listen(3000, err => {
  if (err) throw new Error(err);
  console.log('server listen 3000');
});
