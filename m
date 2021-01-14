Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.378.1610652070084035699
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ovJg+LZp;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1654338C0876
	for <meta-ti@yoctoproject.org>; Thu, 14 Jan 2021 19:21:09 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10EJL8VM028276
	for <meta-ti@yoctoproject.org>; Thu, 14 Jan 2021 13:21:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610652068;
	bh=3eWvRLabmCD2AEdKrsHL5Y61XnunnutdMgBTUpmQtPY=;
	h=From:To:CC:Subject:Date;
	b=ovJg+LZppIlNI/cedn1iWh4XTharQDw9GbabyU+QDFx0nNLY/xCFVHcxF1VYniqAd
	 HtMH9ePGPWVpkLYZvv8ZMw7loE/PpnyaD/Rw5IhUYSOqP0v5b3DiqTtSGt7tm1pPLl
	 bszJ/SmltO0tzx4GjQTni9COol34d/syiMbqPeek=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10EJL8sl022980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 14 Jan 2021 13:21:08 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 Jan 2021 13:21:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 Jan 2021 13:21:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10EJL7tS075067;
	Thu, 14 Jan 2021 13:21:07 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2] ti-rtos: Update metadata and versions for RTOS firmware to 07.02.0x.05
Date: Thu, 14 Jan 2021 13:21:02 -0600
Message-ID: <20210114192102.32066-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 14 +++++++-------
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-firmware.bb
index 5fb33e2560e6..533537ddddd6 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,14 +17,14 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
=20
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY =3D "jacinto"
-DEFAULT_RTOS_VERSION =3D "07_01_00_45"
-DEFAULT_RTOS_VERSION_DOT =3D "07.01.00.45"
+DEFAULT_RTOS_VERSION =3D "07_02_00_05"
+DEFAULT_RTOS_VERSION_DOT =3D "07.02.00.05"
=20
 DEFAULT_RTOS_VERSION_am65xx =3D "07_01_00_55"
 DEFAULT_RTOS_VERSION_DOT_am65xx =3D "07.01.00.55"
=20
-DEFAULT_RTOS_VERSION_am64xx =3D "07_01_03_09"
-DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.01.03.09"
+DEFAULT_RTOS_VERSION_am64xx =3D "07_02_01_05"
+DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.02.01.05"
=20
 DEFAULT_RTOS_SOC =3D "undefined"
 DEFAULT_RTOS_SOC_j7 =3D "j721e"
@@ -43,10 +43,10 @@ DEFAULT_FIRMWARE_URL =3D "file://empty"
 DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_=
FILE}"
=20
 DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "23e8dec2b31f126e26953eb350e9bb252c1ea=
5135fa96eb6621691f00a54232b"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "b1c0663327fc91f280ac93be1da786=
f68d296abaea33a75798f3c38f8578418a"
+DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "14ad440b3125ea032b21fcb703a42b0bbbeea=
0fa2410a1d3e08c014a00b5f723"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "511f84654a75c6ef6df10c8356e557=
5db52bdeb51be8db20f68144c2d91669f9"
 DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "688127b48bdcb273bd66f035690bf56aa=
4ad396ce51100a75439ea00c7695456"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "78ef4d1b4e07995323b872ca4fa1259ff=
43f10cf88d40a32b84fa4ac9a5fee51"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "bfe88bb73581ac36013a3992af1235848=
f54a96d9eb3341d74418cab4f45b219"
=20
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if no=
t yet set
 CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-metadata.bb
index 5d5a12250311..2bb34333e7cf 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,7 +18,7 @@ PLAT_SFX_am64xx =3D "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
 TI_RTOS_METADATA_PROTOCOL ?=3D "git"
-TI_RTOS_METADATA_SRCREV ?=3D "1c8107dd47298ea9b8518083ffcd2f7e91ea7c00"
+TI_RTOS_METADATA_SRCREV ?=3D "0353e9bb11b5d27a56c8deca7b05f69ff80a4e79"
 TI_RTOS_METADATA_BRANCH ?=3D "master"
 TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
--=20
2.29.2

