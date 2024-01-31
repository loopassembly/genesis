import { ProductBody, Navbar } from "~/components";
import type { MetaFunction } from "@remix-run/node";

export const meta: MetaFunction = () => {
    return[{title:"proto.id | Products"}];
}

export default function Products(){
    const navData = [
        {
          bgcolor: "#F5FFFA",
          textcolor: "#121212",
          name: "products",
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
            key="product"
            navID="productNav" 
            navType="navbar-expand-xl bg-body-primary"
            bgColor={data.bgcolor}
            textColor={data.textcolor}
            navName={data.name}
            navLinks={data.links}
            />
          ))}
          <ProductBody />
        </main>
    );
        
}