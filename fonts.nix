{ licenses, fontforge }:

with licenses; {
  # I extracted versions with: grep -oE '^Version: .*$' src/*.sfd
  balvi-regular        = {
    version = "1.001";
    license = ofl;
  };
  crisa-light          = {
    version = "2.015";
    license = ofl;
  };
  crisa-regular        = {
    version = "0.1";
    license = ofl;
  };
  dunda-regular        = {
    version = "1.10";
    license = unfree;
  };
  fira-code-zlm        = {
    version = "1.208";
    license = ofl;
  };
  lavi-zlm             = {
    version = "2.0";
    license = gpl3;
  };
  lobster-zlm          = {
    version = "001.001";
    license = unfree;
  };
  nerfopi-regular      = {
    version = "001.001";
    license = unfree;
  };
  piper-karot          = {
    version = "1.1";
    license = ofl;
  };
  primihi-regular      = {
    version = "2008.02.06";
    license = publicDomain;
  };
  ritli-regular        = {
    version = "0.1";
    license = gpl3;
  };
  tanbo-regular        = {
    version = "2.000";
    license = asl20;
  };
  tisna-bold           = {
    version = "0.1";
    license = asl20;
  };
  tnr-zlm              = {
    version = "001.000";
    license = unfree;
  };
  unicode-drakono      = {
    version = "001.000";
    license = unfree;
  };
  unicode-manri        = {
    version = "001.000";
    license = unfree;
  };
  unifont              = {
    version = "12.1.02";
    license = gpl2;
  };
  vrude-italic-regular = {
    version = "1.200";
    license = ofl;
  };
  vrude-regular        = {
    version = "1.200";
    license = ofl;
  };
  zlm-manri            = {
    version = "001.000";
    license = unfree;
  };
  zlm-template         = {
    version = "0.1";
    license = ofl;
  };
  zlm-tnr              = {
    version = "001.000";
    license = unfree;
  };
}
