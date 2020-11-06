Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.2440.1604693231217067739
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 12:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=awJ7CEp+;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id E917738C086F
	for <meta-ti@yoctoproject.org>; Fri,  6 Nov 2020 12:07:09 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6K797N112396
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2020 14:07:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604693229;
	bh=KFU8hYKo6nSOfoDeY4pJsEIOvnKtwy8ckIn6cL4kMTE=;
	h=From:To:CC:Subject:Date;
	b=awJ7CEp+4yoHRB+qYKhdgEI2tCfyaN+jvAust3vh1pXdrTkCN934XHj3LcNMu85iS
	 Mrij+M55e0Cg/Z1wdvL/Nifc7U7tRwIWlE9k1v7040RXtgamAV78cmphEjlxZFc88L
	 AP740IHuyDl/sxWynl2K1bMapYMOSF3yhunGEGhc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6K79f0077120
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2020 14:07:09 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 14:07:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 14:07:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6K78wP122312;
	Fri, 6 Nov 2020 14:07:08 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH v3 1/3] ti-rtos: update metadata and firmware to 07.01.00.33
Date: Fri, 6 Nov 2020 14:07:00 -0600
Message-ID: <20201106200702.15064-1-dmurphy@ti.com>
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

