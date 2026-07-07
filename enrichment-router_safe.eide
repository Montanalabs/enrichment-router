#! Enrichment router — untrusted a raw event can only ever become one of a fixed set of decisions over a
#! closed type, never a tool argument. An injected instruction cannot be represented in the
#! closed type, so it is rejected at the trust boundary (and re-clamped at run time by extract).
#! @requires enrich — the enrichment router sink
#! @effect io
#! @taint bridge — extract<Decision> turns the tainted input into a trusted decision
grant enrich

type EnrichSource = Geoip | Ua | Referrer
type Decision = Enrich(EnrichSource) | Skip

let raw = fetch<web>  # UNTRUSTED a raw event — tainted
quarantined { let d = extract<Decision>(raw) }  # only a fixed Decision (payloads too) crosses
privileged { enrich(d) }  # act on the trusted decision only
