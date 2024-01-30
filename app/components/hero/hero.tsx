import { ReactTyped } from "react-typed";

export default function Hero() {
  return (
    <main className="main">
      <div>
        <h1 className="tagline">
          one id to authenticate
          <span>
            {" "}
            {"{"}
            <ReactTyped
              strings={[
                "payments",
                "verifications",
                "authentications",
                "everything",
              ]}
              typeSpeed={50}
              backSpeed={50}
              loop
            />
            {"}"} .
          </span>
        </h1>
        <h3 className="description">
          get proto.id to authenticate yourself anywhere in the globe and
          beyond.
        </h3>
        <button type="button" className="btn btn-dark apply">
          apply
        </button>
      </div>
    </main>
  );
}
