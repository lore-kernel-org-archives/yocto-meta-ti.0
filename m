Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.315.1581117558016356565
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Feb 2020 15:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=xs1SF8qk;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: g-tammana@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88B59E016EB; Fri,  7 Feb 2020 15:19:17 -0800 (PST)
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
	*      [198.47.23.249 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25330E01691
	for <meta-ti@yoctoproject.org>; Fri,  7 Feb 2020 15:19:16 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 017NJG1m087274
	for <meta-ti@yoctoproject.org>; Fri, 7 Feb 2020 17:19:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581117556;
	bh=/+AFxl6ckD5WsVOAESBaKi8dd/uTevfdHEc0yT7U3qU=;
	h=From:To:CC:Subject:Date;
	b=xs1SF8qk1HifG2wXAGqrJpMpzrn7jIAAxNilwPAx/Xb4slnVRl1TKX/OsJ9b9BUg0
	 3zHQ8FY2869YVdFqFU25v5T0LQk14hUmUw5XaHSImT//xk3CkzyIxjypeGaYlGU2yo
	 IW8SPCNnzpfewzMjaOc2UO6t4RvY4nMUZgj1vupw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 017NJG7H009274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 7 Feb 2020 17:19:16 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 7 Feb
 2020 17:19:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 7 Feb 2020 17:19:16 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017NJFCL067541;
	Fri, 7 Feb 2020 17:19:16 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 017NJF308654;
	Fri, 7 Feb 2020 17:19:15 -0600 (CST)
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][zeus][PATCH] ti-img-rogue-driver: Update branch to pick k5.4 sources
Date: Fri, 7 Feb 2020 17:19:23 -0600
Message-ID: <20200207231923.3448-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the branch id to pick the sources relevant to k5.4.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573=
.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
index bc907263..b3039961 100644
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
@@ -15,7 +15,7 @@ DEPENDS =3D "virtual/kernel"
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-BRANCH =3D "linuxws/thud/k4.19/${PV}"
+BRANCH =3D "linuxws/zeus/k5.4/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=3D=
${BRANCH} \
     file://0001-km-support-general-toolchain.patch \
--=20
2.25.0

