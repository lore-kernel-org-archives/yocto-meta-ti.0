Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.5193.1615356772346417162
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 22:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=q+pRuf9a;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: shiju@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12A6CpBB031005
	for <meta-ti@lists.yoctoproject.org>; Wed, 10 Mar 2021 00:12:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615356771;
	bh=fVG5J2CqEoVxCC6mCNGjyM65lzMYGmC+O8qTJpmaP/c=;
	h=From:To:CC:Subject:Date;
	b=q+pRuf9aem8ei2E6UT50MbH1hQkx4mj2kBFqjtzxtJhaxXAY5DuxILdszoWYFKgqa
	 RD3N0q70630o/G/8UNyBzXWLxYiZJapp5f/9Wixo2oZefRZJKH8oOO5QgbDIKJF0b2
	 Z6IJXbo2h/0zf5LsvR2IjPSHVH+8037GvpMrff5I=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12A6Cpfa049771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 10 Mar 2021 00:12:51 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 10
 Mar 2021 00:12:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 10 Mar 2021 00:12:51 -0600
Received: from uda0756868.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12A6CnA3085595;
	Wed, 10 Mar 2021 00:12:50 -0600
From: shiju@ti.com
To: <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Shiju Sivasankaran <shiju@ti.com>
Subject: [dunfell/master PATCH] ti-rtos: update to uisng fw from mcu-plus-sdk for AM64x
Date: Wed, 10 Mar 2021 11:42:46 +0530
Message-ID: <20210310061246.12448-1-shiju@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 12A6CpBB031005
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
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 12 ++++++++----
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  3 ++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-firmware.bb
index ed62b876..63b34723 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -11,9 +11,12 @@ INHIBIT_DEFAULT_DEPS =3D "1"
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
@@ -23,8 +26,8 @@ DEFAULT_RTOS_VERSION_DOT =3D "07.03.00.12"
 DEFAULT_RTOS_VERSION_j7200 =3D "07_03_00_10"
 DEFAULT_RTOS_VERSION_DOT_j7200 =3D "07.03.00.10"
=20
-DEFAULT_RTOS_VERSION_am64xx =3D "07_03_01_02"
-DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.01.02"
+DEFAULT_RTOS_VERSION_am64xx =3D "07_03_00_03"
+DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.00.03"
=20
 DEFAULT_RTOS_VERSION_am65xx =3D "07_03_00_10"
 DEFAULT_RTOS_VERSION_DOT_am65xx =3D "07.03.00.10"
@@ -41,6 +44,7 @@ DEFAULT_RTOS_WEBLINK_am65xx =3D "https://software-dl.ti=
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
@@ -49,7 +53,7 @@ DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
 DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "69cc16c30c895fe813002bd7bdb3d30e6ca62=
2d86b008a6bf6e2a24b86550969"
 DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "a16865d928b2b00bfca64e0c41b02d=
cfc0ac8ec1ce125fbfd3581a1c610847f8"
 DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "aa121c10d3099dd61ef898717245ecee2=
5b501170607c9a95afd741e05783a5d"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "9e9efeef0b1dbb101de97e58cfda8bf05=
2a697f2ea635fdf6ca5158fffdc212b"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "bc2d3d603ad30006ea3fefa3e777c26c1=
9b95ee6d6f5a630259009f2f5a4996b"
=20
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if no=
t yet set
 CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-metadata.bb
index 1bbe5f22..466a22a8 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,10 +18,11 @@ PLAT_SFX_am64xx =3D "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
 TI_RTOS_METADATA_PROTOCOL ?=3D "git"
-TI_RTOS_METADATA_SRCREV ?=3D "e15de0d731606abdf112f2910543fd08b781ad64"
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

