Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.13761.1604678539472734633
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 08:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=D9h99Iyd;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5E1DE38C119A
	for <meta-ti@yoctoproject.org>; Fri,  6 Nov 2020 08:02:18 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6G2HjC026162
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2020 10:02:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604678537;
	bh=KFU8hYKo6nSOfoDeY4pJsEIOvnKtwy8ckIn6cL4kMTE=;
	h=From:To:CC:Subject:Date;
	b=D9h99IydTOmeaBLeIxQHMafj6U/5Aygh14gqZZrk9LcxRXZ35+hceNiy3MXD66zG0
	 Rpi1jik3oOVuPcRviXS6fupKfIduU8fWd5FLQeDDU3qWZqVPA91VFbPnv2Iq1tW/re
	 la+mfpXk6KreKVuCZc+lX895BBRylvDVw9npt3sY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6G2HBS079190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2020 10:02:17 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 10:02:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 10:02:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6G2Gsd098663;
	Fri, 6 Nov 2020 10:02:16 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH v2 1/3] ti-rtos: update metadata and firmware to 07.01.00.33
Date: Fri, 6 Nov 2020 10:02:13 -0600
Message-ID: <20201106160215.5800-1-dmurphy@ti.com>
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
index d40b6a4b5192..38c59936339f 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,8 +17,8 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
=20
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY =3D "jacinto"
-DEFAULT_RTOS_VERSION =3D "07_01_00_25"
-DEFAULT_RTOS_VERSION_DOT =3D "07.01.00.25"
+DEFAULT_RTOS_VERSION =3D "07_01_00_33"
+DEFAULT_RTOS_VERSION_DOT =3D "07.01.00.33"
=20
 DEFAULT_RTOS_SOC =3D "undefined"
 DEFAULT_RTOS_SOC_j7 =3D "j721e"
@@ -35,9 +35,9 @@ DEFAULT_FIRMWARE_URL =3D "file://empty"
 DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_=
FILE}"
=20
 DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "f66057d3dcdf9a615f3f10847a7f4ac6aa55a=
091f8431d0771498990ec11384e"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "4a7b80748740dc4bdd5894c1bbebd4=
628ad2a12fa5f233504157c971b2fcfce3"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "b7955e46a8da5300c32d391989281406e=
650ccb09bbdc27d61fa57824e102457"
+DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "7b0e550c6d962b0868a2277f78720a46c9e69=
bd6df827186ccd3370db5010395"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "44fdebe0fb1c8f536e96d00c1d68dc=
889a54b92402e71cdd901198940b1b8d51"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "a0b64ea6c70cef2a38d25a92eaed28a2e=
87b2ab66e3c706f2995b81bebd64951"
=20
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if no=
t yet set
 CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-metadata.bb
index a7ba38fd5670..205bbd1e3018 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -17,7 +17,7 @@ PLAT_SFX_am65xx =3D "/am65xx"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
 TI_RTOS_METADATA_PROTOCOL ?=3D "git"
-TI_RTOS_METADATA_SRCREV ?=3D "1dbda7181905cd255c44f2170be83b2466000f8c"
+TI_RTOS_METADATA_SRCREV ?=3D "6da9722a7126a5834799ed6f7661787edb156198"
 TI_RTOS_METADATA_BRANCH ?=3D "master"
 TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
--=20
2.29.2

