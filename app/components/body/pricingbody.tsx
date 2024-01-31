import { devPricing, eventPricing, enterprisePricing } from "~/assets";

export default function PricingBody() {
  return (
    <main style={{ minHeight: "100vh" }}>
      <div>
        <div className="users">for users</div>
        <div className="price-zero">zero dollars</div>
      </div>
      <div className="row row-cols-1 row-cols-md-3 g-4 justify-content-center product-content w-100">
        <div className="col ">
          <div className="card img-content">
            <img src={devPricing} className="card-img-top" alt="..." />
          </div>
        </div>
        <div className="col">
          <div className="card img-content">
            <img src={eventPricing} className="card-img-top" alt="..." />
          </div>
        </div>
        <div className="col">
          <div className="card img-content">
            <img src={enterprisePricing} className="card-img-top" alt="..." />
          </div>
        </div>
      </div>
    </main>
  );
}
