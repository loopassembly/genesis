export function AboutBlock({ header, description }: any) {
  return (
    <div className="col h-100">
      <div
        className="card h-100"
        style={{ backgroundColor: "#121212", color: "#F5FFFA" }}
      >
        <div className="card-body h-100">
          <table style={{minHeight: "330px"}}>
            <thead>
              <th>
                <td className="about-table">{header}</td>
              </th>
            </thead>
            <tbody>
              <tr>
                <td>{description}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default function AboutBody() {
  const aboutData = [
    {
      index: 1,
      title: "Privacy and Data Protection",
      detail:
        "Proto.id allows for the verification of information without disclosing the information itself. In an airport security context, this could be useful for verifying the authenticity of identity or travel documents without revealing personal details. This protects individuals' privacy and reduces the risk of unauthorized access to sensitive information.",
    },
    {
      index: 2,
      title: "Reduced Information Exposure",
      detail:
        "Traditional security measures often involve presenting credentials or information that may be unnecessary for the specific task at hand. Proto.id enable a more focused and minimal disclosure of information, reducing the risk of information exposure and potential misuse.",
    },
    {
      index: 3,
      title: "Enhanced Security",
      detail:
        "Proto.id can provide a higher level of security by ensuring that only the necessary and relevant information is disclosed during verification. This can help mitigate the risk of identity theft, document forgery, or other forms of fraudulent activity.",
    },
    {
      index: 4,
      title: "Trustless Verification",
      detail:
        "Proto.id allows for trustless verification, meaning that the verifying party does not need to trust the prover. This is particularly important in security scenarios where there may be concerns about the trustworthiness of individuals or systems involved.",
    },
    {
      index: 5,
      title: "Adaptability and Flexibility",
      detail:
        "Proto.id can be applied in various scenarios and are adaptable to different security requirements. Traditional security measures may be more rigid and less versatile in adapting to changing security needs.",
    },
  ];
  return (
    <main style={{ minHeight: "100vh" }}>
      <div className="row row-cols-1 row-cols-md-2 g-3 justify-content-center product-content w-100" style={{paddingInline: "7vw"}}>
        {aboutData.map((data) => (
          <AboutBlock
            key={data.index}
            header={data.title}
            description={data.detail}
          />
        ))}
      </div>
    </main>
  );
}
