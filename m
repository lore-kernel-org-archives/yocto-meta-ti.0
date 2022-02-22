Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8976.1645503251260854884
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A96A640C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMDMzhlpyepb for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A5E5F40C7F
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8B136174771
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 17/17] meta-ti: use nonarch_base_libdir for firmware installations
Date: Tue, 22 Feb 2022 04:14:01 +0000
Message-Id: <20220222041401.2840172-18-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Firmware images should always be installed under /lib and hence should us=
e
nonarch_base_libdir, as regular base_libdir is configuration-specific and
doesn't always resolve to /lib.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |   6 +-
 .../cm3-pm-firmware/amx3-cm3_git.bb           |   8 +-
 .../cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb        |  10 +-
 .../recipes-bsp/goodix-fw/goodix-fw_git.bb    |   6 +-
 .../prueth-fw/prueth-fw-am65x-sr2_git.bb      |   6 +-
 .../prueth-fw/prueth-fw-am65x_git.bb          |   6 +-
 .../recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb |   6 +-
 .../pruhsr-fw/pruhsr-fw_2.17.25.bb            |   6 +-
 .../pruprp-fw/pruprp-fw_2.17.25.bb            |   6 +-
 .../prusw-fw/prusw-fw-am65x-sr2_git.bb        |   6 +-
 .../recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb    |   6 +-
 .../ti-img-encode-decode/vxd-dec-fw_git.bb    |   6 +-
 .../recipes-bsp/vis-fw/vis_01.50.07.15.bb     |   6 +-
 .../recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb  |   6 +-
 .../recipes-bsp/vpe-tests/vpe-tests_git.bb    |   4 +-
 .../ti-img-rogue-umlibs_1.13.5776728.bb       |   2 +-
 meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb |   6 +-
 .../recipes-bsp/dspdce-fw/dspdce-fw_git.bb    |  10 +-
 .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb      |  12 +-
 .../recipes-bsp/pru/pru-icss_git.bb           | 362 +++++++++---------
 .../recipes-ti/ipc/ti-ipc-rtos_git.bb         |   6 +-
 21 files changed, 246 insertions(+), 246 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.=
bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index c975e8a4..f6797e2b 100644
--- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -18,8 +18,8 @@ S =3D "${WORKDIR}/git"
 TARGET =3D "mhdp8546.bin"
=20
 do_install() {
-	install -d ${D}${base_libdir}/firmware/cadence
-	install -m 0644 ${S}/cadence/${TARGET} ${D}${base_libdir}/firmware/cade=
nce/${TARGET}
+	install -d ${D}${nonarch_base_libdir}/firmware/cadence
+	install -m 0644 ${S}/cadence/${TARGET} ${D}${nonarch_base_libdir}/firmw=
are/cadence/${TARGET}
 }
=20
-FILES:${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
diff --git a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/me=
ta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index bd5c3693..00486677 100644
--- a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -18,12 +18,12 @@ do_compile() {
 }
=20
 do_install() {
-	install -d ${D}${base_libdir}/firmware
-	install -m 0644 bin/am335x-pm-firmware.elf ${D}${base_libdir}/firmware/
-	install -m 0644 bin/*-scale-data.bin ${D}${base_libdir}/firmware/
+	install -d ${D}${nonarch_base_libdir}/firmware
+	install -m 0644 bin/am335x-pm-firmware.elf ${D}${nonarch_base_libdir}/f=
irmware/
+	install -m 0644 bin/*-scale-data.bin ${D}${nonarch_base_libdir}/firmwar=
e/
 }
=20
-FILES:${PN} +=3D "${base_libdir}/firmware"
+FILES:${PN} +=3D "${nonarch_base_libdir}/firmware"
=20
 COMPATIBLE_MACHINE =3D "(ti-soc)"
 TOOLCHAIN =3D "gcc"
diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b=
/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index ed36951f..371086c1 100755
--- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -21,18 +21,18 @@ CPSW9G_FW_DIR =3D "${S}/ethfw"
 CPSW9G_FW_FILENAME =3D "app_remoteswitchcfg_server_pdk_mem_map_strip.xer=
5f"
=20
 # make sure that lib/firmware, and all its contents are part of the pack=
age
-FILES:${PN} +=3D "${base_libdir}/firmware"
+FILES:${PN} +=3D "${nonarch_base_libdir}/firmware"
=20
 do_install() {
-  install -d ${D}${base_libdir}/firmware
+  install -d ${D}${nonarch_base_libdir}/firmware
 # Ethernet firmware to be loaded on Main R5 core(needs read permission)
-  install -m 0644 ${CPSW9G_FW_DIR}/${CPSW9G_FW_FILENAME} ${D}${base_libd=
ir}/firmware
+  install -m 0644 ${CPSW9G_FW_DIR}/${CPSW9G_FW_FILENAME} ${D}${nonarch_b=
ase_libdir}/firmware
 }
=20
 TARGET_MAIN_R5FSS0_0 =3D "j7-main-r5f0_0-fw"
 ALTERNATIVE:${PN} =3D "j7-main-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/${CPS=
W9G_FW_FILENAME}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/firmwa=
re/${CPSW9G_FW_FILENAME}"
 ALTERNATIVE_PRIORITY =3D "17"
=20
 INHIBIT_PACKAGE_STRIP =3D "1"
diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
index 1f1c2b81..00a6e51b 100644
--- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
@@ -19,8 +19,8 @@ ORIGIN =3D "DRA71x-RevA-GT9271_SpecDig_Config.bin"
 TARGET =3D "goodix_9271_cfg.bin"
=20
 do_install() {
-	install -d ${D}${base_libdir}/firmware
-	install -m 0644 ${S}/ti-evm/${ORIGIN} ${D}${base_libdir}/firmware/${TAR=
GET}
+	install -d ${D}${nonarch_base_libdir}/firmware
+	install -m 0644 ${S}/ti-evm/${ORIGIN} ${D}${nonarch_base_libdir}/firmwa=
re/${TARGET}
 }
=20
-FILES:${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb=
 b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index e398cc80..4eb48959 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -23,12 +23,12 @@ TARGET =3D " \
 "
=20
 do_install() {
-	install -d ${D}${base_libdir}/firmware/ti-pruss
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
 	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/=
$f
+		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/t=
i-pruss/$f
 	done
 }
=20
-FILES:${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
=20
 INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/m=
eta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
index 804a563f..c656ceab 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -21,12 +21,12 @@ TARGET =3D " \
 "
=20
 do_install() {
-	install -d ${D}${base_libdir}/firmware/ti-pruss
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
 	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/=
$f
+		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/t=
i-pruss/$f
 	done
 }
=20
-FILES:${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
=20
 INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/meta=
-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
index 4ca06be0..9ccce938 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
@@ -19,13 +19,13 @@ TARGET:am57xx-evm =3D "am57xx-pru0-prueth-fw.elf am57=
xx-pru1-prueth-fw.elf"
 TARGET:am57xx-hs-evm =3D "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-f=
w.elf"
=20
 do_install() {
-	install -d ${D}${base_libdir}/firmware/ti-pruss
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
 	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/=
$f
+		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/t=
i-pruss/$f
 	done
 }
=20
=20
-FILES:${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
=20
 INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/met=
a-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
index 618b1ad6..4ffd13aa 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
@@ -20,12 +20,12 @@ TARGET:am57xx-evm =3D "am57xx-pru0-pruhsr-fw.elf am57=
xx-pru1-pruhsr-fw.elf"
 TARGET:am57xx-hs-evm =3D "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-f=
w.elf"
=20
 do_install() {
-	install -d ${D}${base_libdir}/firmware/ti-pruss
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
 	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/=
$f
+		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/t=
i-pruss/$f
 	done
 }
=20
-FILES:${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
=20
 INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/met=
a-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
index 707640b4..23c422dd 100644
--- a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
@@ -21,12 +21,12 @@ TARGET:am57xx-hs-evm =3D "am57xx-pru0-pruprp-fw.elf a=
m57xx-pru1-pruprp-fw.elf"
=20
=20
 do_install() {
-	install -d ${D}${base_libdir}/firmware/ti-pruss
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
 	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/=
$f
+		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/t=
i-pruss/$f
 	done
 }
=20
-FILES:${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
=20
 INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b=
/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
index 2d0d3f9e..97adf6fc 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
@@ -23,12 +23,12 @@ TARGET =3D " \
 "
=20
 do_install() {
-	install -d ${D}${base_libdir}/firmware/ti-pruss
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
 	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/=
$f
+		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/t=
i-pruss/$f
 	done
 }
=20
-FILES:${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
=20
 INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/meta-ti=
-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
index 3ded0dc4..8d784768 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
@@ -19,13 +19,13 @@ TARGET:am57xx-evm =3D "am57xx-pru0-prusw-fw.elf am57x=
x-pru1-prusw-fw.elf"
 TARGET:am57xx-hs-evm =3D "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.=
elf"
=20
 do_install() {
-	install -d ${D}${base_libdir}/firmware/ti-pruss
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
 	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/=
$f
+		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/t=
i-pruss/$f
 	done
 }
=20
=20
-FILES:${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
=20
 INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.=
bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
index 3563cc7e..7727e9af 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -17,8 +17,8 @@ S =3D "${WORKDIR}/git"
 TARGET =3D "pvdec_full_bin.fw"
=20
 do_install() {
-        install -d ${D}${base_libdir}/firmware
-        install -m 0644 ${S}/ti-img/${TARGET} ${D}${base_libdir}/firmwar=
e/${TARGET}
+        install -d ${D}${nonarch_base_libdir}/firmware
+        install -m 0644 ${S}/ti-img/${TARGET} ${D}${nonarch_base_libdir}=
/firmware/${TARGET}
 }
=20
-FILES:${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-=
bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 498be36b..7d16ae39 100644
--- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -18,16 +18,16 @@ DSPAPP =3D "dra7-dsp1-fw-radio.xe66"
 GPPAPP =3D "RadioApp"
=20
 do_install() {
-    install -d ${D}${base_libdir}/firmware
+    install -d ${D}${nonarch_base_libdir}/firmware
     install -d ${D}${bindir}
-    install ${S}/prebuilt/${DSPAPP} ${D}${base_libdir}/firmware/${DSPAPP=
}
+    install ${S}/prebuilt/${DSPAPP} ${D}${nonarch_base_libdir}/firmware/=
${DSPAPP}
     install -m 0755 ${S}/prebuilt/${GPPAPP} ${D}${bindir}/${GPPAPP}
 }
=20
 PACKAGES +=3D "${PN}-fw"
 RDEPENDS:${PN} +=3D "${PN}-fw"
=20
-FILES:${PN}-fw +=3D "${base_libdir}/firmware/${DSPAPP}"
+FILES:${PN}-fw +=3D "${nonarch_base_libdir}/firmware/${DSPAPP}"
=20
 INSANE_SKIP:${PN} =3D "ldflags"
 INSANE_SKIP:${PN}-fw =3D "arch"
diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-=
ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
index c7b2a7bb..673634da 100644
--- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
+++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
@@ -16,10 +16,10 @@ S =3D "${WORKDIR}/vpdma-fw-${PV}"
 TARGET =3D "vpdma-1b8.bin"
=20
 do_install() {
-    mkdir -p ${D}${base_libdir}/firmware
-    cp ${S}/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+    mkdir -p ${D}${nonarch_base_libdir}/firmware
+    cp ${S}/${TARGET} ${D}${nonarch_base_libdir}/firmware/${TARGET}
 }
=20
-FILES:${PN} +=3D "${base_libdir}/firmware/${TARGET}"
+FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/${TARGET}"
=20
 PR =3D "r1"
diff --git a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb b/meta-ti=
-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
index 9447f44d..5ca6b62e 100644
--- a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -25,6 +25,6 @@ EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D"${TARGET_PREFIX}" CC=
=3D"${TARGET_PREFIX}gcc ${FLOAT
=20
 do_install() {
     oe_runmake DESTDIR=3D"${D}" install
-    rm -rf ${D}${base_libdir}/firmware/vpdma-*.bin
-    rmdir -p ${D}${base_libdir}/firmware || true
+    rm -rf ${D}${nonarch_base_libdir}/firmware/vpdma-*.bin
+    rmdir -p ${D}${nonarch_base_libdir}/firmware || true
 }
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.1=
3.5776728.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1=
.13.5776728.bb
index 1ff4b65a..f54c3ee9 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.57767=
28.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.57767=
28.bb
@@ -54,7 +54,7 @@ do_install () {
     chown -R root:root ${D}
 }
=20
-FILES:${PN} +=3D " ${base_libdir}/firmware/"
+FILES:${PN} +=3D " ${nonarch_base_libdir}/firmware/"
 FILES:${PN} +=3D " ${datadir}/"
=20
 PACKAGES =3D+ "${PN}-plugins"
diff --git a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-extr=
as/recipes-bsp/bt-fw/bt-fw_git.bb
index ea42c168..28edf614 100644
--- a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
@@ -17,8 +17,8 @@ do_compile() {
 }
=20
 do_install() {
-    install -d ${D}${base_libdir}/firmware/ti-connectivity
-    oe_runmake "DEST_DIR=3D${D}" "BASE_LIB_DIR=3D${base_libdir}" install
+    install -d ${D}${nonarch_base_libdir}/firmware/ti-connectivity
+    oe_runmake "DEST_DIR=3D${D}" "BASE_LIB_DIR=3D${nonarch_base_libdir}"=
 install
 }
=20
-FILES:${PN} +=3D "${base_libdir}/firmware/ti-connectivity/*"
+FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/ti-connectivity/*"
diff --git a/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/meta=
-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 4e863099..d9d4ef7e 100644
--- a/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -51,15 +51,15 @@ do_compile() {
 TARGET =3D "dra7-dsp1-fw.xe66"
=20
 do_install() {
-    install -d ${D}${base_libdir}/firmware
-    install -m 0644 ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmwar=
e/${TARGET}.${BPN}
+    install -d ${D}${nonarch_base_libdir}/firmware
+    install -m 0644 ${S}/dra7xx-c66x-dsp.xe66 ${D}${nonarch_base_libdir}=
/firmware/${TARGET}.${BPN}
 }
=20
 ALTERNATIVE:${PN} =3D "dra7-dsp1-fw.xe66"
-ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/${=
TARGET}"
-ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/${TAR=
GET}.${BPN}"
+ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] =3D "${nonarch_base_libdir}/fir=
mware/${TARGET}"
+ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] =3D "${nonarch_base_libdir}/firmwa=
re/${TARGET}.${BPN}"
 ALTERNATIVE_PRIORITY =3D "10"
=20
 INSANE_SKIP:${PN} =3D "arch"
=20
-FILES:${PN} +=3D "${base_libdir}/firmware/*"
+FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/*"
diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-t=
i-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 14d28258..e2302d58 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -54,14 +54,14 @@ TARGET =3D "dra7-ipu2-fw.xem4"
 TARGET_MAP =3D "platform/ti/dce/baseimage/package/cfg/out/ipu/release/ip=
u.xem4.map"
=20
 do_install() {
-    install -d ${D}${base_libdir}/firmware
-    install -m 0644 ${S}/${TARGET} ${D}${base_libdir}/firmware/${TARGET}=
.${BPN}
-    install -m 0644 ${S}/${TARGET_MAP} ${D}${base_libdir}/firmware/${TAR=
GET}.map
+    install -d ${D}${nonarch_base_libdir}/firmware
+    install -m 0644 ${S}/${TARGET} ${D}${nonarch_base_libdir}/firmware/$=
{TARGET}.${BPN}
+    install -m 0644 ${S}/${TARGET_MAP} ${D}${nonarch_base_libdir}/firmwa=
re/${TARGET}.map
 }
=20
 ALTERNATIVE:${PN} =3D "dra7-ipu2-fw.xem4"
-ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] =3D "${base_libdir}/firmware/${=
TARGET}"
-ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${base_libdir}/firmware/${TAR=
GET}.${BPN}"
+ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/fir=
mware/${TARGET}"
+ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/firmwa=
re/${TARGET}.${BPN}"
 ALTERNATIVE_PRIORITY =3D "20"
=20
-FILES:${PN} +=3D "${base_libdir}/firmware/*"
+FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/*"
diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-ext=
ras/recipes-bsp/pru/pru-icss_git.bb
index 779f96fd..130fd3d5 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -53,7 +53,7 @@ do_compile() {
=20
 do_install() {
     CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
-    install -d ${D}${base_libdir}/firmware/pru
+    install -d ${D}${nonarch_base_libdir}/firmware/pru
     install -d ${D}${includedir}
     cp ${CP_ARGS} ${S}/include/* ${D}${includedir}
     install -d ${D}${libdir}
@@ -65,36 +65,36 @@ FILES:${PN}-dev =3D "${includedir}"
=20
 do_install:append:ti33x() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
     for i in 0 1
     do
         install -m 0644 ${S}/examples/am335x/PRU_RPMsg_Echo_Interrupt${i=
}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
-                        ${D}${base_libdir}/firmware/pru
+                        ${D}${nonarch_base_libdir}/firmware/pru
     done
 }
=20
 do_install:append:ti43x() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
     for i in 0 1
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrup=
t${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}${base_libdir}/firmware/pru
+                            ${D}${nonarch_base_libdir}/firmware/pru
         done
     done
 }
=20
 do_install:append:omap-a15() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
     for i in 1 2
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/am572x/PRU_RPMsg_Echo_Interrup=
t${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}${base_libdir}/firmware/pru
+                            ${D}${nonarch_base_libdir}/firmware/pru
         done
     done
 }
@@ -103,20 +103,20 @@ do_install:append:am64xx(){
     for i in 0 1
     do
         install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PR=
U_Halt_${i}.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RT=
U_Halt_${i}.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU$=
{i}/TX_PRU_Halt_${i}.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
     done
     for i in 0 1
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/${PLATFORM}/PRU_RPMsg_Echo_Int=
errupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}${base_libdir}/firmware/pru
+                            ${D}${nonarch_base_libdir}/firmware/pru
             install -m 0644 ${S}/examples/${PLATFORM}/RTU_RPMsg_Echo_Int=
errupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}${base_libdir}/firmware/pru
+                            ${D}${nonarch_base_libdir}/firmware/pru
         done
     done
 }
@@ -125,20 +125,20 @@ do_install:append:am65xx() {
     for i in 0 1=20
     do
         install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PR=
U_Halt_${i}.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RT=
U_Halt_${i}.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU$=
{i}/TX_PRU_Halt_${i}.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
     done
     for i in 0 1 2
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/am65x/PRU_RPMsg_Echo_Interrupt=
${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}${base_libdir}/firmware/pru
+                            ${D}${nonarch_base_libdir}/firmware/pru
             install -m 0644 ${S}/examples/am65x/RTU_RPMsg_Echo_Interrupt=
${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}${base_libdir}/firmware/pru
+                            ${D}${nonarch_base_libdir}/firmware/pru
=20
         done
     done
@@ -148,28 +148,28 @@ do_install:append:j7() {
     for i in 0 1
     do
         install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PR=
U_Halt_${i}.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RT=
U_Halt_${i}.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU$=
{i}/TX_PRU_Halt_${i}.out \
-                   ${D}${base_libdir}/firmware/pru
+                   ${D}${nonarch_base_libdir}/firmware/pru
     done
     for i in 0 1
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/j721e/PRU_RPMsg_Echo_Interrupt=
${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}${base_libdir}/firmware/pru
+                            ${D}${nonarch_base_libdir}/firmware/pru
             install -m 0644 ${S}/examples/j721e/RTU_RPMsg_Echo_Interrupt=
${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}${base_libdir}/firmware/pru
+                            ${D}${nonarch_base_libdir}/firmware/pru
=20
         done
     done
 }
=20
=20
-FILES:${PN}-halt =3D "${base_libdir}/firmware/pru/PRU_Halt* ${base_libdi=
r}/firmware/pru/RTU_Halt* ${base_libdir}/firmware/pru/TX_PRU_Halt*"
-FILES:${PN}-rpmsg-echo =3D "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_I=
nterrupt* ${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
+FILES:${PN}-halt =3D "${nonarch_base_libdir}/firmware/pru/PRU_Halt* ${no=
narch_base_libdir}/firmware/pru/RTU_Halt* ${nonarch_base_libdir}/firmware=
/pru/TX_PRU_Halt*"
+FILES:${PN}-rpmsg-echo =3D "${nonarch_base_libdir}/firmware/pru/PRU_RPMs=
g_Echo_Interrupt* ${nonarch_base_libdir}/firmware/pru/RTU_RPMsg_Echo_Inte=
rrupt*"
=20
 # Set up names for the firmwares
 PRU_ICSS_ALTERNATIVES:ti33x    =3D "am335x-pru0-fw am335x-pru1-fw"
@@ -180,63 +180,63 @@ PRU_ICSS_ALTERNATIVES:am65xx   =3D "am65x-pru0_0-fw=
 am65x-pru0_1-fw am65x-pru1_0-f
 PRU_ICSS_ALTERNATIVES:j7       =3D "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-=
fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
=20
 # Set up link names for the firmwares
-ALTERNATIVE_LINK_NAME[am335x-pru0-fw] =3D "${base_libdir}/firmware/am335=
x-pru0-fw"
-ALTERNATIVE_LINK_NAME[am335x-pru1-fw] =3D "${base_libdir}/firmware/am335=
x-pru1-fw"
-
-ALTERNATIVE_LINK_NAME[am437x-pru0_0-fw] =3D "${base_libdir}/firmware/am4=
37x-pru0_0-fw"
-ALTERNATIVE_LINK_NAME[am437x-pru0_1-fw] =3D "${base_libdir}/firmware/am4=
37x-pru0_1-fw"
-ALTERNATIVE_LINK_NAME[am437x-pru1_0-fw] =3D "${base_libdir}/firmware/am4=
37x-pru1_0-fw"
-ALTERNATIVE_LINK_NAME[am437x-pru1_1-fw] =3D "${base_libdir}/firmware/am4=
37x-pru1_1-fw"
-
-ALTERNATIVE_LINK_NAME[am57xx-pru1_0-fw] =3D "${base_libdir}/firmware/am5=
7xx-pru1_0-fw"
-ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] =3D "${base_libdir}/firmware/am5=
7xx-pru1_1-fw"
-ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] =3D "${base_libdir}/firmware/am5=
7xx-pru2_0-fw"
-ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] =3D "${base_libdir}/firmware/am5=
7xx-pru2_1-fw"
-
-ALTERNATIVE_LINK_NAME[am64x-pru0_0-fw] =3D "${base_libdir}/firmware/am64=
x-pru0_0-fw"
-ALTERNATIVE_LINK_NAME[am64x-pru0_1-fw] =3D "${base_libdir}/firmware/am64=
x-pru0_1-fw"
-ALTERNATIVE_LINK_NAME[am64x-pru1_0-fw] =3D "${base_libdir}/firmware/am64=
x-pru1_0-fw"
-ALTERNATIVE_LINK_NAME[am64x-pru1_1-fw] =3D "${base_libdir}/firmware/am64=
x-pru1_1-fw"
-ALTERNATIVE_LINK_NAME[am64x-rtu0_0-fw] =3D "${base_libdir}/firmware/am64=
x-rtu0_0-fw"
-ALTERNATIVE_LINK_NAME[am64x-rtu0_1-fw] =3D "${base_libdir}/firmware/am64=
x-rtu0_1-fw"
-ALTERNATIVE_LINK_NAME[am64x-rtu1_0-fw] =3D "${base_libdir}/firmware/am64=
x-rtu1_0-fw"
-ALTERNATIVE_LINK_NAME[am64x-rtu1_1-fw] =3D "${base_libdir}/firmware/am64=
x-rtu1_1-fw"
-ALTERNATIVE_LINK_NAME[am64x-txpru0_0-fw] =3D "${base_libdir}/firmware/am=
64x-txpru0_0-fw"
-ALTERNATIVE_LINK_NAME[am64x-txpru0_1-fw] =3D "${base_libdir}/firmware/am=
64x-txpru0_1-fw"
-ALTERNATIVE_LINK_NAME[am64x-txpru1_0-fw] =3D "${base_libdir}/firmware/am=
64x-txpru1_0-fw"
-ALTERNATIVE_LINK_NAME[am64x-txpru1_1-fw] =3D "${base_libdir}/firmware/am=
64x-txpru1_1-fw"
-
-ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] =3D "${base_libdir}/firmware/am65=
x-pru0_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] =3D "${base_libdir}/firmware/am65=
x-pru0_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] =3D "${base_libdir}/firmware/am65=
x-pru1_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-pru1_1-fw] =3D "${base_libdir}/firmware/am65=
x-pru1_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-pru2_0-fw] =3D "${base_libdir}/firmware/am65=
x-pru2_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-pru2_1-fw] =3D "${base_libdir}/firmware/am65=
x-pru2_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu0_0-fw] =3D "${base_libdir}/firmware/am65=
x-rtu0_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu0_1-fw] =3D "${base_libdir}/firmware/am65=
x-rtu0_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] =3D "${base_libdir}/firmware/am65=
x-rtu1_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] =3D "${base_libdir}/firmware/am65=
x-rtu1_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] =3D "${base_libdir}/firmware/am65=
x-rtu2_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] =3D "${base_libdir}/firmware/am65=
x-rtu2_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] =3D "${base_libdir}/firmware/am=
65x-txpru0_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] =3D "${base_libdir}/firmware/am=
65x-txpru0_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] =3D "${base_libdir}/firmware/am=
65x-txpru1_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] =3D "${base_libdir}/firmware/am=
65x-txpru1_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] =3D "${base_libdir}/firmware/am=
65x-txpru2_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] =3D "${base_libdir}/firmware/am=
65x-txpru2_1-fw"
-
-ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] =3D "${base_libdir}/firmware/j7-pru0=
_0-fw"
-ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] =3D "${base_libdir}/firmware/j7-pru0=
_1-fw"
-ALTERNATIVE_LINK_NAME[j7-pru1_0-fw] =3D "${base_libdir}/firmware/j7-pru1=
_0-fw"
-ALTERNATIVE_LINK_NAME[j7-pru1_1-fw] =3D "${base_libdir}/firmware/j7-pru1=
_1-fw"
-ALTERNATIVE_LINK_NAME[j7-rtu0_0-fw] =3D "${base_libdir}/firmware/j7-rtu0=
_0-fw"
-ALTERNATIVE_LINK_NAME[j7-rtu0_1-fw] =3D "${base_libdir}/firmware/j7-rtu0=
_1-fw"
-ALTERNATIVE_LINK_NAME[j7-rtu1_0-fw] =3D "${base_libdir}/firmware/j7-rtu1=
_0-fw"
-ALTERNATIVE_LINK_NAME[j7-rtu1_1-fw] =3D "${base_libdir}/firmware/j7-rtu1=
_1-fw"
-ALTERNATIVE_LINK_NAME[j7-txpru0_0-fw] =3D "${base_libdir}/firmware/j7-tx=
pru0_0-fw"
-ALTERNATIVE_LINK_NAME[j7-txpru0_1-fw] =3D "${base_libdir}/firmware/j7-tx=
pru0_1-fw"
-ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] =3D "${base_libdir}/firmware/j7-tx=
pru1_0-fw"
-ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] =3D "${base_libdir}/firmware/j7-tx=
pru1_1-fw"
+ALTERNATIVE_LINK_NAME[am335x-pru0-fw] =3D "${nonarch_base_libdir}/firmwa=
re/am335x-pru0-fw"
+ALTERNATIVE_LINK_NAME[am335x-pru1-fw] =3D "${nonarch_base_libdir}/firmwa=
re/am335x-pru1-fw"
+
+ALTERNATIVE_LINK_NAME[am437x-pru0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/am437x-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[am437x-pru0_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/am437x-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[am437x-pru1_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/am437x-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am437x-pru1_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/am437x-pru1_1-fw"
+
+ALTERNATIVE_LINK_NAME[am57xx-pru1_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/am57xx-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/am57xx-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/am57xx-pru2_0-fw"
+ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/am57xx-pru2_1-fw"
+
+ALTERNATIVE_LINK_NAME[am64x-pru0_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-pru0_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-pru1_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-pru1_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu0_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-rtu0_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu0_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-rtu0_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu1_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-rtu1_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu1_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-rtu1_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/am64x-txpru0_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru0_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/am64x-txpru0_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru1_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/am64x-txpru1_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru1_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/am64x-txpru1_1-fw"
+
+ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru1_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru2_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-pru2_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru2_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-pru2_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu0_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-rtu0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu0_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-rtu0_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-rtu1_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-rtu1_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-rtu2_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am65x-rtu2_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/am65x-txpru0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/am65x-txpru0_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/am65x-txpru1_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/am65x-txpru1_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/am65x-txpru2_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/am65x-txpru2_1-fw"
+
+ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] =3D "${nonarch_base_libdir}/firmware=
/j7-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] =3D "${nonarch_base_libdir}/firmware=
/j7-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-pru1_0-fw] =3D "${nonarch_base_libdir}/firmware=
/j7-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[j7-pru1_1-fw] =3D "${nonarch_base_libdir}/firmware=
/j7-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu0_0-fw] =3D "${nonarch_base_libdir}/firmware=
/j7-rtu0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu0_1-fw] =3D "${nonarch_base_libdir}/firmware=
/j7-rtu0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu1_0-fw] =3D "${nonarch_base_libdir}/firmware=
/j7-rtu1_0-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu1_1-fw] =3D "${nonarch_base_libdir}/firmware=
/j7-rtu1_1-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru0_0-fw] =3D "${nonarch_base_libdir}/firmwa=
re/j7-txpru0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru0_1-fw] =3D "${nonarch_base_libdir}/firmwa=
re/j7-txpru0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] =3D "${nonarch_base_libdir}/firmwa=
re/j7-txpru1_0-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] =3D "${nonarch_base_libdir}/firmwa=
re/j7-txpru1_1-fw"
=20
 # Create the pru-icss-halt firmware alternatives
 ALTERNATIVE:pru-icss-halt =3D "${PRU_ICSS_ALTERNATIVES}"
@@ -246,63 +246,63 @@ ALTERNATIVE:pru-icss-halt:append:am64xx =3D " am64x=
-txpru0_0-fw am64x-txpru0_1-fw
 ALTERNATIVE:pru-icss-halt:append:am65xx =3D " am65x-txpru0_0-fw am65x-tx=
pru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txp=
ru2_1-fw"
 ALTERNATIVE:pru-icss-halt:append:j7 =3D " j7-txpru0_0-fw j7-txpru0_1-fw =
j7-txpru1_0-fw j7-txpru1_1-fw"
=20
-ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] =3D "${base_libdir}/fir=
mware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] =3D "${base_libdir}/fir=
mware/pru/PRU_Halt.out"
-
-ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_0-fw] =3D "${base_libdir}/f=
irmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_1-fw] =3D "${base_libdir}/f=
irmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_0-fw] =3D "${base_libdir}/f=
irmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_1-fw] =3D "${base_libdir}/f=
irmware/pru/PRU_Halt.out"
-
-ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_0-fw] =3D "${base_libdir}/f=
irmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] =3D "${base_libdir}/f=
irmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] =3D "${base_libdir}/f=
irmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] =3D "${base_libdir}/f=
irmware/pru/PRU_Halt.out"
-
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_0-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_1-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_0-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_1-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu0_0-fw] =3D "${base_libdir}/fi=
rmware/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu0_1-fw] =3D "${base_libdir}/fi=
rmware/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu1_0-fw] =3D "${base_libdir}/fi=
rmware/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu1_1-fw] =3D "${base_libdir}/fi=
rmware/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru0_0-fw] =3D "${base_libdir}/=
firmware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru0_1-fw] =3D "${base_libdir}/=
firmware/pru/TX_PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru1_0-fw] =3D "${base_libdir}/=
firmware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru1_1-fw] =3D "${base_libdir}/=
firmware/pru/TX_PRU_Halt_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_1-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_0-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_1-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_0-fw] =3D "${base_libdir}/fi=
rmware/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_1-fw] =3D "${base_libdir}/fi=
rmware/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] =3D "${base_libdir}/fi=
rmware/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] =3D "${base_libdir}/fi=
rmware/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] =3D "${base_libdir}/fi=
rmware/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] =3D "${base_libdir}/fi=
rmware/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] =3D "${base_libdir}/=
firmware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] =3D "${base_libdir}/=
firmware/pru/TX_PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] =3D "${base_libdir}/=
firmware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] =3D "${base_libdir}/=
firmware/pru/TX_PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] =3D "${base_libdir}/=
firmware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] =3D "${base_libdir}/=
firmware/pru/TX_PRU_Halt_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] =3D "${base_libdir}/firmw=
are/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] =3D "${base_libdir}/firmw=
are/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_0-fw] =3D "${base_libdir}/firmw=
are/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_1-fw] =3D "${base_libdir}/firmw=
are/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_0-fw] =3D "${base_libdir}/firmw=
are/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_1-fw] =3D "${base_libdir}/firmw=
are/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_0-fw] =3D "${base_libdir}/firmw=
are/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_1-fw] =3D "${base_libdir}/firmw=
are/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_0-fw] =3D "${base_libdir}/fir=
mware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_1-fw] =3D "${base_libdir}/fir=
mware/pru/TX_PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_0-fw] =3D "${base_libdir}/fir=
mware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] =3D "${base_libdir}/fir=
mware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] =3D "${nonarch_base_lib=
dir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] =3D "${nonarch_base_lib=
dir}/firmware/pru/PRU_Halt.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_0-fw] =3D "${nonarch_base_l=
ibdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_1-fw] =3D "${nonarch_base_l=
ibdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_0-fw] =3D "${nonarch_base_l=
ibdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_1-fw] =3D "${nonarch_base_l=
ibdir}/firmware/pru/PRU_Halt.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_0-fw] =3D "${nonarch_base_l=
ibdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] =3D "${nonarch_base_l=
ibdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] =3D "${nonarch_base_l=
ibdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] =3D "${nonarch_base_l=
ibdir}/firmware/pru/PRU_Halt.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu0_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu0_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu1_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu1_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru0_0-fw] =3D "${nonarch_base_=
libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru0_1-fw] =3D "${nonarch_base_=
libdir}/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru1_0-fw] =3D "${nonarch_base_=
libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru1_1-fw] =3D "${nonarch_base_=
libdir}/firmware/pru/TX_PRU_Halt_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] =3D "${nonarch_base_=
libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] =3D "${nonarch_base_=
libdir}/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] =3D "${nonarch_base_=
libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] =3D "${nonarch_base_=
libdir}/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] =3D "${nonarch_base_=
libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] =3D "${nonarch_base_=
libdir}/firmware/pru/TX_PRU_Halt_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] =3D "${nonarch_base_libdi=
r}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] =3D "${nonarch_base_libdi=
r}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_0-fw] =3D "${nonarch_base_libdi=
r}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_1-fw] =3D "${nonarch_base_libdi=
r}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_0-fw] =3D "${nonarch_base_libdi=
r}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_1-fw] =3D "${nonarch_base_libdi=
r}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_0-fw] =3D "${nonarch_base_libdi=
r}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_1-fw] =3D "${nonarch_base_libdi=
r}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_0-fw] =3D "${nonarch_base_lib=
dir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_1-fw] =3D "${nonarch_base_lib=
dir}/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_0-fw] =3D "${nonarch_base_lib=
dir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] =3D "${nonarch_base_lib=
dir}/firmware/pru/TX_PRU_Halt_1.out"
=20
=20
 ALTERNATIVE_PRIORITY_pru-icss-halt =3D "50"
@@ -310,49 +310,49 @@ ALTERNATIVE_PRIORITY_pru-icss-halt =3D "50"
 # Create the pru-icss-rpmsg-echo firmware alternatives
 ALTERNATIVE:pru-icss-rpmsg-echo =3D "${PRU_ICSS_ALTERNATIVES}"
=20
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] =3D "${base_libdi=
r}/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] =3D "${base_libdi=
r}/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
-
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_0-fw] =3D "${base_lib=
dir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_1-fw] =3D "${base_lib=
dir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] =3D "${base_lib=
dir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] =3D "${base_lib=
dir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_0-fw] =3D "${base_lib=
dir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] =3D "${base_lib=
dir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] =3D "${base_lib=
dir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] =3D "${base_lib=
dir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_0-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_1-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_0-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_1-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu0_0-fw] =3D "${base_libd=
ir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu0_1-fw] =3D "${base_libd=
ir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu1_0-fw] =3D "${base_libd=
ir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu1_1-fw] =3D "${base_libd=
ir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_1-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_0-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_1-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_0-fw] =3D "${base_libd=
ir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_1-fw] =3D "${base_libd=
ir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_0-fw] =3D "${base_libd=
ir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] =3D "${base_libd=
ir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] =3D "${base_libd=
ir}/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] =3D "${base_libd=
ir}/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_0-fw] =3D "${base_libdir}=
/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_1-fw] =3D "${base_libdir}=
/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_0-fw] =3D "${base_libdir}=
/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_1-fw] =3D "${base_libdir}=
/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_0-fw] =3D "${base_libdir}=
/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_1-fw] =3D "${base_libdir}=
/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_0-fw] =3D "${base_libdir}=
/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] =3D "${base_libdir}=
/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] =3D "${nonarch_ba=
se_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] =3D "${nonarch_ba=
se_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_0-fw] =3D "${nonarch_=
base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_1-fw] =3D "${nonarch_=
base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] =3D "${nonarch_=
base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] =3D "${nonarch_=
base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_0-fw] =3D "${nonarch_=
base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] =3D "${nonarch_=
base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] =3D "${nonarch_=
base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] =3D "${nonarch_=
base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu0_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu0_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu1_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu1_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_0-fw] =3D "${nonarch_base=
_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_1-fw] =3D "${nonarch_base=
_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_0-fw] =3D "${nonarch_base=
_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_1-fw] =3D "${nonarch_base=
_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_0-fw] =3D "${nonarch_base=
_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_1-fw] =3D "${nonarch_base=
_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_0-fw] =3D "${nonarch_base=
_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] =3D "${nonarch_base=
_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
=20
 ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo =3D "100"
=20
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-e=
xtras/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 60230a07..999993ea 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -5,7 +5,7 @@ require ti-ipc-rtos.inc
 DEPENDS =3D "ti-xdctools-native ti-sysbios doxygen-native zip-native"
=20
 PACKAGES =3D+ "${PN}-fw"
-FILES:${PN}-fw =3D "${base_libdir}/firmware/*"
+FILES:${PN}-fw =3D "${nonarch_base_libdir}/firmware/*"
 FILES:${PN}-dev +=3D "${IPC_INSTALL_DIR_RECIPE}"
=20
 INSANE_SKIP:${PN}-fw +=3D "arch"
@@ -68,8 +68,8 @@ do_install() {
   install -d ${D}${IPC_INSTALL_DIR_RECIPE}
   cp ${CP_ARGS} ${IPC_PACKAGE_DIR}/* -d ${D}${IPC_INSTALL_DIR_RECIPE}
=20
-  install -d ${D}${base_libdir}/firmware/ipc
-  cp ${CP_ARGS} ${S}/packages/ti/ipc/tests/bin/* ${D}${base_libdir}/firm=
ware/ipc || true
+  install -d ${D}${nonarch_base_libdir}/firmware/ipc
+  cp ${CP_ARGS} ${S}/packages/ti/ipc/tests/bin/* ${D}${nonarch_base_libd=
ir}/firmware/ipc || true
 }
=20
 KFDSPNUM =3D "0"
--=20
2.25.1

