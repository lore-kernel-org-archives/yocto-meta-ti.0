Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.6771.1607693679058822127
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 05:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=hvnn1Bh1;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 4DB5F38C13A4
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 13:34:38 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDYbbQ067177
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 07:34:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607693677;
	bh=4fcg1pnuOsggdZIIJA1CzJ6SjKqtVYIQpasZ+sv7ZZA=;
	h=From:To:CC:Subject:Date;
	b=hvnn1Bh1uNmoaT5XL6PkF1eEZggHyXmB5n5eIKAm3UpG5mTG8t3MZr+n6TnF/HVnH
	 qE2lwb1Aq5jRsPgKE0+wAT7G2H4NWZ0vZLJ9tBfE63oxKF4xhs/qqukiH5g0t9fM5Y
	 CzV0C7G4B+mY+uWQDzBTOZ2+QzINYuvyg8ZIwKqw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBDYbfh074664
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 07:34:37 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 07:34:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Dec 2020 07:34:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDYbv6009728;
	Fri, 11 Dec 2020 07:34:37 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH] ti-sysbios: upgrade 6.76.03.01 -> 6.76.04.02
Date: Fri, 11 Dec 2020 07:34:36 -0600
Message-ID: <20201211133436.10566-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../{ti-sysbios_6.76.03.01.bb =3D> ti-sysbios_6.76.04.02.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.76.03.01.bb =3D> ti-sysbios_6.76.04=
.02.bb} (68%)

diff --git a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/recipes-ti/bios/t=
i-sysbios_6.76.04.02.bb
similarity index 68%
rename from recipes-ti/bios/ti-sysbios_6.76.03.01.bb
rename to recipes-ti/bios/ti-sysbios_6.76.04.02.bb
index d242510f801e..237b48929739 100644
--- a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
+++ b/recipes-ti/bios/ti-sysbios_6.76.04.02.bb
@@ -1,13 +1,13 @@
 require recipes-ti/bios/ti-sysbios.inc
=20
 PE =3D "1"
-PV =3D "6_76_03_01"
+PV =3D "6_76_04_02"
 PR =3D "r0"
=20
 LIC_FILES_CHKSUM =3D "file://manifest_bios_${PV}.html;md5=3D5cf40699c51b=
26d36fc01647c0b27fb1"
=20
-SRC_URI[sysbiosbin.md5sum] =3D "647243209d66d5dd35503b0ec5a84ab9"
-SRC_URI[sysbiosbin.sha256sum] =3D "b762b7f2343d26d367f952488e52904678512=
8005158cc921c3baef08e97116a"
+SRC_URI[sysbiosbin.md5sum] =3D "9766b12ea6dd4b3a035cdb6be54c5071"
+SRC_URI[sysbiosbin.sha256sum] =3D "d68ca3ba862f8f83a5bf7084af326ffa9fcb6=
4e39c866f98384d87c0ceca29be"
=20
 TI_BIN_UNPK_CMDS =3D ""
 TI_BIN_UNPK_ARGS =3D "--mode unattended --prefix ${WORKDIR}"
--=20
2.29.2

