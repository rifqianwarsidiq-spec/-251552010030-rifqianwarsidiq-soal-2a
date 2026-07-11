FROM nginx:alpine

ARG PERPUSTAKAAN_PLACEHOLDER="Perpustakaan STMIK Tazkia"
ARG KAMPUS_PLACEHOLDER="STMIK Tazkia"
ARG PRODI_PLACEHOLDER="Sistem Informasi"

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY html/ /usr/share/nginx/html/
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    sed -i "s|PERPUSTAKAAN_PLACEHOLDER|${PERPUSTAKAAN_PLACEHOLDER}|g" /usr/share/nginx/html/*.html && \
    sed -i "s|KAMPUS_PLACEHOLDER|${KAMPUS_PLACEHOLDER}|g" /usr/share/nginx/html/*.html && \
    sed -i "s|PRODI_PLACEHOLDER|${PRODI_PLACEHOLDER}|g" /usr/share/nginx/html/*.html

ENTRYPOINT ["/entrypoint.sh"]
