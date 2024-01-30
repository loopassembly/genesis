export default function Navbar() {
  return (
    <nav className="navbar navbar-dark navbar-expand-xxl proto-navbar">
      <div className="container-fluid">
        <a className="navbar-brand" href="/">
          <span className="brand-link">proto.id</span>
        </a>
        <button
          className="navbar-toggler"
          type="button"
          data-bs-toggle="offcanvas"
          data-bs-target="#offcanvasDarkNavbar"
          aria-controls="offcanvasDarkNavbar"
        >
          <span className="navbar-toggler-icon"></span>
        </button>
        <div
          className="offcanvas offcanvas-end text-bg-dark"
          tabIndex={-1}
          id="offcanvasDarkNavbar"
          aria-labelledby="offcanvasDarkNavbarLabel"
        >
          <div className="offcanvas-header">
            <button
              type="button"
              className="btn-close btn-close-white"
              data-bs-dismiss="offcanvas"
              aria-label="Close"
            ></button>
          </div>

          <div className="offcanvas-body">
            <ul className="navbar-nav ms-auto mb-2 mb-lg-0" style={{paddingInlineEnd: "127px"}}>
              <li className="nav-item">
                <a className="nav-link" href="/">
                  {" "}
                  <span className="page-link">products</span>
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/">
                  {" "}
                  <span className="page-link">solutions</span>
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/">
                  {" "}
                  <span className="page-link">pricing</span>
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/">
                  {" "}
                  <span className="page-link">about</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
  );
}
