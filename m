Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.6020.1605361291941666479
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 14 Nov 2020 05:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=o/ouzA/0;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9ABA638C0848
	for <meta-ti@yoctoproject.org>; Sat, 14 Nov 2020 13:41:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AEDfT45007513
	for <meta-ti@yoctoproject.org>; Sat, 14 Nov 2020 07:41:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605361289;
	bh=Dgwfu3rtCBn5mGRMP1phdsaBrF7HYL9X1sgB+EAB2+Y=;
	h=From:To:CC:Subject:Date;
	b=o/ouzA/00sl+4KKSZ0OGZ5W6pSEwl0FCIp+SjqwDyNYRPam3W2L9nyvr807E9Blhd
	 AfcBb9XMWYUWowN59G5Q179fEhK9cuQHxuOPLzlcW4JeeQ+rP7oD4VzDo9Hkow9sSj
	 0gD8MRxvIfF3PJExKAfzoODein5DvoIdy3wT8LME=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AEDfTik104825
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sat, 14 Nov 2020 07:41:29 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 14
 Nov 2020 07:41:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 14 Nov 2020 07:41:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AEDfTcJ058239;
	Sat, 14 Nov 2020 07:41:29 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH] ti-rtos: update metadata and firmware to 07.01.00.38
Date: Sat, 14 Nov 2020 07:41:27 -0600
Message-ID: <20201114134127.12196-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 10 +++++-----
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-firmware.bb
index 38c59936339f..01cf0fc91aa6 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,8 +17,8 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
=20
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY =3D "jacinto"
-DEFAULT_RTOS_VERSION =3D "07_01_00_33"
-DEFAULT_RTOS_VERSION_DOT =3D "07.01.00.33"
+DEFAULT_RTOS_VERSION =3D "07_01_00_38"
+DEFAULT_RTOS_VERSION_DOT =3D "07.01.00.38"
=20
 DEFAULT_RTOS_SOC =3D "undefined"
 DEFAULT_RTOS_SOC_j7 =3D "j721e"
@@ -35,9 +35,9 @@ DEFAULT_FIRMWARE_URL =3D "file://empty"
 DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_=
FILE}"
=20
 DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "7b0e550c6d962b0868a2277f78720a46c9e69=
bd6df827186ccd3370db5010395"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "44fdebe0fb1c8f536e96d00c1d68dc=
889a54b92402e71cdd901198940b1b8d51"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "a0b64ea6c70cef2a38d25a92eaed28a2e=
87b2ab66e3c706f2995b81bebd64951"
+DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "93e4d3742a922015f3295f5c20ef4bc2b9751=
139ffcd5620b8df7047bff50651"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "cd5071a8f6ddaec05346e4c2bbeed6=
dc7bcb376d6edc47f81b9aeaf38f151176"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "e54cc8da7fefa1ebf55454b184b42c364=
de3eebb34a328d244b8275b7763eb58"
=20
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if no=
t yet set
 CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-metadata.bb
index 205bbd1e3018..15c0c68cc2d8 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -17,7 +17,7 @@ PLAT_SFX_am65xx =3D "/am65xx"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
 TI_RTOS_METADATA_PROTOCOL ?=3D "git"
-TI_RTOS_METADATA_SRCREV ?=3D "6da9722a7126a5834799ed6f7661787edb156198"
+TI_RTOS_METADATA_SRCREV ?=3D "6b63577eec787cde277d3d12b23ea80578b6ad91"
 TI_RTOS_METADATA_BRANCH ?=3D "master"
 TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
--=20
2.29.2

