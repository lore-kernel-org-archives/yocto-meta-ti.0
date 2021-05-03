Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1893.1620081791127254667
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 May 2021 15:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=WSn3bCWD;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8A8C538C0892
	for <meta-ti@yoctoproject.org>; Mon,  3 May 2021 22:43:09 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 143Mh5Pt025177;
	Mon, 3 May 2021 17:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620081785;
	bh=HRko5tzpVVBPvUfDUBk4rqCqlXoB+ZTLTYfSEdeHcg0=;
	h=From:To:CC:Subject:Date;
	b=WSn3bCWDfLN8/ZmUjRJhLiOZe1hnUR7qbfPZBUultXuoFRSI5KxV/A/RT2SQ4juIz
	 Fe5PyABVpkKq2rUhtC562mC1xOX70Csc56SDZH7SkTLuO3nzHoJ0E4Cu08T4ZN/9aT
	 ToPy1GIP5zllo5Acep+ve+orMSP+itC6IMuLzZqM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 143Mh5n2046286
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 May 2021 17:43:05 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 3 May
 2021 17:43:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 3 May 2021 17:43:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 143Mh4Xu015046;
	Mon, 3 May 2021 17:43:04 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
CC: <meta-ti@yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell PATCH] recipes-kernel: perf: Add a perf.bbappend to handle RDEPENDS on newer kernel
Date: Mon, 3 May 2021 17:43:03 -0500
Message-ID: <20210503224303.15093-1-nm@ti.com>
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

This patch should NOT be applied to master, since master of OE-core has
the fixup for this.

 recipes-kernel/perf/perf.bbappend | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 recipes-kernel/perf/perf.bbappend

diff --git a/recipes-kernel/perf/perf.bbappend b/recipes-kernel/perf/perf=
.bbappend
new file mode 100644
index 000000000000..9915a2997b71
--- /dev/null
+++ b/recipes-kernel/perf/perf.bbappend
@@ -0,0 +1,2 @@
+
+RDEPENDS_${PN}-tests =3D+ "bash"
--=20
2.31.0

