Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.496.1610998165221222871
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Jan 2021 11:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Jjk0TIsP;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 067FA38C1194
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2021 19:29:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10IJTOI2012984
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2021 13:29:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610998164;
	bh=6BryZmQlhUqHuo1zZGh4Ujs/HauUmkqvNWX1DHpfbwY=;
	h=From:To:CC:Subject:Date;
	b=Jjk0TIsPme/JY/UlxTTozvBXURtLff2f0qCIrqflvN6lsxP0cRxv5SEQqXWqVHX+k
	 o59V0lLpRPwnFYsZVFdz0hvVIUDsyKgILiMdTKcXG8p7PV1llqcDMmRd695ZVYfdlI
	 8bOB13aHkGYgQ6EPY/cFXG07GR1XfKwmGiBvzX3s=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10IJTO9P053156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2021 13:29:24 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 18
 Jan 2021 13:29:23 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 18 Jan 2021 13:29:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10IJTNP7075532;
	Mon, 18 Jan 2021 13:29:23 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH] ti-sci-fw: Remove incorrect directive for 7200-hs
Date: Mon, 18 Jan 2021 13:29:17 -0600
Message-ID: <20210118192917.32300-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The 7200-hs-evm does not exist as a machine and if it did then this
directive should have been j7200-hs.  So just remove it as it is
unneeded.

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-=
fw/ti-sci-fw_git.bb
index 4d4a9a349c70..d1d10a608890 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -23,7 +23,6 @@ SYSFW_PREFIX =3D "ti-sci-firmware"
 SYSFW_PREFIX_j7-evm-k3r5 =3D "ti-fs-firmware"
 SYSFW_PREFIX_j7200-evm-k3r5 =3D "ti-fs-firmware"
 SYSFW_PREFIX_j7-hs-evm-k3r5 =3D "ti-fs-firmware"
-SYSFW_PREFIX_7200-hs-evm-k3r5 =3D "ti-fs-firmware"
=20
 SYSFW_SUFFIX ?=3D "unknown"
=20
--=20
2.29.2

