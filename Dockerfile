# Use an official Jenkins LTS image as the base image
FROM jenkins/jenkins:lts

# Skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install required plugins using the install-plugins.sh script
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Copy Jenkins job configuration as code (optional, customize as needed)
COPY jobs/ /usr/share/jenkins/ref/jobs/

# Set Jenkins user to root to avoid permission issues
USER root

# Install additional tools or dependencies if needed (e.g., Docker CLI)
RUN apt-get update && \
    apt-get install -y docker.io && \
    usermod -aG docker jenkins

# Switch back to the Jenkins user
USER jenkins
