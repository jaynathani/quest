FROM node:10
RUN mkdir /quest
WORKDIR /quest
COPY . /quest
EXPOSE 3000
CMD ["export", "SECRET_WORD=TwelveFactor"]
CMD ["npm", "install"]
CMD ["npm", "start"]
