{ config, pkgs, ... }:

{
  services.cron = {
    enable = true;
    systemCronJobs = [
      "0 0 1 * *  will  add_monthly_bills"
    ];
  };
}
