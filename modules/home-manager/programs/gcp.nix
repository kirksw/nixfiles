{ pkgs, lib, config, ... }:

{
  options = {
    gcp.enable = lib.mkEnableOption "enables module";
  };

  config = lib.mkIf config.gcp.enable {
    # packages = [
    #   (pkgs.google-cloud-sdk.withExtraComponents [pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin])
    # ];
    # home.packages = with pkgs; [
    #   google-cloud-sdk.withExtraComponents([google-cloud-sdk.components.gke-gcloud-auth-plugin])
    # ];
  };
}

