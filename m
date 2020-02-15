Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.3181.1581733288988998510
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Feb 2020 18:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=wQcJcTUH;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: g-tammana@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9FBB6E016FC; Fri, 14 Feb 2020 18:21:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28DABE0166C
	for <meta-ti@yoctoproject.org>; Fri, 14 Feb 2020 18:21:27 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01F2LRJ4019368
	for <meta-ti@yoctoproject.org>; Fri, 14 Feb 2020 20:21:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581733287;
	bh=JAkmBmA5TXKiUAze4R+LT0IjUHjkQYhE5FWG97qMx/U=;
	h=From:To:CC:Subject:Date;
	b=wQcJcTUH2p/ngdbXktLM2IBWJh9fwHe2RzJ/+T33y6gNf34C5WjlVDi4GWInhwFRU
	 /iIDyEFhxkebWOeXsWJppQVVvU6TF4Qp9WHGOJ65vHi0fzFscwwyxNBJIKZGHyVYaD
	 j/zNEcd6ffzt4fken/8n3aKlxzoHodJBEXqz2ubU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01F2LR6U002891
	for <meta-ti@yoctoproject.org>; Fri, 14 Feb 2020 20:21:27 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 14
 Feb 2020 20:21:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 14 Feb 2020 20:21:27 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01F2LRxn002282;
	Fri, 14 Feb 2020 20:21:27 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 01F2LQ310533;
	Fri, 14 Feb 2020 20:21:26 -0600 (CST)
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][zeus][PATCH] ti-sgx-ddk-km: Update srcrev to pick use preemption
Date: Fri, 14 Feb 2020 20:21:41 -0600
Message-ID: <20200215022141.12195-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update srcrev to pick the use preemption changes.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/=
recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 76526bbf..b44671f8 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -7,7 +7,7 @@ inherit module
=20
 COMPATIBLE_MACHINE =3D "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
=20
-MACHINE_KERNEL_PR_append =3D "u"
+MACHINE_KERNEL_PR_append =3D "v"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -24,7 +24,7 @@ SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-li=
nux.git;protocol=3Dgit;branch
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "76f305295daf9a77d9f8a563ce81bcf9b94e8eac"
+SRCREV =3D "50c1ec2308b9f64488d252ac55d65b51a0dfe287"
=20
 TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
 TARGET_PRODUCT_ti33x =3D "ti335x"
--=20
2.17.1

