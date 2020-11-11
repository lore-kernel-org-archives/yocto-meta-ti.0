Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12312.1605124943494319115
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 12:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=StjqQ4sk;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 2AF8238C056B
	for <meta-ti@yoctoproject.org>; Wed, 11 Nov 2020 20:02:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABK2MvZ090860
	for <meta-ti@yoctoproject.org>; Wed, 11 Nov 2020 14:02:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605124942;
	bh=8NUfoUxvB9YHXKVHdUkbztyUfEwTGlaODKTH8kNVu9I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=StjqQ4sk/LHAK1dlUke9GTLl+9L7IKsjAO8vtrlPIgtWXTEIAkxi7vsu7N0awMvJ8
	 88JrT6y0YLT7pDsUTHqWcFdZXJt9wratYJAVVBWBTtPDq8v/3DKJwNxjDm/din16Jd
	 uoRYbS4ZpHJ02l8unx26jcae+BNughtD6+oAL6W4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABK2M2u116966
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 11 Nov 2020 14:02:22 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 14:02:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 14:02:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABK2MO7015903;
	Wed, 11 Nov 2020 14:02:22 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH 2/2] ti-rtos: update metadata and firmware to 07.01.00.35
Date: Wed, 11 Nov 2020 14:02:11 -0600
Message-ID: <20201111200211.23047-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201111200211.23047-1-dmurphy@ti.com>
References: <20201111200211.23047-1-dmurphy@ti.com>
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
index 38c59936339f..14f919f11673 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,8 +17,8 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
=20
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY =3D "jacinto"
-DEFAULT_RTOS_VERSION =3D "07_01_00_33"
-DEFAULT_RTOS_VERSION_DOT =3D "07.01.00.33"
+DEFAULT_RTOS_VERSION =3D "07_01_00_35"
+DEFAULT_RTOS_VERSION_DOT =3D "07.01.00.35"
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
+DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "e4b9feffdf6aa83778e698b2422ed2e340a77=
92887c6e2178651f917ee1baf9d"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "edb0478b0013e5d77dad80833e4329=
5083e93e94be20575a6056cf3defd924cf"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "e5cc096f6d60f4488f756f46a6b94df58=
2b977bf4e851421b233f7adc69137c0"
=20
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if no=
t yet set
 CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-metadata.bb
index 205bbd1e3018..9f17b38302e9 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -17,7 +17,7 @@ PLAT_SFX_am65xx =3D "/am65xx"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
 TI_RTOS_METADATA_PROTOCOL ?=3D "git"
-TI_RTOS_METADATA_SRCREV ?=3D "6da9722a7126a5834799ed6f7661787edb156198"
+TI_RTOS_METADATA_SRCREV ?=3D "92f79da99d76d51ccbedcd02ed5361bd673011d5"
 TI_RTOS_METADATA_BRANCH ?=3D "master"
 TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
--=20
2.29.2

