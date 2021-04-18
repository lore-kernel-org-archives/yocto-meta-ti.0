Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.5695.1618707067420091950
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 17 Apr 2021 17:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=G+bt+L0y;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 3B12738C0556
	for <meta-ti@yoctoproject.org>; Sun, 18 Apr 2021 00:51:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13I0p5oh120706;
	Sat, 17 Apr 2021 19:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618707065;
	bh=rl9dx+q6nCto67IlCB0BS8kvoO+VbzkAVcrJr21rQXA=;
	h=From:To:CC:Subject:Date;
	b=G+bt+L0ysWPNE7XvV+4jGc8PPYijtksk/cTHV6BSNU3/qg3Ewvy6JSI+djazNTO+g
	 IUyS+HU6VZ1UtLzmpi42GH7kbCx4NEBsPPgVOvfd3Gnokp4Obo9m1ZlVYweRMdkH9z
	 FGGLs+Ag/wm3BB5mSaCLGhveQYfqBcWjfonfAYtk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13I0p5KL085819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Apr 2021 19:51:05 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 17
 Apr 2021 19:51:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sat, 17 Apr 2021 19:51:04 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13I0p4hl121464;
	Sat, 17 Apr 2021 19:51:04 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 13I0p4Th118670;
	Sat, 17 Apr 2021 19:51:04 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        <denys@konsulko.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH] ti-sgx-ddk-um: Update srcrev to pick latest
Date: Sat, 17 Apr 2021 19:51:02 -0500
Message-ID: <20210418005102.12220-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The eglplatform.h header is updated to account for deprecation of
MESA_EGL_NO_X11_HEADERS macro. Update srcrev to pick this change.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/rec=
ipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 47e9820b..627d128f 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -10,12 +10,12 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
=20
-PR =3D "r36"
+PR =3D "r37"
=20
-BRANCH =3D "ti-img-sgx/zeus/${PV}"
+BRANCH =3D "ti-img-sgx/dunfell/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protoc=
ol=3Dgit;branch=3D${BRANCH}"
-SRCREV =3D "7519eda203308c4356e68fd6af67a0900ed09cb4"
+SRCREV =3D "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
=20
 TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
 TARGET_PRODUCT_ti33x =3D "ti335x"
--=20
2.31.1

