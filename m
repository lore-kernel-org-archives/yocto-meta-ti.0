Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.4351.1605188925309247190
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 05:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=SVvLW1Jx;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 507EA38C08A4
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 13:48:44 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACDmhQm087956
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 07:48:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605188923;
	bh=XQZt9ZULo7/o3N6VWS30gvDbDNUd7JgfOpcKoaXB/Z4=;
	h=From:To:CC:Subject:Date;
	b=SVvLW1JxNtCxqJoPS2EVuzLlRB2RGlsDf/DzhxgWc006iDdtBtk8iGy+NADL4Nj0f
	 9QngxqctTMmhWd2AbH039R9W3ApOBm2hLRNJ94WyrfuvHv6A5wnFYu62wSuqdnJNJR
	 f/Cun668OVuTwG7u9gm1WZr9KFhg5j88uaUhuWD8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACDmhlq036767
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 07:48:43 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 07:48:42 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 07:48:42 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ACDmg84103323;
	Thu, 12 Nov 2020 07:48:42 -0600
Received: from localhost ([10.250.64.205])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 0ACDmgQw044555;
	Thu, 12 Nov 2020 07:48:42 -0600
From: "Suman Anna" <s-anna@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <meta-ti@yoctoproject.org>, Suman Anna <s-anna@ti.com>
Subject: [meta-ti][dunfell PATCH] k3conf: Update SRCREV to latest
Date: Thu, 12 Nov 2020 07:48:41 -0600
Message-ID: <20201112134841.7108-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Use latest SRCREV on master branch to pick up all the
changes compliant with TIFS 2020.08b firmware.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Dan,

Please pick this up for 07.01.00.006. Will submit a separate patch
for master, looks like Nikhil missed one update to master branch.

regards
Suman

 recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3c=
onf/k3conf_git.bb
index 6771eeb7682e..f7d062b91408 100644
--- a/recipes-devtools/k3conf/k3conf_git.bb
+++ b/recipes-devtools/k3conf/k3conf_git.bb
@@ -8,7 +8,7 @@ PV =3D "0.1+git${SRCPV}"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "246eb4092d7d111ce10e0a310b9bde678b97ab36"
+SRCREV =3D "1ff0c4f429e8e33d22b52ec002d9b97bbca6bf0b"
=20
 SRC_URI =3D "git://git.ti.com/k3conf/k3conf.git;protocol=3Dgit;branch=3D=
${BRANCH}"
=20
--=20
2.28.0

