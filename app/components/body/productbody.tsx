import { protoApp, protoVerify } from "~/assets";

export default function ProductBody() {
  return (
    <main  style={{minHeight: "100vh"}}>
      <div className="row row-cols-1 row-cols-md-3 g-4 justify-content-center product-content w-100"> 
        <div className="col ">
          <div className="card h-100 img-content">
            <img src={protoApp} className="card-img-top" alt="..." />
          </div>
        </div>
        <div className="col">
          <div className="card h-100 img-content">
            <img src={protoVerify} className="card-img-top" alt="..." />
          </div>
        </div>
      </div>
    </main>
  );
}
