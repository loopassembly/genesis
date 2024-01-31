import type { MetaFunction } from "@remix-run/node";
import { Navbar, Hero } from "~/components";
import { LinksFunction } from "@remix-run/node";
import { Helmet } from "react-helmet";
import stylesheet from "~/styles/global.css";


export const meta: MetaFunction = () => {
  return [{ title: "proto.id" }, { name: "description", content: "proto.id" }];
};

export const links: LinksFunction = () => [
  {
    rel: "stylesheet",
    href: "https://fonts.googleapis.com/css2?family=Space+Grotesk&display=swap",
  },
  { rel: "stylesheet", href: stylesheet },
];

export default function Index() {
  const navData = [
    {
      bgcolor: "#121212",
      textcolor: "#F5FFFA",
      name: "proto.id",
      links: [{ index: 1, url: "/", pgName: "home" },
      { index: 2, url: "/products", pgName: "products" },
      { index: 3, url: "/pricing", pgName: "pricing" },
      { index: 4, url: "/about", pgName: "about" },],
    },
  ];
  return (
    <main style={{ fontFamily: "Space Grotesk" }}>
      <Helmet>
        <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossOrigin="anonymous"
          async
        ></script>
      </Helmet>
      {navData.map((data) => (
        <Navbar
        key="home"
        navId="homenav" 
        navType="navbar-dark navbar-expand-xxl"
        bgColor={data.bgcolor}
        textColor={data.textcolor}
        navName={data.name}
        navLinks={data.links}
        />
      ))}
      <Hero />
    </main>
  );
}
