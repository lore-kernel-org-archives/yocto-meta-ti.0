Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.32803.1611170412789929157
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Jan 2021 11:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=UQdqCRkx;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 2313538C088E
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2021 19:20:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10KJKBjF017456
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2021 13:20:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1611170411;
	bh=0pta6LFGOM8EsRqbsZ2axkiZiOBoOTmdSvGqFZgM/W4=;
	h=From:To:CC:Subject:Date;
	b=UQdqCRkxlwk1AtyU5L/3wKTdmjscdf41wFzmejplmzmFbo9+wX90DdV1UE/UXJFMV
	 Zt83HMXN88ypUtir+e/e3Xo45IrzNBIw6VNpyHh83B2JFtwARo26AbqJHVN5VfDcG0
	 NFQuy5Zb7HwmXE6leqejmwkBr2QQqq5I117o6WdQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10KJKBbB043921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2021 13:20:11 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 Jan 2021 13:20:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 Jan 2021 13:20:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10KJKAEi103814;
	Wed, 20 Jan 2021 13:20:10 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH] ti-rtos: Update metadata and versions for RTOS firmware
Date: Wed, 20 Jan 2021 13:20:05 -0600
Message-ID: <20210120192005.23703-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

am64xx update to 07.02.01.06
am65, j7 and j7200 updated to 07.02.00.10

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 19 ++++++++-----------
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-firmware.bb
index 533537ddddd6..10e971a24caf 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,14 +17,11 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
=20
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY =3D "jacinto"
-DEFAULT_RTOS_VERSION =3D "07_02_00_05"
-DEFAULT_RTOS_VERSION_DOT =3D "07.02.00.05"
+DEFAULT_RTOS_VERSION =3D "07_02_00_10"
+DEFAULT_RTOS_VERSION_DOT =3D "07.02.00.10"
=20
-DEFAULT_RTOS_VERSION_am65xx =3D "07_01_00_55"
-DEFAULT_RTOS_VERSION_DOT_am65xx =3D "07.01.00.55"
-
-DEFAULT_RTOS_VERSION_am64xx =3D "07_02_01_05"
-DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.02.01.05"
+DEFAULT_RTOS_VERSION_am64xx =3D "07_02_01_06"
+DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.02.01.06"
=20
 DEFAULT_RTOS_SOC =3D "undefined"
 DEFAULT_RTOS_SOC_j7 =3D "j721e"
@@ -43,10 +40,10 @@ DEFAULT_FIRMWARE_URL =3D "file://empty"
 DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_=
FILE}"
=20
 DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "14ad440b3125ea032b21fcb703a42b0bbbeea=
0fa2410a1d3e08c014a00b5f723"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "511f84654a75c6ef6df10c8356e557=
5db52bdeb51be8db20f68144c2d91669f9"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "688127b48bdcb273bd66f035690bf56aa=
4ad396ce51100a75439ea00c7695456"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "bfe88bb73581ac36013a3992af1235848=
f54a96d9eb3341d74418cab4f45b219"
+DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "c1a1a44ff1a027c9f1d3aefdcfcddde1cd0ec=
b03465b9490d4ef8f6da0d15e2e"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "41febbfe971e2fe31061e339406e35=
28ccf967f44dba61d3ffedc0ec7c0a4ab4"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "139297fa2cd537d5ca911528ad492e10b=
4f470b9bb9466d218e84a6ebff48477"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "2557fa08872d4c335e87699730227c238=
cff525276f669dfcbd5803365aa5c01"
=20
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if no=
t yet set
 CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-metadata.bb
index 2bb34333e7cf..46fd3996e3a8 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,7 +18,7 @@ PLAT_SFX_am64xx =3D "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
 TI_RTOS_METADATA_PROTOCOL ?=3D "git"
-TI_RTOS_METADATA_SRCREV ?=3D "0353e9bb11b5d27a56c8deca7b05f69ff80a4e79"
+TI_RTOS_METADATA_SRCREV ?=3D "66af60bbb229b2fb586cb55466fe61cfc653c6c8"
 TI_RTOS_METADATA_BRANCH ?=3D "master"
 TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
--=20
2.29.2

