Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.500.1581118854463254592
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Feb 2020 15:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=tjZRP6tB;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: g-tammana@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0637EE01691; Fri,  7 Feb 2020 15:40:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68068E00CA2
	for <meta-ti@yoctoproject.org>; Fri,  7 Feb 2020 15:40:53 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 017NeqBt016910
	for <meta-ti@yoctoproject.org>; Fri, 7 Feb 2020 17:40:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581118852;
	bh=d+lt0bC7RQm2Yb2ZIudka2TUORCg4gCMN5OjzD3obw0=;
	h=From:To:CC:Subject:Date;
	b=tjZRP6tBScm5FX8EAw6U70K7ok+mLitlhT07QjjF/qQDiKt7KFGyGyUIw7yuaSnIO
	 fXv+2BisLCMyIxEpW5qrlyIf++pZDi328SK9OiE2gN7VVfnNUTpFrCHfI6sD9NEpbM
	 zkgtgAnkrbkltZdSEoXRKkKL7zsCGiU4UQ7g0y+w=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 017Neqpf085280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 7 Feb 2020 17:40:52 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 7 Feb
 2020 17:40:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 7 Feb 2020 17:40:52 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017NeqbT101703;
	Fri, 7 Feb 2020 17:40:52 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 017Neq328900;
	Fri, 7 Feb 2020 17:40:52 -0600 (CST)
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][zeus][PATCH v2] ti-img-rogue-driver: Update branch to pick k5.4 sources
Date: Fri, 7 Feb 2020 17:41:06 -0600
Message-ID: <20200207234106.3779-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the branch id to pick the sources relevant to k5.4.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2:
  - Missed on srcrev update, adding it

 .../powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573=
.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
index bc907263..81f72302 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D15;endlin=
e=3D20;md5=3D0403c7dea01a2b8232
=20
 inherit module
=20
-MACHINE_KERNEL_PR_append =3D "e"
+MACHINE_KERNEL_PR_append =3D "f"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -15,14 +15,14 @@ DEPENDS =3D "virtual/kernel"
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-BRANCH =3D "linuxws/thud/k4.19/${PV}"
+BRANCH =3D "linuxws/zeus/k5.4/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=3D=
${BRANCH} \
     file://0001-km-support-general-toolchain.patch \
 "
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "fe40a51f33987c59aca300f8a976a9a9c8112703"
+SRCREV =3D "e0bc128ee5098e30c9fb096634ba6bec01b5fc17"
=20
 PVR_SOC =3D "j721e_linux"
 PVR_BVNC =3D "22.104.208.318"
--=20
2.25.0

