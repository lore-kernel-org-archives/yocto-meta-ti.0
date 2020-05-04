Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.35684.1588556771504263084
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 May 2020 18:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rjgSMUH+;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nsaulnier@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F5BEE01AD9; Sun,  3 May 2020 18:46:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,URIBL_RED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3EC1BE01AD6
	for <meta-ti@yoctoproject.org>; Sun,  3 May 2020 18:46:10 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0441k9FU126442
	for <meta-ti@yoctoproject.org>; Sun, 3 May 2020 20:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588556769;
	bh=KGBK5RC6vDPDFlz7ocK8pcBdqoGqNsrVDuFFzPsMkiM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=rjgSMUH+KhiaZNEtH+CHmZXefECK8uQ9wZFn/0Y0kEAAlxpPa5PHJFdgrzjx+h5yZ
	 xRvtRfM2cymn/7C6HUhEP66BMULclQS+J2dVEVtAh2lRdltZtBkAKXfVmtEvZj2Q77
	 HXvdBs4pnD8HEgMejYCD7HBG0G9swrkLANvJXIP0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0441k99E079849
	for <meta-ti@yoctoproject.org>; Sun, 3 May 2020 20:46:09 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 3 May
 2020 20:46:09 -0500
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
 DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
 15.01.1979.003; Sun, 3 May 2020 20:46:09 -0500
From: "Nick Saulnier" <nsaulnier@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Dmytriyenko, Denys" <denys@ti.com>,
        "Stiffler, Jacob"
	<j-stiffler@ti.com>, "Anna, Suman" <s-anna@ti.com>
Subject: Re: [meta-ti][PATCH v2] pru-icss: update Manifest, PSSP, add am65x tx_pru
Thread-Topic: [meta-ti][PATCH v2] pru-icss: update Manifest, PSSP, add am65x
 tx_pru
Thread-Index: AQHWIbWMBOf3GdPev0SJpDwxz8umJKiXJ7hQ
Date: Mon, 4 May 2020 01:46:09 +0000
Message-ID: <09bd098fe47e41e483b851ad6602cca5@ti.com>
References: <20200504014418.9951-1-nsaulnier@ti.com>
In-Reply-To: <20200504014418.9951-1-nsaulnier@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.95.168]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Removed tabs, placed on master branch instead of Zeus branch.

-----Original Message-----
From: Saulnier, Nick=20
Sent: Sunday, May 03, 2020 8:44 PM
To: meta-ti@yoctoproject.org
Cc: Saulnier, Nick; Dmytriyenko, Denys; Stiffler, Jacob; Anna, Suman
Subject: [meta-ti][PATCH v2] pru-icss: update Manifest, PSSP, add am65x tx_=
pru

- Updated the Software Manifest from 6.0 -> 6.1
	removes GPL-2.0 license from package
	adds j7 processor

- Updated to PRU Software Support Package v5.7.0
	Updated AM65x code for AM65x Silicon Revision 2.0
	Updated software manifest & code to remove GPL-2.0 license
	Minor README improvements

- Add AM65x SR2.0 TX_PRU cores & firmware to recipe

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git=
.bb
index 72888515273b..fc7b6f7dd345 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -1,17 +1,17 @@
 DESCRIPTION =3D "Programmable Real-time Unit Software Package"
 HOMEPAGE =3D "http://processors.wiki.ti.com/index.php/PRU-ICSS"
-LICENSE =3D "BSD-3-Clause & GPL-2.0 & PD"
+LICENSE =3D "BSD-3-Clause & PD"
=20
-LIC_FILES_CHKSUM =3D "file://PRU-Package-v6.0-Manifest.html;md5=3Dea854230=
556f47609efdaedca174b44c"
+LIC_FILES_CHKSUM =3D "file://PRU-Package-v6.1-Manifest.html;md5=3D1e37797e=
be9254922f4278bb6047211c"
=20
 inherit update-alternatives
=20
 BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/pru-software-support-package/pru-software-su=
pport-package.git;protocol=3Dgit;branch=3D${BRANCH}"
-SRCREV =3D "ff252a5e174f1b6aa42931744939f20d25d8e070"
+SRCREV =3D "a9bff6f43001cf66dc1ed3ef7e9dfb688b67f7bb"
=20
-PV =3D "5.6.0"
-PR =3D "r1"
+PV =3D "5.7.0"
+PR =3D "r0"
=20
 require recipes-ti/includes/ti-paths.inc
=20
@@ -119,6 +119,8 @@ do_install_append_am65xx() {
                    ${D}/lib/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_=
Halt_${i}.out \
                    ${D}/lib/firmware/pru
+        install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i=
}/TX_PRU_Halt_${i}.out \
+                   ${D}/lib/firmware/pru
     done
     for i in 0 1 2
     do
@@ -199,6 +201,12 @@ ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] =3D "/lib/firmw=
are/am65x-rtu1_0-fw"
 ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] =3D "/lib/firmware/am65x-rtu1_1-fw"
 ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] =3D "/lib/firmware/am65x-rtu2_0-fw"
 ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] =3D "/lib/firmware/am65x-rtu2_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] =3D "/lib/firmware/am65x-txpru0_0=
-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] =3D "/lib/firmware/am65x-txpru0_1=
-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] =3D "/lib/firmware/am65x-txpru1_0=
-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] =3D "/lib/firmware/am65x-txpru1_1=
-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] =3D "/lib/firmware/am65x-txpru2_0=
-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] =3D "/lib/firmware/am65x-txpru2_1=
-fw"
=20
 ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] =3D "/lib/firmware/j7-pru0_0-fw"
 ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] =3D "/lib/firmware/j7-pru0_1-fw"
@@ -217,6 +225,7 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] =3D "/lib/firmwar=
e/j7-txpru1_1-fw"
 ALTERNATIVE_pru-icss-halt =3D "${PRU_ICSS_ALTERNATIVES}"
=20
 # Only Halt firmware images are supported for the Tx_PRU cores
+ALTERNATIVE_pru-icss-halt_append_am65xx =3D "am65x-txpru0_0-fw am65x-txpru=
0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1=
-fw"
 ALTERNATIVE_pru-icss-halt_append_j7 =3D " j7-txpru0_0-fw j7-txpru0_1-fw j7=
-txpru1_0-fw j7-txpru1_1-fw"
=20
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] =3D "/lib/firmware/pru/PR=
U_Halt.out"
@@ -249,6 +258,12 @@ ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] =3D =
"/lib/firmware/pru/RTU_Halt_
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] =3D "/lib/firmware/pru/R=
TU_Halt_1.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] =3D "/lib/firmware/pru/R=
TU_Halt_0.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] =3D "/lib/firmware/pru/R=
TU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] =3D "/lib/firmware/pru=
/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] =3D "/lib/firmware/pru=
/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] =3D "/lib/firmware/pru=
/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] =3D "/lib/firmware/pru=
/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] =3D "/lib/firmware/pru=
/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] =3D "/lib/firmware/pru=
/TX_PRU_Halt_1.out"
=20
 ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] =3D "/lib/firmware/pru/PRU_=
Halt_0.out"
 ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] =3D "/lib/firmware/pru/PRU_=
Halt_1.out"
--=20
2.17.1

