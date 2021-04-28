Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5603.1619572303410884706
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 18:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=hrUcTpaq;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 2133238C06A7
	for <meta-ti@yoctoproject.org>; Wed, 28 Apr 2021 01:11:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13S1Bc5Z062657;
	Tue, 27 Apr 2021 20:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619572298;
	bh=c2us+PlFiHPNh8hw25lwqivXOLtUo14Llxub3vod3PQ=;
	h=From:To:CC:Subject:Date;
	b=hrUcTpaqZC5M4tPSVJVVjU5zXgJwV03zmAEebhVYutCjcoTBRRcUioJxxJ1cpJSPC
	 FS01xHlPiVdI3gG1xUE+9qbeeY4jJE5o0bSgU2/BMNOAsTewaHPg0w6iYsK/i6yeED
	 bSKhcK1MgwSaeozIi+8XMIdBtI5AZOepU+fMpGAI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13S1BcU4122872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Apr 2021 20:11:38 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 27
 Apr 2021 20:11:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 27 Apr 2021 20:11:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13S1BcEk129643;
	Tue, 27 Apr 2021 20:11:38 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
CC: <meta-ti@yoctoproject.org>, <lokeshvutla@ti.com>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.04 release
Date: Tue, 27 Apr 2021 20:11:37 -0500
Message-ID: <20210428011137.2501-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update u-boot recipe to be on the bleeding upstream tag.

While at it, also update the u-boot source url to point to the new
server as per [1].

While it may be redundant, lets document the usage of URI and
PROTOCOL for those, who (cough), may get tripped otherwise.

[1] https://source.denx.de/u-boot/u-boot/-/commit/a3bbd0b912f9afff745247f=
e9641961875322926

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V2:
- Things actually builds :)
-  Moaar documentation - could be redundant, but better help folks
   along.. a few bytes dont really matter

V2: https://lists.yoctoproject.org/g/meta-ti/message/13683?p=3D,,,20,0,0,=
0::Created,,mainline,20,2,0,82119050
V1: https://lists.yoctoproject.org/g/meta-ti/message/13682?p=3D,,,20,0,0,=
0::Created,,mainline,20,2,0,82118299
 recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u=
-boot/u-boot-ti-mainline_git.bb
index ee0b17640807..0d3f33ef8ff6 100644
--- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -4,7 +4,15 @@ LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D5a745=
0c57ffe5ae63fd732446b988025"
=20
 PR =3D "r0"
=20
-PV =3D "2020.10"
-UBOOT_GIT_URI =3D "git://gitlab.denx.de/u-boot/u-boot.git"
-UBOOT_GIT_PROTOCOL =3D "http"
-SRCREV =3D "050acee119b3757fee3bd128f55d720fdd9bb890"
+PV =3D "2021.04"
+
+# For the un-initiated:
+# The actual URL you'd use with a git clone for example would be:
+# https://source.denx.de/u-boot/u-boot.git/
+# However, in the context of OE, we have to explicitly split things up:
+# a) we want it to use git fetcher - hence git:// prefix in GIT_URI (if =
we
+#  used https here, we'd endup attempting wget instead of git)
+# b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL a=
s https
+UBOOT_GIT_URI =3D "git://source.denx.de/u-boot/u-boot.git"
+UBOOT_GIT_PROTOCOL =3D "https"
+SRCREV =3D "b46dd116ce03e235f2a7d4843c6278e1da44b5e1"
--=20
2.31.0

