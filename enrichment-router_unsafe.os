#! VULNERABLE enrichment-router — feeds the untrusted input straight to the tool, no extraction.
#! check -> UNSAFE: tainted data cannot reach a capability.
grant enrich

let raw = fetch<web>
privileged { enrich(raw) }  # tainted -> tool: REJECTED
