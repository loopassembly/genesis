import type { MetaFunction } from "@remix-run/node";
import { Navbar, Hero } from "~/components";
import { LinksFunction } from "@remix-run/node";
import 'bootstrap';

export const meta: MetaFunction = () => {
  return [
    { title: "proto.id" },
    { name: "description", content: "proto.id" },
  ];
};

export const links: LinksFunction = () => [
  {rel:"stylesheet", href: "https://fonts.googleapis.com/css2?family=Space+Grotesk&display=swap"},
];

export default function Index() {
  return (
    <main style={{fontFamily: "Space Grotesk"}}>
      <Navbar />
      <Hero />
    </main>
  );
}
