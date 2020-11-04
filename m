Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.14282.1604504260879206310
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Nov 2020 07:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=GvarGCZo;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7E57438C06A4
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2020 07:37:39 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A4FbcZi079109
	for <meta-ti@yoctoproject.org>; Wed, 4 Nov 2020 09:37:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604504258;
	bh=HspV4KDD3piPQgRlhAQ7Z+A6eMvYCTsttOXKHH5Jjpw=;
	h=From:To:CC:Subject:Date;
	b=GvarGCZoQAULaiEpNlcV+eGbpMlEDzx6dBA9ZaoVHutHVAgQgbLxmEvFBnFTZnXrr
	 oMVK3r9f3ulx4c7CE6NL0KGWap908sa+TAWQ91WVtcb1D2qqSESInJICLSEqb9kBl2
	 kUS7wVIkZzqe6qROBYEnfAzkfaWFoV3Uwdu2SuOY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A4Fbc5R021187
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 4 Nov 2020 09:37:38 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 4 Nov
 2020 09:37:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 4 Nov 2020 09:37:38 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A4FbcAM017726;
	Wed, 4 Nov 2020 09:37:38 -0600
Received: from localhost ([10.250.34.46])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 0A4FbcxM075359;
	Wed, 4 Nov 2020 09:37:38 -0600
From: "Suman Anna" <s-anna@ti.com>
To: Dan Murphy <dmurphy@ti.com>, Denys Dmytriyenko <denys@ti.com>
CC: Lucas Weaver <l-weaver@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Jesse Villarreal <jesse.villarreal@ti.com>, <meta-ti@yoctoproject.org>,
        Suman
 Anna <s-anna@ti.com>
Subject: [meta-ti][dunfell/master PATCH] ipc: ti-rpmsg-char: Update library to 0.2.0
Date: Wed, 4 Nov 2020 09:37:29 -0600
Message-ID: <20201104153729.27240-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the ti-rpmsg-char library to 0.2.0 version that includes
an improvement to signal handling logic.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Dan,

This should be the last update on this library for the upcoming release.

regards
Suman

 recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-c=
har.inc
index 2274908863bd..b37672a6b8af 100644
--- a/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL =3D "git"
 BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=3D${PROTO=
COL};branch=3D${BRANCH};"
=20
-# Initial 0.1.0 release
-SRCREV =3D "8ab86e58c97b50fcf977ce8599e38fc8b517e962"
+# Initial 0.2.0 release
+SRCREV =3D "ecee54d2bd5125d4e78028013433b568a2b72d07"
=20
-PV =3D "0.1.0+git${SRCPV}"
+PV =3D "0.2.0+git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.28.0

