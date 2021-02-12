import nedpals.vex.server
import nedpals.vex.router
import nedpals.vex.ctx

fn print_req_info(mut req ctx.Req, mut res ctx.Resp) {
	println('$req.method $req.path')
}

fn main() {
	mut app := router.new()

	app.use(print_req_info)

	app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('Yayy!', 200)
	})

	server.serve(app, 6789)
}
