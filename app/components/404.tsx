import { ReactTyped } from "react-typed";
import { logoTransparent } from "~/assets";

export default function PageNotFound() {
  return (
    <main>
      <div className="page-center">
        <img src={logoTransparent} className="horizontal-center"/>
        <div style={{textAlign: "center"}}>
          <span className="four-oh-four">
            {" "}
            {"{"}
            <ReactTyped
              strings={["404"]}
              typeSpeed={150}
              backSpeed={150}
              showCursor={false}
              loop
            />
            {"}"}
          </span>
        </div>
        <div className="tag-four-oh-four">
        {"Oops!! You lost your way . . ."}
        </div>
        <div className="apply-body">
            <a href="\" type="button" className="btn btn-tertiary back horizontal-center">Help me Back&#128512;</a>
        </div>
      </div>
    </main>
  );
}
