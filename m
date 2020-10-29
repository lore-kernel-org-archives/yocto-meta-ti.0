Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5237.1604011834224458914
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 15:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=aACbAFoi;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1127038C066A
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2020 15:50:32 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TMoWUQ033320
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2020 17:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604011832;
	bh=dMEnnhCFxuoAa3h7WJpGV9sctifUBWkIVsrZkqzBGec=;
	h=From:To:CC:Subject:Date;
	b=aACbAFoil8b00XPXaxUm0wEjjtkzGq7b9NkfM8ndrOLUBJGMfv2ML6T5WRgMAJbso
	 tMFuIBWQHaUI9MVxs/l0/n4revO0KlRshYbOYq0B3udkQ4O0Or3wJh9Ci49Zgw7KcA
	 b1EPNykFRiQM+4wsHzcM4ppx5MScn/dAGK2hBBZA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TMoWZZ048760
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2020 17:50:32 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 17:50:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 17:50:31 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TMoVQj008260;
	Thu, 29 Oct 2020 17:50:31 -0500
Received: from localhost ([10.250.64.251])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 09TMoV9Y007383;
	Thu, 29 Oct 2020 17:50:31 -0500
From: "Suman Anna" <s-anna@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@yoctoproject.org>, Suman Anna <s-anna@ti.com>
Subject: [meta-ti][dunfell/master PATCH] ipc: ti-rpmsg-char: Update SRCREV
Date: Thu, 29 Oct 2020 17:50:19 -0500
Message-ID: <20201029225019.20179-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the ti-rpmsg-char SRCREV to pull in a bug fix.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 recipes-ti/ipc/ti-rpmsg-char.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-c=
har.inc
index b41e68eba0f9..cc60a46ab1ec 100644
--- a/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -8,7 +8,7 @@ BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=3D${PROTO=
COL};branch=3D${BRANCH};"
=20
 # Initial 0.1.0 release
-SRCREV =3D "9be402c2bf4053900b6b9a8092fbb42e7e303108"
+SRCREV =3D "8ab86e58c97b50fcf977ce8599e38fc8b517e962"
=20
 PV =3D "0.1.0+git${SRCPV}"
=20
--=20
2.28.0

