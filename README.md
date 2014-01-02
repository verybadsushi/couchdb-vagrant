couchdb-vagrant
===============
Downloads and installs CouchDB on Ubantu precise32.  
Maps the ports.  
Sets the Bind Address to 0.0.0.0, so that CouchDb can be accessed from other machines.  
Creates a database called test_results.  

Get up and running
===============
1. Install VirtualBox
2. Install Vagrant
3. Clone couchdb-vagrant
4. Run the following commands  
   $ vagrant init precise32 <http://files.vagrantup.com/precise32.box>  
   $ vagrant up  
5. Verify CouchDB is up and running by navigating to <http://localhost:5984/_utils/>
