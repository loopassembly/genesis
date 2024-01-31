import { PricingBody, Navbar } from "~/components";
import type { MetaFunction } from "@remix-run/node";

export const meta: MetaFunction = () => {
    return[{title:"proto.id | Pricing"}];
}

export default function Products(){
    const navData = [
        {
          bgcolor: "#F5FFFA",
          textcolor: "#121212",
          name: "pricing",
          links: [{ index: 1, url: "/", pgName: "home" },
          { index: 2, url: "/products", pgName: "products" },
          { index: 3, url: "/pricing", pgName: "pricing" },
          { index: 4, url: "/about", pgName: "about" },],
        },
      ];
    return(
        <main style={{backgroundColor: "#121212"}}>
        {navData.map((data) => (
            <Navbar
            key="pricing"
            navID="pricingNav" 
            navType="navbar-expand-xxl bg-body-primary"
            bgColor={data.bgcolor}
            textColor={data.textcolor}
            navName={data.name}
            navLinks={data.links}
            />
          ))}
          <PricingBody />
        </main>
    );
        
}