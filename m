Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.7982.1624972907888668045
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 06:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ElFm+n3q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15TDLl96037400
	for <meta-ti@lists.yoctoproject.org>; Tue, 29 Jun 2021 08:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624972907;
	bh=Ibzll3XA9wQS7P1KfpswJsDZr+iQi5nkc6ZxjCsoB2E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ElFm+n3q4eFC4SANN6NoD3xSYs4H0ZtmMBP/rZOK7xD/8ouralLagvefBh+m3lDSZ
	 6HwlYUq78YoAZ/Cl4cscoYcr8R4XNxZRGb7e9o7QHj5Nb/r7GYq80IV/yqwbIFX8yR
	 zcQR8wQProrsxSn0q+ZE0zL4A/vDRqNk8OKNsYXI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15TDLl9F047066
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 29 Jun 2021 08:21:47 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 08:21:47 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2176.012; Tue, 29 Jun 2021 08:21:47 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: "Strashko, Grygorii" <grygorii.strashko@ti.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Bajjuri,
 Praneeth" <praneeth@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>
CC: "Vutla, Lokesh" <lokeshvutla@ti.com>
Subject: Re: [PATCH dunfell/master] prueth-fw: am65x: SR1.0: Package the firmware images from ti-linux-firmware
Thread-Topic: [PATCH dunfell/master] prueth-fw: am65x: SR1.0:  Package the
 firmware images from ti-linux-firmware
Thread-Index: AQHXaTEKYIzuf1Asn0+6QlgKe4GnJKsrAPEQ
Date: Tue, 29 Jun 2021 13:21:46 +0000
Message-ID: <3822dbf715a34d1693ec6e04805ca4c5@ti.com>
References: <20210624194206.29673-1-grygorii.strashko@ti.com>
In-Reply-To: <20210624194206.29673-1-grygorii.strashko@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.66.120]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Applied to dunfell.=20

-----Original Message-----
From: Strashko, Grygorii=20
Sent: Thursday, June 24, 2021 2:42 PM
To: meta-ti@lists.yoctoproject.org; Bajjuri, Praneeth <praneeth@ti.com>; Ra=
ghavendra, Vignesh <vigneshr@ti.com>; Siraswar, Yogesh <yogeshs@ti.com>
Cc: Vutla, Lokesh <lokeshvutla@ti.com>; Strashko, Grygorii <grygorii.strash=
ko@ti.com>
Subject: [PATCH dunfell/master] prueth-fw: am65x: SR1.0: Package the firmwa=
re images from ti-linux-firmware

Directly take the images from ti-linux-firmware instead of using pdk build,=
 due to inconsistency of PDK releases vs Linux SDK releases vs different So=
Cs.

Update to FW version: REL.CORESDK.08.00.00.20

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb | 46 ++++++++------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/pru=
eth-fw/prueth-fw-am65x_git.bb
index 430e2a4e..d447df33 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -1,43 +1,35 @@
-SUMMARY =3D "PRU Ethernet firmware for AM65x"
-
-require recipes-ti/includes/ti-paths.inc -require recipes-bsp/emac-lld/ema=
c-lld.inc
+SUMMARY =3D "PRU Ethernet firmware for AM65x SR1.0"
=20
 LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://icss_dualmac/src/makefile;beginline=3D6;endli=
ne=3D53;md5=3D3f9129d208f240940749757214bdc191"
-
-PR =3D "r0"
+LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf95621259288c4a4=
6d76"
=20
-TI_PDK_COMP =3D "ti.drv.emac.firmware"
+PV =3D "08.00.00.20"
=20
-B =3D "${S}/icss_dualmac"
+CLEANBROKEN =3D "1"
=20
 COMPATIBLE_MACHINE =3D "am65xx"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-DEPENDS =3D "ti-cgt-pru-native"
-
-EXTRA_OEMAKE +=3D "CL_PRU_INSTALL_PATH=3D"${TI_CGT_PRU_INSTALL_DIR}""
-
-do_compile() {
-    oe_runmake -C src
-}
-
-do_install() {
-    install -d ${D}${base_libdir}/firmware/ti-pruss
+SRCREV =3D "517b0cd8d8d80e91f1f7d80f035e6af041c39726"
+BRANCH ?=3D "ti-linux-firmware"
=20
-    install -m 0644 bin/rxl2_txl2_rgmii0/rxl2_txl2.out \
-        ${D}${base_libdir}/firmware/ti-pruss/am65x-pru0-prueth-fw.elf
+SRC_URI =3D "git://git.ti.com/processor-firmware/ti-linux-firmware.git;pro=
tocol=3Dgit;branch=3D${BRANCH}"
=20
-    install -m 0644 bin/rtu_test0/rtu_v2.out \
-        ${D}${base_libdir}/firmware/ti-pruss/am65x-rtu0-prueth-fw.elf
+S =3D "${WORKDIR}/git"
=20
-    install -m 0644 bin/rxl2_txl2_rgmii1/rxl2_txl2.out \
-        ${D}${base_libdir}/firmware/ti-pruss/am65x-pru1-prueth-fw.elf
+TARGET =3D " \
+    am65x-pru0-prueth-fw.elf \
+    am65x-pru1-prueth-fw.elf \
+    am65x-rtu0-prueth-fw.elf \
+    am65x-rtu1-prueth-fw.elf \
+"
=20
-    install -m 0644 bin/rtu_test1/rtu_v2.out \
-        ${D}${base_libdir}/firmware/ti-pruss/am65x-rtu1-prueth-fw.elf
+do_install() {
+	install -d ${D}${base_libdir}/firmware/ti-pruss
+	for f in ${TARGET}; do
+		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
+	done
 }
=20
 FILES_${PN} =3D "${base_libdir}/firmware"
--
2.17.1

