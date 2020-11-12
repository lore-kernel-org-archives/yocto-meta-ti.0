Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12918.1605222847011474649
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 15:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Lf/X9LAG;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 22AEE38C0658
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 23:14:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACNE5dR009558
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 17:14:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605222845;
	bh=zlu4DsQPa22/MDmOABCtDbeIGGobwvwfdIsd0Hehk4k=;
	h=From:To:CC:Subject:Date;
	b=Lf/X9LAGil7YHQuwi0Hg1yfg0N6hvc7XI1M/2DjkrGa9YDaZnK93gj/yadmpfrroS
	 CoNSxNW6hjK3ZRLHMWhcDmzLWcbSU0w/Gamp5SL1TYUK0PT67f/OjmoZjt4cAGf6om
	 SI8MW7JqTIFkDBLqeUouuQV16+m04JYVJxfJMKwk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACNE57q104685
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 17:14:05 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 17:14:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 17:14:04 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ACNE4cA118294;
	Thu, 12 Nov 2020 17:14:04 -0600
Received: from localhost ([10.250.38.244])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 0ACNE4jC004897;
	Thu, 12 Nov 2020 17:14:04 -0600
From: "Suman Anna" <s-anna@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <meta-ti@yoctoproject.org>, Suman Anna <s-anna@ti.com>
Subject: [meta-ti][dunfell/master PATCH v2] k3conf: Update SRCREV to latest
Date: Thu, 12 Nov 2020 17:13:57 -0600
Message-ID: <20201112231357.26689-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Use latest SRCREV on master branch to pick up all the
changes compliant with TIFS 2020.08b firmware.

The license CHKSUM also need to be updated due to a minor
change from http to https in the Copyright line.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: Updated LIC_FILES_CHKSUM value to fix build error

 recipes-devtools/k3conf/k3conf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3c=
onf/k3conf_git.bb
index 6771eeb7682e..e4fa54c3bee0 100644
--- a/recipes-devtools/k3conf/k3conf_git.bb
+++ b/recipes-devtools/k3conf/k3conf_git.bb
@@ -1,14 +1,14 @@
 SUMMARY =3D "Diagnostic tool for TI K3 processors"
=20
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://common/k3conf.c;beginline=3D1;endline=3D34;=
md5=3D37f4e460bd8501c6f02ce71f02bc7ccf"
+LIC_FILES_CHKSUM =3D "file://common/k3conf.c;beginline=3D1;endline=3D34;=
md5=3D7154c0ffcd418064ffa528e34e70ca9d"
=20
 PV =3D "0.1+git${SRCPV}"
=20
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

