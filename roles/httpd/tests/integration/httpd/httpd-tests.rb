control "httpd-installed" do
  impact 1.0                                
  title "Verificar que httpd instalado"
  desc "Primer requisito del rol, debe instalar httpd"
  describe package('httpd') do
   it { should be_installed }
  end
end

control "httpd-started-enabled" do
  impact 1.0                                
  title "Verificar que httpd está arrancado y que se arrancará al inicio del sistema"
  desc "httpd arrancado y en enabled"
  describe service('httpd') do
   it { should be_enabled }
   it { should be_running }
  end
end

control "httpd-listens-80" do
  impact 1.0                                
  title "Verificar que httpd está escuchando en el puerto 80"
  desc "httpd debe escuchar en el puerto 80 en este test"
  describe port(80) do
   it { should be_listening }
   its('processes') {should include 'httpd'}
  end
end

