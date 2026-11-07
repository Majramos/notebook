FROM node:22-bookworm-slim

WORKDIR /opt/wrangler

RUN npm init --yes && npm i -D wrangler@latest

ENV PATH="/opt/wrangler/node_modules/.bin:${PATH}"

WORKDIR /workspace

CMD ["bash"]
