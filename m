Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.13.1581119190416511183
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Feb 2020 15:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=VrsIuaYF;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: g-tammana@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB17DE016EA; Fri,  7 Feb 2020 15:46:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47F47E01650
	for <meta-ti@yoctoproject.org>; Fri,  7 Feb 2020 15:46:29 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 017NkSEu093743
	for <meta-ti@yoctoproject.org>; Fri, 7 Feb 2020 17:46:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581119188;
	bh=jba4iknIpFtbIhTRPh3eXTXSXl7PiLKXLZggwJA1VQ4=;
	h=From:To:CC:Subject:Date;
	b=VrsIuaYF0lG3ZNIX31f1nipsaKCAC6Yf99daYe9mqMUJ2Fb8jQNxs55ZxpaPW0Lpz
	 MJh80JNfrhhhPNGBl/Tl5M5I30FcrxeOkYDs58oEtldpjun0TjRZxSKlS9/3IlVKZO
	 pu9iv0kFC3aMKGsC/NXeRNil0vKhap1LOPQ9pO4A=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017NkSVp099866
	for <meta-ti@yoctoproject.org>; Fri, 7 Feb 2020 17:46:28 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 7 Feb
 2020 17:46:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 7 Feb 2020 17:46:28 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017NkSrl073381;
	Fri, 7 Feb 2020 17:46:28 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 017NkR304654;
	Fri, 7 Feb 2020 17:46:27 -0600 (CST)
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][zeus][PATCH] ti-img-rogue-umlibs: Update branch for zeus
Date: Fri, 7 Feb 2020 17:46:39 -0600
Message-ID: <20200207234639.12438-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update branch for zeus release. There is no change to srcrev.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb=
 b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
index 9cb863a5..6cc76718 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f9=
9e3baa03de5207e76f"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j7-evm"
=20
-PR =3D "r5"
+PR =3D "r6"
=20
-BRANCH =3D "linuxws/thud/k4.19/${PV}"
+BRANCH =3D "linuxws/zeus/k5.4/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=3D=
${BRANCH}"
 SRCREV =3D "0721cdfc1fc86f40c93745159e3f1bcad5beda17"
--=20
2.25.0

