import { ReactTyped } from "react-typed";
import { logoTransparent } from "~/assets";
import file from "public/test.zip";

export function Apply() {
  return (
    <>
      <div
        className="modal fade"
        id="exampleModal"
        tabIndex={-1}
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div className="modal-dialog">
          <div className="modal-content">
            <div className="modal-header">
              <h1
                className="modal-title"
                id="exampleModalLabel"
                style={{ fontSize: "32px" }}
              >
                Apply
              </h1>
              <button
                type="button"
                className="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div className="modal-body">
              <div className="apply-body" style={{ textAlign: "center" }}>
                <span>
                  {"Download the app to "}
                  <ReactTyped
                    strings={[
                      "apply",
                      "verify",
                      "authenticate",
                      "and speedify !!",
                    ]}
                    typeSpeed={50}
                    backSpeed={50}
                    loop
                  />{" "}
                </span>
              </div>
              <div className="apply-body">
                <img src={logoTransparent} className="horizontal-center" />
              </div>
              <div className="apply-body">
                <a
                  href={file}
                  type="button"
                  className="btn btn-tertiary download horizontal-center"
                  download
                >
                  Download
                </a>
              </div>
            </div>
            <div className="modal-footer">
              <button
                type="button"
                className="btn btn-dark close"
                data-bs-dismiss="modal"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

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
              strings={["payments", "identity", "everything"]}
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
        <button
          type="button"
          className="btn btn-dark apply"
          data-bs-toggle="modal"
          data-bs-target="#exampleModal"
        >
          apply
        </button>
      </div>
      <div className="link-group">
        <div>
          <a
            href="/products"
            type="button"
            className="btn btn-tertiary navigate-dark right-link"
          >
            products{" "}&#x2192;
          </a>
        </div>
        <div>
          <a
            href="/pricing"
            type="button"
            className="btn btn-tertiary navigate-dark left-link"
          >
            &#x2190;{" "}pricing
          </a>
        </div>
      </div>
      <Apply />
    </main>
  );
}
