{ config, ... }:

{
  networking = {
    knownNetworkServices = ["Wi-Fi" "Bluetooth PAN" "Thunderbolt Bridge" "iPhone USB" "USB 10/100/1000 LAN"];
  };
}
