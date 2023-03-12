use rocket::routes;
mod routes;

#[rocket::main]
async fn main() {
    let rocket = rocket::build().mount("/", routes![routes::index]);
    rocket.launch().await.unwrap();
}
