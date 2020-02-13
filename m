Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.2432.1581624170708262698
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 12:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=tlu62YOn;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: g-tammana@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49A9EE015F8; Thu, 13 Feb 2020 12:02:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 463B7E00571
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 12:02:48 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DK2mBN111188
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 14:02:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581624168;
	bh=/txZuJD1xwYFfYaccfA2bhuI9Xie0f02R9grgP/MXHY=;
	h=From:To:CC:Subject:Date;
	b=tlu62YOnEcTfatuwYEyxsMEewrjWzGRJxz4UKscFMVn8z8A2pjRRCfAGKrH02Eoqw
	 ULJMXzMxmQS2ZZcbj+tlJYuiEdkQwOU7rXvAqqdkOne/wyXwcw+qYuWYfsXrUojXfn
	 DJN3Ae/o80gEtBEn8VUhZzQ15PHqclqeMOhGLfzA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01DK2mlk109771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 14:02:48 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 14:02:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 14:02:48 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DK2mrP093616;
	Thu, 13 Feb 2020 14:02:48 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 01DK2l323444;
	Thu, 13 Feb 2020 14:02:47 -0600 (CST)
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][zeus][PATCH v2] ti-sgx-ddk-km: Update srcrev for rtlinux build
Date: Thu, 13 Feb 2020 14:03:03 -0600
Message-ID: <20200213200303.30518-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update srcrev to pickup fix for rt linux build error.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2: rebase of the patch

 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/=
recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 14010137..76526bbf 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -7,7 +7,7 @@ inherit module
=20
 COMPATIBLE_MACHINE =3D "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
=20
-MACHINE_KERNEL_PR_append =3D "t"
+MACHINE_KERNEL_PR_append =3D "u"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -24,7 +24,7 @@ SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-li=
nux.git;protocol=3Dgit;branch
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "1cc2eded30f83bfce58c8ccc8cd61005addf9c0b"
+SRCREV =3D "76f305295daf9a77d9f8a563ce81bcf9b94e8eac"
=20
 TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
 TARGET_PRODUCT_ti33x =3D "ti335x"
--=20
2.25.0

