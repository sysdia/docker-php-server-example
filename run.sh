sudo docker build -t website_example ./website
sudo docker run -d -p 6022:22 -p 5080:80 -name website_application website_example
