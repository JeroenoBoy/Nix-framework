{ config, pkgs, ... }:
# let
#   # When using easyCerts=true the IP Address must resolve to the master on creation.
#   # So use simply 127.0.0.1 in that case. Otherwise you will have errors like this https://github.com/NixOS/nixpkgs/issues/59364
#   kubeMasterIP = "10.1.1.2";
#   kubeMasterHostname = "api.kube";
#   kubeMasterAPIServerPort = 6443;
#   api = "https://${kubeMasterHostname}:${toString kubeMasterAPIServerPort}";
# in
# {
#   # resolve master hostname
#   networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

#   # packages for administration tasks
#   environment.systemPackages = with pkgs; [
#     kompose
#     kubectl
#     kubernetes
#   ];

#   services.kubernetes = {
#     # enable = true;
#     roles = [
#       "master"
#       "node"
#     ];
#     masterAddress = kubeMasterHostname;
#     apiserverAddress = api;
#     easyCerts = true;
#     apiserver = {
#       securePort = kubeMasterAPIServerPort;
#       advertiseAddress = kubeMasterIP;
#     };

#     # use coredns
#     addons.dns.enable = true;

#     # needed if you use swap
#     kubelet = {
#       kubeconfig.server = api;
#     };
#   };
# }

{
  # services.k3s = {
  #   enable = true;
  # };

  environment.systemPackages = with pkgs; [
    kind
    kubectl
  ];
}
