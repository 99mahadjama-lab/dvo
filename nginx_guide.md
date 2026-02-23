# Hosting NGINX on an EC2 Instance


## This is a guide to show how to deploy NGINX on an EC2 instance, and make the page load over your own domain.

Deploying NGINX on EC2 with a custom domain and HTTPS demonstrates:

Cloud fundamentals — provisioning compute, configuring security groups and networking
DNS knowledge — understanding record types, name resolution, and TTL
Linux proficiency — SSH, package management, systemd service control
Web server concepts — virtual hosts, static file serving, reverse proxying
Security awareness — TLS/SSL certificates, HTTPS, and port management

The first step is to purchase a custom domain on Route53.

<img width="1428" height="396" alt="image" src="https://github.com/user-attachments/assets/e205fdc1-bf92-4e36-9f3d-5b40c9f51620" />

Next, you navigate to the EC2 dashboard on aws where you will launch your EC2 instance.

To do this, you select "Launch Instance" and you will be directed to the settings page where you will configure your instance.

Select your instance name, your OS image and the instance type. For this guide, I will go with an Ubuntu server and the t2.micro instance type:

<img width="2214" height="1464" alt="image" src="https://github.com/user-attachments/assets/fe265f11-ea1a-49b9-9fb4-55a26e775841" />

I chose Ubuntu as it's the distribution I'm most comfortable with, and t2.micro as it's free-tier eligible and more than sufficient for a lightweight NGINX server. 
That said, EC2's real advantage here is the flexibility to choose an instance type that matches your exact compute requirements, whether that's a small burstable instance like this or something far more powerful.

The next step is to create a keypair. A key pair is used to securely authenticate your SSH connection to the EC2 instance, replacing the need for a password. AWS stores the public key on the instance, and you keep the private key locally, which is presented when you connect.
This means only your local machine is able to access the instance. Select the encryption type and file type (.pem if your on a Mac). 

<img width="1152" height="1128" alt="image" src="https://github.com/user-attachments/assets/21fb3202-ce11-4584-a83c-3ef96e404630" />

It is important that once you download this keypair that you store it in a hidden file i.e .ssh/ and to set the permissions so that the key file is readable only by you.

<img width="498" height="80" alt="image" src="https://github.com/user-attachments/assets/98bd151d-334d-40c5-825d-eda5d3b6e3eb" />

<img width="846" height="242" alt="image" src="https://github.com/user-attachments/assets/a88572ea-77fe-4059-a746-f25b43672cdd" />

After that, we configure the network settings to open the necessary ports for connectivity by selecting SSH(22), HTTP(80) and HTTPS(443)

<img width="2202" height="1324" alt="image" src="https://github.com/user-attachments/assets/c0873f51-b12b-402f-b819-8dc5664c082b" />

After this, you can now launch your instance and confirm that it is running.

<img width="2564" height="312" alt="image" src="https://github.com/user-attachments/assets/44e2ee5a-4ad3-462d-ad31-1d5dccd701ee" />

Now you need to SSH onto your instance so you can install Nginx.
To connect, run the following command, replacing the key name and IP address with your own:

_ssh -i ~/.ssh/your-key.pem ubuntu@your-ec2-public-ip_

<img width="1100" height="672" alt="image" src="https://github.com/user-attachments/assets/afbeb1a9-10cf-4be4-bf75-cd1cbbcf5565" />

Next you're going to install Nginx.

To install Nginx, use following command:

_sudo apt update_

_sudo apt install nginx_

You can confirmed it's installed with the _nginx -v_ command: 

<img width="558" height="56" alt="image" src="https://github.com/user-attachments/assets/9972ea70-ba38-4aa4-a897-841d572118a3" />

Now NGINX is installed, you need to map your EC2 IP address to your domain so that when someone visits your domain, they are directed to your instance.

First, navigate to Route 53 Open Route 53 and go to your hosted zone for your domain. This is where all your DNS records are managed.

<img width="2072" height="1174" alt="image" src="https://github.com/user-attachments/assets/c4df82e3-2469-4241-99d6-57874233af6e" />

Then create an A Record Create a new A record, set the name to your domain (or subdomain), and set the value to your EC2 public IP address. This is what ties your domain name to your server's IP.

<img width="3372" height="1392" alt="image" src="https://github.com/user-attachments/assets/8ce7c476-2c04-48b5-a813-9d5c4fe66a8d" />

Wait for DNS Propagation Changes to DNS records are not instant due to TTL — it can take anywhere from a few seconds to 48 hours to fully propagate, though in practice it's usually much faster.

Finally Test it Visit your domain in a browser. You should see the default NGINX welcome page, confirming traffic is reaching your instance.

<img width="1998" height="560" alt="image" src="https://github.com/user-attachments/assets/9e350b7b-c3c4-46ff-bf6a-212e324644da" />

Note: At this point you could go further and secure your domain with HTTPS using a free SSL certificate from Let's Encrypt, however since this instance is being terminated and wiped after this demo, there's no practical reason to do so here.





