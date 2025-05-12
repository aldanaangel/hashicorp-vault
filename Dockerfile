FROM hashicorp/vault:latest

# Crear carpetas necesarias como root
RUN mkdir -p /vault/config /vault/data /vault/file /vault/logs \
 && chown -R vault:vault /vault

# Copiar el archivo de configuración, asegurando propietario vault:vault
COPY --chown=vault:vault config/config.hcl /vault/config/config.hcl

# Exponer el puerto donde escucha Vault
EXPOSE 8200

# Configurar variable de entorno
ENV VAULT_ADDR=http://127.0.0.1:8200

# Comando principal
CMD ["vault", "server", "-config=/vault/config/config.hcl"]
