Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4174.1615458275905332844
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 02:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=PLxi5VVh;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: shiju@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12BAOYYf120297
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Mar 2021 04:24:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615458274;
	bh=8r3UDrrvMENHiVIpUZWwzZp9iDBWl0Ii7Uuo83lhIXk=;
	h=From:To:CC:Subject:Date;
	b=PLxi5VVh+S/B6aPAik59rC9f+0znicUC02utw73bi4gK+Yr2SRgo61zL9o6or6Epc
	 k8LCYYPKD4hBcnHih49fYpdU0fuADn0zmz6ENxl6PZrjdXSwbkiA+CnBAkT1jqHb0M
	 3tGNKGfcaED5F27xvu0vqUOmhxz+wzYZVAU5v5p4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12BAOYkd119435
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Mar 2021 04:24:34 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 11
 Mar 2021 04:24:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 11 Mar 2021 04:24:34 -0600
Received: from uda0756868.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12BAOWeM083460;
	Thu, 11 Mar 2021 04:24:33 -0600
From: "Shiju Sivasankaran" <shiju@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Shiju Sivasankaran <shiju@ti.com>
Subject: [dunfell/next v2 PATCH] ti-rtos: update to uisng fw from mcu-plus-sdk for AM64x
Date: Thu, 11 Mar 2021 15:54:30 +0530
Message-ID: <20210311102430.26263-1-shiju@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 12BAOYYf120297
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

update ti-rtos-metadata and ti-rtos-firmware recipes of meta-ti to
pick AM64x rtos firmware from mcu-plus-sdk instead of PDK.

Other devices such as AM65x, J7 continue to use fw from PDK.

Built and tested both IPC echo test applications - "rpmsg_client_sample=E2=
=80=9D
& =E2=80=9Crpmsg_char_simple=E2=80=9D. Both tests passed for all remote R=
5F cores
on AM64x EVM

Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
---
v2: rebased to dunfell-next
DEFAULT_FIRMWARE_SHA256SUM_am65xx updated

 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 14 +++++++++-----
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  3 ++-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-firmware.bb
index 507d0000..c70fc50d 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -11,17 +11,20 @@ INHIBIT_DEFAULT_DEPS =3D "1"
=20
 inherit deploy
=20
+DEFAULT_METADATA_FILE ?=3D "metadata.inc"
+DEFAULT_METADATA_FILE_am64xx ?=3D "mcusdk_metadata.inc"
+
 # First, let's try including metadata.inc that could be fetched and depl=
oyed
 # by ti-rtos-metadata earlier and provide new set of CORESDK_RTOS_* vari=
ables
-include ${DEPLOY_DIR_IMAGE}/metadata.inc
+include ${DEPLOY_DIR_IMAGE}/${DEFAULT_METADATA_FILE}
=20
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY =3D "jacinto"
 DEFAULT_RTOS_VERSION =3D "07_03_00_16"
 DEFAULT_RTOS_VERSION_DOT =3D "07.03.00.16"
=20
-DEFAULT_RTOS_VERSION_am64xx =3D "07_03_01_06"
-DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.01.06"
+DEFAULT_RTOS_VERSION_am64xx =3D "07_03_00_03"
+DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.00.03"
=20
 DEFAULT_RTOS_SOC =3D "undefined"
 DEFAULT_RTOS_SOC_j7 =3D "j721e"
@@ -36,6 +39,7 @@ DEFAULT_RTOS_WEBLINK_am65xx =3D "https://software-dl.ti=
.com/processor-sdk-rtos/esd
 DEFAULT_RTOS_WEBLINK_am64xx =3D "https://software-dl.ti.com/processor-sd=
k-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"
=20
 DEFAULT_FIRMWARE_FILE =3D "coresdk_rtos_${CORESDK_RTOS_SOC}_${CORESDK_RT=
OS_VERSION}_firmware.tar.xz"
+DEFAULT_FIRMWARE_FILE_am64xx =3D "mcu_plus_sdk_${CORESDK_RTOS_SOC}_${COR=
ESDK_RTOS_VERSION}_firmware.tar.xz"
=20
 DEFAULT_FIRMWARE_URL =3D "file://empty"
 DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_=
FILE}"
@@ -43,8 +47,8 @@ DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${=
DEFAULT_FIRMWARE_FILE}"
 DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
 DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "78f3ab929a0f3c6e2907538061de82e16d8af=
f7ffb2fac0c3c4d56df8abec3b0"
 DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "5bae696d35e206bbcd9b26ab6508af=
59a2c2d72f9b89aa1d3fc1aa808f7a8615"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "7bd854dbf96c25683d684ac731fde3edd=
7fb8a65f8727f7aae3802a2e9a9cab6"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "450bf23d659756695d62168fe06eebe46=
41522293d89692a9eea837426bac0f9"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "d3cffd472fdd17b000afcee806318344e=
6033ac271ab3a6fa9ca8f432e8420c9"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "bc2d3d603ad30006ea3fefa3e777c26c1=
9b95ee6d6f5a630259009f2f5a4996b"
=20
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if no=
t yet set
 CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-metadata.bb
index 9bb0d3c5..466a22a8 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,10 +18,11 @@ PLAT_SFX_am64xx =3D "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
 TI_RTOS_METADATA_PROTOCOL ?=3D "git"
-TI_RTOS_METADATA_SRCREV ?=3D "ba81dc5a9342fc35435920092a0df2cb2ab342ef"
+TI_RTOS_METADATA_SRCREV ?=3D "e558080592d910783bf2f9ad46ed3b622f899155"
 TI_RTOS_METADATA_BRANCH ?=3D "master"
 TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
+TI_RTOS_METADATA_FILE_am64xx ?=3D "${S}${TI_RTOS_METADATA_DIR}/mcusdk_me=
tadata.inc"
=20
 PV =3D "1.0.0+git${SRCPV}"
=20
--=20
2.17.1

