Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web12.21186.1633408604950446416
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 21:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@sutherland.id.au header.s=google header.b=f8aUBWRE;
 spf=pass (domain: sutherland.id.au, ip: 209.85.217.52, mailfrom: phil@sutherland.id.au)
Received: by mail-vs1-f52.google.com with SMTP id 66so5926852vsd.11
        for <meta-ti@lists.yoctoproject.org>; Mon, 04 Oct 2021 21:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sutherland.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=n85eIsgHDRa8AR56agZ6MraTpoAjbIGJ8qxM2rNA7MA=;
        b=f8aUBWREYeyPpXlcliZQMi0XyvL3T3R30FQ2Ks/ke4DghM5OoZUaE+7Rik1aGYED/F
         8HHLmqNUXUDOGdO9eOOsO9pewNIOnyOyJJAT3HFVbZo5EKsGtYw/YGv/DO7zN35lzWwy
         0R0q49qrR7WhxE8YpR6X1jBKaDJ2k5BVGRuZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=n85eIsgHDRa8AR56agZ6MraTpoAjbIGJ8qxM2rNA7MA=;
        b=uyGN6bF4xFvLt33OpEJmbSpWTFUflBjUc5/IW2CreInNPdc76COgRcPqM8D1e+1y49
         M/8IunsSq+gj2MOLgJqMMzbrM+0BPN3Z2igugjSiivh7Hflft35KFFZxj2l72e3LZJz9
         lM9GK+SODT9/7l6yTiu20vtGTXHf7I9/zbECWhBcxOpeY7edU3Ev5bLGJOgnhc12ns59
         yePeMWB/4hG/o/gRxl+OMuwCa9tZwtjCOYN93xluL9kqCC16gegybPHcofWgsxlWmuyw
         edR0cQmv64sHYjWSBsRAqXfx5N4U1iPBZ8iCvsBlIwyXvvTkK5HIvlTRFu7t6/I9VwLU
         FzfA==
X-Gm-Message-State: AOAM530teAZI1Cx4NWhPq7YhJ2nFyoNYbxao3kKXeuZhcWj268TcWLl/
	kx04HG5fbt+8/8R9fBEXpmPksPvAK/G1FDoDKrbtKRde7/5EjQ==
X-Google-Smtp-Source: ABdhPJxy3hJp4kYNRx163Siu4Ha4aghVDjnD2RBTJeG299HAOQXs4r/7ovj0qsxE4/BAxIPB1aMvlpIxPEJUMMDxXLQ=
X-Received: by 2002:a05:6102:3593:: with SMTP id h19mr16628239vsu.23.1633408603329;
 Mon, 04 Oct 2021 21:36:43 -0700 (PDT)
MIME-Version: 1.0
From: "Phil Sutherland" <phil@sutherland.id.au>
Date: Tue, 5 Oct 2021 12:36:32 +0800
Message-ID: <CACpu_i6xMW1mW0hk6V2ghAivUnEdaB8EbaGgPba1rrg9wo6-Lw@mail.gmail.com>
Subject: [PATCH] meta-ti: Fix several errors introduced during override syntax changes
To: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Same patch as before, but hopefully in a more usable form.
Cheers
phil

---
 .../devtools/gcc-linaro-baremetal-aarch64-native.bb       | 4 ++--
 recipes-ti/devtools/gcc-linaro-baremetal-native.bb        | 4 ++--
 recipes-ti/devtools/ti-cgt-arm_18.12.5.bb                 | 2 +-
 recipes-ti/devtools/ti-cgt-pru_2.3.2.bb                   | 4 ++--
 recipes-ti/devtools/ti-cgt470.inc                         | 2 +-
 recipes-ti/devtools/ti-cgt6x_8.3.2.bb                     | 8 ++++----
 recipes-ti/devtools/ti-cgt7x_1.2.0.bb                     | 2 +-
 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh       | 2 +-
 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh   | 2 +-
 recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh     | 2 +-
 10 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
index f1596a8b..3b40c9bd 100644
--- a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
+++ b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
@@ -1,6 +1,6 @@
 include recipes-ti/devtools/gcc-linaro.inc

-PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-elf"
+PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
 S = "${WORKDIR}/${PACKAGE_DIR}"

 LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
@@ -8,7 +8,7 @@ LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
 inherit native
 require recipes-ti/includes/ti-paths.inc

-SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
+SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf.tar.xz;name=gcc-linaro-aarch64"

 SRC_URI[gcc-linaro-aarch64.md5sum] = "4972f8943820bdd2f577f498de78964b"
 SRC_URI[gcc-linaro-aarch64.sha256sum] =
"30fb7d876bcb982c502057c593d9c1f11b35d5158a26d986718e2b998388c4c8"
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
index d0683fe1..6d5ec197 100644
--- a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
+++ b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
@@ -1,6 +1,6 @@
 include recipes-ti/devtools/gcc-linaro.inc

-PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi"
+PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
 S = "${WORKDIR}/${PACKAGE_DIR}"

 LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
@@ -8,7 +8,7 @@ LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
 inherit native
 require recipes-ti/includes/ti-paths.inc

-SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi.tar.xz;name=gcc-linaro"
+SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi.tar.xz;name=gcc-linaro"

 SRC_URI[gcc-linaro.md5sum] = "9a4a39cfc78c84375b1160aa93587aed"
 SRC_URI[gcc-linaro.sha256sum] =
"45fc4f90af2e2e9c3197a275f6005ef5639f7a1889fa3eb24c3125ccd70fcd3d"
diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
index 60b216f9..b7b6d9b1 100644
--- a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
+++ b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
@@ -31,7 +31,7 @@ do_install() {
 SRC_URI[cgt_arm_installer.md5sum] = "e9e668332cf86c965b4da9d1d488426b"
 SRC_URI[cgt_arm_installer.sha256sum] =
"da976143128c619a278cb4214a4295c409d100f9e65ad2f4d0d1039db7cf98f4"

-BINFILE_NAME = "cgt:arm_installer"
+BINFILE_NAME = "cgt_arm_installer"

 FILES:${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
index d14c1962..8b3e2a07 100644
--- a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
+++ b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM:class-target =
"file://usr/share/doc/ti/cgt-pru/PRU_Code_Genera
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-unpack.inc

-BINFILE = "ti_cgt_pru_${PV}_linux_installer:x86.bin"
+BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
 BINFILE_NAME = "cgt-pru-x86"
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""

-BINFILE:class-target = "ti_cgt_pru_${PV}:armlinuxa8hf_busybox_installer.sh"
+BINFILE:class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
 BINFILE_NAME:class-target = "cgt-pru-arm"

 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
diff --git a/recipes-ti/devtools/ti-cgt470.inc
b/recipes-ti/devtools/ti-cgt470.inc
index c8f91271..f0992aa7 100644
--- a/recipes-ti/devtools/ti-cgt470.inc
+++ b/recipes-ti/devtools/ti-cgt470.inc
@@ -13,7 +13,7 @@ S = "${WORKDIR}/cgt470_${PV}"

 SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"

-BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux:x86.bin"
+BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin"
 TI_BIN_UNPK_CMDS="Y:qY:workdir: : "
 TI_BIN_UNPK_WDEXT="/cgt470_${PV}"

diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
index 00221d84..fd34657a 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -26,13 +26,13 @@ python __anonymous() {
             raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp
mode for now" % (pkgn, pkgv))
 }

-BINFILE = "ti_cgt_c6000_${PV}_linux_installer:x86.bin"
-BINFILE_NAME = "cgt6x:x86_installer"
+BINFILE = "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
+BINFILE_NAME = "cgt6x_x86_installer"
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""

-BINFILE:class-target = "ti_cgt_c6000_${PV}:armlinuxa8hf_busybox_installer.sh"
-BINFILE_NAME:class-target = "cgt6x:arm_installer"
+BINFILE:class-target = "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
+BINFILE_NAME:class-target = "cgt6x_arm_installer"

 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"

diff --git a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
index 35b58d4c..b45b52a3 100644
--- a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
+++ b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
@@ -20,7 +20,7 @@ COMPATIBLE_HOST:class-target = "null"
 PE = "1"

 BINFILE = "ti_cgt_c7000_${PV}.STS_linux_installer_x86.bin"
-BINFILE_NAME = "cgt7x:x86_installer"
+BINFILE_NAME = "cgt7x_x86_installer"

 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C7000/${PV}.STS/${BINFILE};name=${BINFILE_NAME}"

diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
index 2bfd03c2..7120b744 100755
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
+++ b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
@@ -34,4 +34,4 @@ modprobe dsplinkk

 # insert Local Power Manager driver
 #
-modprobe lpm:omap3530
+modprobe lpm_omap3530
diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
index 094d23d1..076af072 100755
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
+++ b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
@@ -38,5 +38,5 @@ mknod /dev/dsplink c `awk "\\$2==\"dsplink\" {print
\\$1}" /proc/devices` 0

 # insert Local Power Manager driver
 #
-modprobe lpm:omap3530
+modprobe lpm_omap3530

diff --git a/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
b/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
index 81d00af8..793d727f 100644
--- a/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
+++ b/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
@@ -1,7 +1,7 @@
 # Unload modules - DMAI - OMAP3530

 # remove lpm module
-rmmod lpm:omap3530
+rmmod lpm_omap3530

 # remove DSP/BIOS Link driver
 rmmod dsplinkk
--
2.33.0
