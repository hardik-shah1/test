FROM jenkins/jenkins:latest

# Step 1 - Disabling the Setup Wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Step 3.1 Define jenkins configuration as code yaml file
# Specifying the Jenkins URL, Creating a User
ENV CASC_JENKINS_CONFIG /var/jenkins_home/jenkins.yaml

# Step 2 - Installing Jenkins Plugins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Step 3.2 Consider jenkins configuration settings file
COPY jenkins.yaml /var/jenkins_home/jenkins.yaml
