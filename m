Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.2532.1614832100922731752
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Mar 2021 20:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=pEShX2hy;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 83FE838C0731
	for <meta-ti@yoctoproject.org>; Thu,  4 Mar 2021 04:28:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1244SGBa047404;
	Wed, 3 Mar 2021 22:28:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614832096;
	bh=FxXoC6Ur7MHNMdYf5ntAWlKdo374o1CJSFeXVnQuiKU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pEShX2hytIbq877Bjx7Fva8xnIDkOpNu0VXJl2SoAfztHi/qfEHdD2S0JhjTcN3bO
	 hhR+gnFEWXhbz/SrLIxwRW1EE33gxt+MJMvj7J5QWNKYZFCMwl5DYO1kO8W5cqH04y
	 S2hRRcpKSeAv8rgCxo4Vgleso15hiydJwH1pYqv0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1244SGsS046324
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Mar 2021 22:28:16 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Mar
 2021 22:28:16 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Mar 2021 22:28:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1244SGae001185;
	Wed, 3 Mar 2021 22:28:16 -0600
From: "Nishanth Menon" <nm@ti.com>
To: "meta-ti @ yoctoproject . org" <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>,
        "Bajjuri, Praneeth"
	<praneeth@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [PATCH dunfell/dunfell-next/master 2/2] linux-ti-mainline: Bump kernel version to v5.11
Date: Wed, 3 Mar 2021 22:28:08 -0600
Message-ID: <20210304042808.9389-3-nm@ti.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
In-Reply-To: <20210304042808.9389-1-nm@ti.com>
References: <20210304042808.9389-1-nm@ti.com>
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
index b4881d0d3a40..ed7607046186 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -15,9 +15,9 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "master"
=20
-# 5.9 Mainline version
-SRCREV =3D "bbf5c979011a099af5dc76498918ed7df445635b"
-PV =3D "5.9+git${SRCPV}"
+# 5.11 Mainline version
+SRCREV =3D "f40ddce88593482919761f74910f42f4b84c004b"
+PV =3D "5.11+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.25.1.377.g2d2118b814c1

