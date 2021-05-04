Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.3065.1620087554769529720
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 May 2021 17:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=axwWolkr;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0F21E38C0652
	for <meta-ti@yoctoproject.org>; Tue,  4 May 2021 00:19:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1440JC9A065525;
	Mon, 3 May 2021 19:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620087552;
	bh=DHukaHpOE59fln/aLCZg7U5GCOhegDDVl854N4nQMUs=;
	h=From:To:CC:Subject:Date;
	b=axwWolkrLUv9pF3twz424q01gQ4wrfKjQFF0njtVZIc37XE+vtjL5ED9tLe9xr9Nl
	 4VHWhr1G2umOI/R0KtVukXsj2CUfA1GMgwKU4llmSZvjwUn1D4gq5u+l38OxTiMz62
	 J/gctc6kBRabIce0MeDghMglTpSnXY12O47anTQs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1440JBhY027441
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 May 2021 19:19:11 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 3 May
 2021 19:19:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 3 May 2021 19:19:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1440JBVT029839;
	Mon, 3 May 2021 19:19:11 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
CC: <meta-ti@yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell PATCH V2] recipes-kernel: perf: Add a perf.bbappend to handle RDEPENDS on newer kernel
Date: Mon, 3 May 2021 19:19:09 -0500
Message-ID: <20210504001909.17039-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Commit 159cdb159ad0 ("perf-tests: add bash into RDEPENDS (v5.12-rc5+)")
in upstream openembedded-core layer.

Copying over a snippet of description over:

Commit 1dc481c0b0cf perf test: Change to use bash for daemon test
in upstream kernel
Changes tools/perf/tests/shell/daemon.sh to be explicitly bash
(it was already required, but was just skipped on various
 distros).

We add it into our RDEPENDS for perf-tests to fixup 5.12+
builds.

We already have relatively heavy RDEPENDS for perf tests (python3), so
adding bash into the RDEPENDS isn't signifcant even for older perf
builds that use the same recipe.

[OE patch by: Bruce Ashfield <bruce.ashfield@gmail.com>]
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- use append instead of prepend
- guard for ti-socs.

V1: https://lists.yoctoproject.org/g/meta-ti/message/13771?p=3D,,,20,0,0,=
0::created,0,,1,2,0,13771

 recipes-kernel/perf/perf.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 recipes-kernel/perf/perf.bbappend

diff --git a/recipes-kernel/perf/perf.bbappend b/recipes-kernel/perf/perf=
.bbappend
new file mode 100644
index 000000000000..9818a3b99ea7
--- /dev/null
+++ b/recipes-kernel/perf/perf.bbappend
@@ -0,0 +1 @@
+RDEPENDS_${PN}-tests_ti-soc +=3D "bash"
--=20
2.31.0

