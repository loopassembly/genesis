export default function Navbar({navID ,navType ,bgColor, textColor, navName, navLinks}:any) {
  const navid = "test".concat(navID)
  const navid2 = "#test".concat(navID)
  const area = "offcanvasDarkNavbarLabel".concat(navID)
  return (
    <nav className={`navbar ${navType}`} style={{backgroundColor: bgColor, color: textColor}}>
      <div className="container-fluid">
        <a className="navbar-brand" href="/">
          <span className="brand-link">{navName}</span>
        </a>
        <button
          className="navbar-toggler"
          type="button"
          data-bs-toggle="offcanvas"
          data-bs-target={navid2}
          aria-controls={navid}
        >
          <span className="navbar-toggler-icon"></span>
        </button>
        <div
          className="offcanvas offcanvas-end text-bg-dark"
          tabIndex={-1}
          id={navid}
          aria-labelledby={area}
        >
          <div className="offcanvas-header">
            <button
              type="button"
              className="btn-close btn-close-white"
              data-bs-dismiss="offcanvas"
              aria-label="Close"
            ></button>
          </div>

          <div className="offcanvas-body" id={area}>
            <ul className="navbar-nav ms-auto mb-2 mb-lg-0" style={{paddingInlineEnd: "115px"}}>
              {navLinks.map((data:any) => (
                <li className="nav-item" key={data.index}>
                  <a className="nav-link" href={data.url}>
                    {" "}
                    <span className="page-link" style={{color: textColor}}>{data.pgName}</span>
                  </a>
                </li>  
              ))}
            </ul>
          </div>
        </div>
      </div>
    </nav>
  );
}
