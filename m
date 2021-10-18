Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.31116.1634524780856819392
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 17 Oct 2021 19:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oJqAGECF;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nsaulnier@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19I2ddr3054047
	for <meta-ti@lists.yoctoproject.org>; Sun, 17 Oct 2021 21:39:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634524779;
	bh=7KFteFVvel1epMK2UeoPDkQ9zz5LFgyh1dS24q6xcNg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=oJqAGECFqHVcnqJ6iuoDhiDADu5/lX9WcjlMCDclAiCWA32gGqQROjlz5fr/zLCzD
	 2lOQmnd3wZb9NrCDmOPg66D1OXncmBuoh1UBay2tiYxjOfZkAvIK2Kkvss/R5mKTQz
	 6IjcmgWhwc3TRc1p4vDHt+ZyeAX3nZqsa7I5usYE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19I2ddej130268
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 17 Oct 2021 21:39:39 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sun, 17
 Oct 2021 21:39:39 -0500
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
 DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
 15.01.2308.014; Sun, 17 Oct 2021 21:39:39 -0500
From: "Nick Saulnier" <nsaulnier@ti.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
CC: "Siraswar, Yogesh" <yogeshs@ti.com>, Kishon Vijay Abraham <kishon@ti.com>,
        "Anna, Suman" <s-anna@ti.com>
Subject: Re: [meta-ti][master/dunfell PATCH v1] pru-icss_git.bb: add AM64x, update to PSSP v6.0.0
Thread-Topic: [meta-ti][master/dunfell PATCH v1] pru-icss_git.bb: add AM64x,
 update to PSSP v6.0.0
Thread-Index: AQHXw8j1vOZlfczSXEGKQ2MEElaIIqvYCqog
Date: Mon, 18 Oct 2021 02:39:38 +0000
Message-ID: <e2c892210b94447ea8dda0ce2903e301@ti.com>
References: <20211018023620.23145-1-nsaulnier@ti.com>
In-Reply-To: <20211018023620.23145-1-nsaulnier@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.29.24]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Additional notes:
1) Did not have time to test the patch, let me know if additional changes a=
re needed.
2) Should we remove J7 from this script since TI does not currently support=
 generic PRU development on J7?
3) I did not modify any files other than recipes-bsp/pru/pru-icss_git.bb. A=
re there any other files that need to be modified to get PRU SW Support Pac=
kage to populate in the AM64x SDK example-applications folder like the othe=
r processors?

Thanks,
Nick

-----Original Message-----
From: Saulnier, Nick=20
Sent: Sunday, October 17, 2021 9:36 PM
To: meta-ti@lists.yoctoproject.org
Cc: Saulnier, Nick <nsaulnier@ti.com>; Siraswar, Yogesh <yogeshs@ti.com>; K=
ishon Vijay Abraham <kishon@ti.com>; Anna, Suman <s-anna@ti.com>
Subject: [meta-ti][master/dunfell PATCH v1] pru-icss_git.bb: add AM64x, upd=
ate to PSSP v6.0.0

PRU Software Support Package (PSSP) v6.0.0 should be included in Linux Proc=
essor SDK 8.1 for AM335x, AM437x, AM57x (if generated), AM64x, AM65x under =
example-applications. For the release notes that come with v6.0.0, see
https://git.ti.com/cgit/pru-software-support-package/pru-software-support-p=
ackage/tag/?h=3Dv6.0.0

Linux Processor SDK 8.1 will be the first AM64x SDK release to include the =
PSSP.

PRU firmware will also be generated and placed in the default filesystem un=
der lib/firmware/pru.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 64 +++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git=
.bb index c74a15dc88a2..32d643ab9f19 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
=20
 BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/pru-software-support-package/pru-software-su=
pport-package.git;protocol=3Dgit;branch=3D${BRANCH}"
-SRCREV =3D "a9bff6f43001cf66dc1ed3ef7e9dfb688b67f7bb"
+SRCREV =3D "138d499bedc874b961df520ca66f0061717804fa"
=20
-PV =3D "5.7.0"
+PV =3D "6.0.0"
 PR =3D "r0"
=20
 require recipes-ti/includes/ti-paths.inc @@ -41,6 +41,7 @@ PLATFORM_ti33x =
=3D "am335x"
 PLATFORM_ti43x =3D "am437x"
 PLATFORM_omap-a15 =3D "am572x"
 PLATFORM_k2g =3D "k2g"
+PLATFORM_am64xx =3D "am64x"
 PLATFORM_am65xx =3D "am65x"
 PLATFORM_j7 =3D "j721e"
=20
@@ -112,6 +113,28 @@ do_install_append_k2g() {
     done
 }
=20
+do_install_append_am64xx(){
+    for i in 0 1
+    do
+        install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_=
Halt_${i}.out \
+                   ${D}${base_libdir}/firmware/pru
+        install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_=
Halt_${i}.out \
+                   ${D}${base_libdir}/firmware/pru
+        install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i=
}/TX_PRU_Halt_${i}.out \
+                   ${D}${base_libdir}/firmware/pru
+    done
+    for i in 0 1
+    do
+        for j in 0 1
+        do
+            install -m 0644 ${S}/examples/${PLATFORM}/PRU_RPMsg_Echo_Inter=
rupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}${base_libdir}/firmware/pru
+            install -m 0644 ${S}/examples/${PLATFORM}/RTU_RPMsg_Echo_Inter=
rupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}${base_libdir}/firmware/pru
+        done
+    done
+}
+
 do_install_append_am65xx() {
     for i in 0 1=20
     do
@@ -167,6 +190,7 @@ PRU_ICSS_ALTERNATIVES_ti33x    =3D "am335x-pru0-fw am33=
5x-pru1-fw"
 PRU_ICSS_ALTERNATIVES_ti43x    =3D "am437x-pru0_0-fw am437x-pru0_1-fw am43=
7x-pru1_0-fw am437x-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES_omap-a15 =3D "am57xx-pru1_0-fw am57xx-pru1_1-fw am57=
xx-pru2_0-fw am57xx-pru2_1-fw"
 PRU_ICSS_ALTERNATIVES_k2g      =3D "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0=
-fw k2g-pru1_1-fw"
+PRU_ICSS_ALTERNATIVES_am64xx   =3D "am64x-pru0_0-fw am64x-pru0_1-fw am64x-=
pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-fw a=
m64x-rtu1_1-fw"
 PRU_ICSS_ALTERNATIVES_am65xx   =3D "am65x-pru0_0-fw am65x-pru0_1-fw am65x-=
pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw a=
m65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1=
-fw"
 PRU_ICSS_ALTERNATIVES_j7       =3D "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw=
 j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
=20
@@ -189,6 +213,19 @@ ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] =3D "${base_libdi=
r}/firmware/k2g-pru0_1-fw"
 ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] =3D "${base_libdir}/firmware/k2g-pru1=
_0-fw"
 ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] =3D "${base_libdir}/firmware/k2g-pru1=
_1-fw"
=20
+ALTERNATIVE_LINK_NAME[am64x-pru0_0-fw] =3D "${base_libdir}/firmware/am64x-=
pru0_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-pru0_1-fw] =3D "${base_libdir}/firmware/am64x-=
pru0_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-pru1_0-fw] =3D "${base_libdir}/firmware/am64x-=
pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-pru1_1-fw] =3D "${base_libdir}/firmware/am64x-=
pru1_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu0_0-fw] =3D "${base_libdir}/firmware/am64x-=
rtu0_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu0_1-fw] =3D "${base_libdir}/firmware/am64x-=
rtu0_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu1_0-fw] =3D "${base_libdir}/firmware/am64x-=
rtu1_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu1_1-fw] =3D "${base_libdir}/firmware/am64x-=
rtu1_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru0_0-fw] =3D "${base_libdir}/firmware/am64=
x-txpru0_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru0_1-fw] =3D "${base_libdir}/firmware/am64=
x-txpru0_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru1_0-fw] =3D "${base_libdir}/firmware/am64=
x-txpru1_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru1_1-fw] =3D "${base_libdir}/firmware/am64=
x-txpru1_1-fw"
+
 ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] =3D "${base_libdir}/firmware/am65x-=
pru0_0-fw"
 ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] =3D "${base_libdir}/firmware/am65x-=
pru0_1-fw"
 ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] =3D "${base_libdir}/firmware/am65x-=
pru1_0-fw"
@@ -225,6 +262,7 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] =3D "${base_libdi=
r}/firmware/j7-txpru1_1-fw"
 ALTERNATIVE_pru-icss-halt =3D "${PRU_ICSS_ALTERNATIVES}"
=20
 # Only Halt firmware images are supported for the Tx_PRU cores
+ALTERNATIVE_pru-icss-halt_append_am64xx =3D " am64x-txpru0_0-fw am64x-txpr=
u0_1-fw am64x-txpru1_0-fw am64x-txpru1_1-fw"
 ALTERNATIVE_pru-icss-halt_append_am65xx =3D " am65x-txpru0_0-fw am65x-txpr=
u0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_=
1-fw"
 ALTERNATIVE_pru-icss-halt_append_j7 =3D " j7-txpru0_0-fw j7-txpru0_1-fw j7=
-txpru1_0-fw j7-txpru1_1-fw"
=20
@@ -246,6 +284,19 @@ ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] =3D "$=
{base_libdir}/firmware/pru/P  ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-f=
w] =3D "${base_libdir}/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] =3D "${base_libdir}/firmwa=
re/pru/PRU_Halt.out"
=20
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_0-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_1-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_0-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_1-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu0_0-fw] =3D "${base_libdir}/firm=
ware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu0_1-fw] =3D "${base_libdir}/firm=
ware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu1_0-fw] =3D "${base_libdir}/firm=
ware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu1_1-fw] =3D "${base_libdir}/firm=
ware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru0_0-fw] =3D "${base_libdir}/fi=
rmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru0_1-fw] =3D "${base_libdir}/fi=
rmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru1_0-fw] =3D "${base_libdir}/fi=
rmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru1_1-fw] =3D "${base_libdir}/fi=
rmware/pru/TX_PRU_Halt_1.out"
+
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt_0.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt_1.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt_0.out"
@@ -302,6 +353,15 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] =
=3D "${base_libdir}/firmware  ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pr=
u1_0-fw] =3D "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] =3D "${base_libdir}/=
firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
=20
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_0-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_1-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_0-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_1-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu0_0-fw] =3D "${base_libdir=
}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu0_1-fw] =3D "${base_libdir=
}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu1_0-fw] =3D "${base_libdir=
}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu1_1-fw] =3D "${base_libdir=
}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
+
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
--
2.17.1

