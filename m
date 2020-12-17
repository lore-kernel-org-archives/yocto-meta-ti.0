Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.7994.1608211951013976358
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 05:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=FNYETf4e;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id BF80338C1280
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 13:32:30 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWUN1033006
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608211950;
	bh=cLYVpd9A57oJ2eWsfZ7oB8T/aMW2d9PmWz54a1liszs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FNYETf4eoY5RJd6ZVyyjNnIcRghnH4NNlfQKhmuKAW2cwL7v0SDYz8iIEINneAxuj
	 YGCkytocCZNQpg0bradLMqylXxEWNeY5OKJXJiF73wA5chf8uAwgWWlLRd6qZK/M8B
	 YF6i2lQcwYCiDDnlLEZbWtJjOIE5LT8ZOQtBfobc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHDWUfm010864
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:30 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 07:32:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 07:32:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWTS0091456;
	Thu, 17 Dec 2020 07:32:29 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2 04/10] ti-rtos: Update metadata and versions for RTOS firmware
Date: Thu, 17 Dec 2020 07:32:22 -0600
Message-ID: <20201217133228.22886-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217133228.22886-1-dmurphy@ti.com>
References: <20201217133228.22886-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 21 ++++++++++++---------
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-firmware.bb
index 74aac2c9fa0d..5fb33e2560e6 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,17 +17,20 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
=20
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY =3D "jacinto"
-DEFAULT_RTOS_VERSION =3D "07_01_00_38"
-DEFAULT_RTOS_VERSION_DOT =3D "07.01.00.38"
+DEFAULT_RTOS_VERSION =3D "07_01_00_45"
+DEFAULT_RTOS_VERSION_DOT =3D "07.01.00.45"
=20
-DEFAULT_RTOS_VERSION_am64xx =3D "07_01_03_01"
-DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.01.03.01"
+DEFAULT_RTOS_VERSION_am65xx =3D "07_01_00_55"
+DEFAULT_RTOS_VERSION_DOT_am65xx =3D "07.01.00.55"
+
+DEFAULT_RTOS_VERSION_am64xx =3D "07_01_03_09"
+DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.01.03.09"
=20
 DEFAULT_RTOS_SOC =3D "undefined"
 DEFAULT_RTOS_SOC_j7 =3D "j721e"
 DEFAULT_RTOS_SOC_j7200-evm =3D "j7200"
 DEFAULT_RTOS_SOC_am65xx =3D "am65xx"
-DEFAULT_RTOS_SOC_am64xx =3D "am64xx"
+DEFAULT_RTOS_SOC_am64xx =3D "am64x"
=20
 DEFAULT_RTOS_WEBLINK =3D "undefined"
 DEFAULT_RTOS_WEBLINK_j7 =3D "https://software-dl.ti.com/jacinto7/esd/pro=
cessor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
@@ -40,10 +43,10 @@ DEFAULT_FIRMWARE_URL =3D "file://empty"
 DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_=
FILE}"
=20
 DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "93e4d3742a922015f3295f5c20ef4bc2b9751=
139ffcd5620b8df7047bff50651"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "cd5071a8f6ddaec05346e4c2bbeed6=
dc7bcb376d6edc47f81b9aeaf38f151176"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "e54cc8da7fefa1ebf55454b184b42c364=
de3eebb34a328d244b8275b7763eb58"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "dc1a39b7a7f403235364a84ed5291666a=
84a5fa7fe8c136ec07d45848c1017f4"
+DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "23e8dec2b31f126e26953eb350e9bb252c1ea=
5135fa96eb6621691f00a54232b"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "b1c0663327fc91f280ac93be1da786=
f68d296abaea33a75798f3c38f8578418a"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "688127b48bdcb273bd66f035690bf56aa=
4ad396ce51100a75439ea00c7695456"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "78ef4d1b4e07995323b872ca4fa1259ff=
43f10cf88d40a32b84fa4ac9a5fee51"
=20
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if no=
t yet set
 CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-metadata.bb
index d4f33443699a..5d5a12250311 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,7 +18,7 @@ PLAT_SFX_am64xx =3D "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
 TI_RTOS_METADATA_PROTOCOL ?=3D "git"
-TI_RTOS_METADATA_SRCREV ?=3D "d946278e9a40632d05cd1e953f5f200011be69a9"
+TI_RTOS_METADATA_SRCREV ?=3D "1c8107dd47298ea9b8518083ffcd2f7e91ea7c00"
 TI_RTOS_METADATA_BRANCH ?=3D "master"
 TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
--=20
2.29.2

