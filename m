Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5737.1619573098590653024
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 18:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=vBN9F/WC;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 3004738C0738
	for <meta-ti@yoctoproject.org>; Wed, 28 Apr 2021 01:24:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13S1OqDA038481;
	Tue, 27 Apr 2021 20:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619573092;
	bh=8/arx2xDbsPTfX8gQRN92PW51q8jFaNwBmPUvKX5bRo=;
	h=From:To:CC:Subject:Date;
	b=vBN9F/WCKCdhBkJaIFwsJuBM3E7c4F0nKkkZkIBYzKdc404urxpC0kSoAO2JVCc4n
	 HC4e4kTl5l9ThZzTWSFMBML1MiLR7GOheVG3aaFTX2GYcJfcNKP4/Vm5GYYftJbrj6
	 aXGmFlcJ4U2srBRIdldYJ1ZL3LP5l/TiazC+kUL4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13S1OqOu012294
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Apr 2021 20:24:52 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 27
 Apr 2021 20:24:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 27 Apr 2021 20:24:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13S1Oq2u125611;
	Tue, 27 Apr 2021 20:24:52 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
CC: <meta-ti@yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH] linux-ti-mainline: Bump kernel version to v5.12
Date: Tue, 27 Apr 2021 20:24:47 -0500
Message-ID: <20210428012447.27679-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

And lets work with the latest kernel

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kern=
el/linux/linux-ti-mainline_git.bb
index 19c091e81e79..fc16485dc095 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -18,9 +18,9 @@ S =3D "${WORKDIR}/git"
 BRANCH =3D "master"
 TOOLS_BRANCH =3D "master"
=20
-# 5.11 Mainline version
-SRCREV =3D "f40ddce88593482919761f74910f42f4b84c004b"
-PV =3D "5.11+git${SRCPV}"
+# 5.12 Mainline version
+SRCREV =3D "9f4ad9e425a1d3b6a34617b8ea226d56a119a717"
+PV =3D "5.12+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.31.0

