export UNIFI_HTTP_PORT={{cfg.unifi.http.port}}
export UNIFI_HTTPS_PORT={{cfg.unifi.https.port}}
export PORTAL_HTTP_PORT={{cfg.portal.http.port}}
export PORTAL_HTTPS_PORT={{cfg.portal.https.port}}
export UNIFI_DB_PORT={{cfg.unifi.db.port}}
export UNIFI_STUN_PORT={{cfg.unifi.stun.port}}
export UNIFI_HTTPS_CIPHERS={{cfg.unifi.https.ciphers}}
export UNIFI_HTTPS_SSLENABLEDPROTOCOLS={{cfg.unifi.https.sslEnabledProtocols}}
export UNIFI_HTTPS_HSTS={{cfg.unifi.https.hsts.hsts}}
export UNIFI_HTTPS_HSTS_MAX_AGE={{cfg.unifi.https.hsts.max_age}}
export UNIFI_HTTPS_HSTS_PRELOAD={{cfg.unifi.https.hsts.preload}}
export UNIFI_HTTPS_HSTS_SUBDOMAIN={{cfg.unifi.https.hsts.subdomain}}
export PORTAL_REDIRECTOR_PORT={{cfg.portal.redirector.port}}
export PORTAL_REDIRECTOR_PORT_WIRED={{cfg.portal.redirector.wired.port}}
export UNIFI_THROUGHPUT_PORT={{cfg.unifi.throughput.port}}
export DATA_RETENTION_DAYS={{cfg.data_retention_days}}

{{~#if cfg.db}}
export DB_MONGO_LOCAL={{cfg.db.local}}
export UNIFI_DB_NAME={{cfg.db.name}}
export DB_MONGO_URL={{cfg.db.url}}
export STATDB_MONGO_URL={{cfg.db.statdb}}
{{~/if}}
