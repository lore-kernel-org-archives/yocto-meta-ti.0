Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.15411.1588353527434616690
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 May 2020 10:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AfEkxOhM;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nsaulnier@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09562E01AC1; Fri,  1 May 2020 10:18:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1522EE01ABF
	for <meta-ti@yoctoproject.org>; Fri,  1 May 2020 10:18:44 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 041HIiVl096383
	for <meta-ti@yoctoproject.org>; Fri, 1 May 2020 12:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588353524;
	bh=cXlANEq0LzPs2NmJsEf52Dp/0wDVnhpPqodMM3e8X6c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=AfEkxOhME5Mwj6R5/XjvJe4MyXlRahJmeTYDzsao5fy5o8qk8ABL+N8tnjWxpe07e
	 yxzOP/EFC3dd/zrp5MGVMYhWW0Mg8fC1RM7DBB/G0hgn7AU5nrgZZXR1tiZewFBjqY
	 GfiThH4mDzWakyz7telYgZ22edtZv4uRvVUzzbFI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 041HIieK129081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 1 May 2020 12:18:44 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 1 May
 2020 12:18:44 -0500
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
 DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
 15.01.1979.003; Fri, 1 May 2020 12:18:43 -0500
From: "Nick Saulnier" <nsaulnier@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Dmytriyenko, Denys" <denys@ti.com>,
        "Stiffler, Jacob"
	<j-stiffler@ti.com>, "Anna, Suman" <s-anna@ti.com>
Subject: Re: [meta-ti][PATCH v1] pru-icss: update Manifest, PSSP, add am65x tx_pru
Thread-Topic: [meta-ti][PATCH v1] pru-icss: update Manifest, PSSP, add am65x
 tx_pru
Thread-Index: AQHWH9ubUz/lFHfQS0ik43LYpsqrMaiTeVsw
Date: Fri, 1 May 2020 17:18:43 +0000
Message-ID: <809b8c1a36ed414996134ba14e050392@ti.com>
References: <20200501171139.13087-1-nsaulnier@ti.com>
In-Reply-To: <20200501171139.13087-1-nsaulnier@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.63.79]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


-----Original Message-----
From: Saulnier, Nick=20
Sent: Friday, May 01, 2020 12:12 PM
To: meta-ti@yoctoproject.org
Cc: Saulnier, Nick; Dmytriyenko, Denys; Stiffler, Jacob
Subject: [meta-ti][PATCH v1] pru-icss: update Manifest, PSSP, add am65x tx_=
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
index 88d28f37cc5b..1f918dd68857 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -1,16 +1,16 @@
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
+PV =3D "5.7.0"
 PR =3D "r1"
=20
 require recipes-ti/includes/ti-paths.inc
@@ -119,6 +119,8 @@ do_install_append_am65xx() {
                    ${D}/lib/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_=
Halt_${i}.out \
                    ${D}/lib/firmware/pru
+	install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PR=
U_Halt_${i}.out \
+		   ${D}/lib/firmware/pru
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
@@ -217,7 +225,8 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] =3D "/lib/firmwar=
e/j7-txpru1_1-fw"
 ALTERNATIVE_pru-icss-halt =3D "${PRU_ICSS_ALTERNATIVES}"
=20
 # Only Halt firmware images are supported for the Tx_PRU cores
-ALTERNATIVE_pru-icss-halt_append_j7-evm =3D " j7-txpru0_0-fw j7-txpru0_1-f=
w j7-txpru1_0-fw j7-txpru1_1-fw"
+ALTERNATIVE_pru-icss-halt_append_am65xx =3D "am65x-txpru0_0-fw am65x-txpru=
0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1=
-fw"
+ALTERNATIVE_pru-icss-halt_append_j7-evm =3D "j7-txpru0_0-fw j7-txpru0_1-fw=
 j7-txpru1_0-fw j7-txpru1_1-fw"
=20
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] =3D "/lib/firmware/pru/PR=
U_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] =3D "/lib/firmware/pru/PR=
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

