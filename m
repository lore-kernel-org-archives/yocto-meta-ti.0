Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1366.1624926380910325459
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 17:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vQLWkA+V;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T0QJRK106931;
	Mon, 28 Jun 2021 19:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624926379;
	bh=InvPIXDp+GUF+8rjmgOOBUfof9zv44Tdow4YVAhfnpo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vQLWkA+V5RpyJDe66DZN3BMeTCDm3wWCWcIZmLDxe99CDkJyYeA+ZUEyYJDbzjpRZ
	 6JcdqbWtSbvJI45f02/82yNqPh/73/yM9D6dpP5VXNJr6MU+l+De3GnTZmZMh+d4fd
	 WyxMA26Q5p3LtC6i0sEp5rVGk/Euh322jgSmTcBo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T0QJZ1068739
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 19:26:19 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 19:26:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 19:26:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T0QJIn113433;
	Mon, 28 Jun 2021 19:26:19 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri <praneeth@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 4/4] linux-ti-staging: Update to 08.00.00.001 release tag
Date: Tue, 29 Jun 2021 00:26:18 +0000
Message-ID: <20210629002618.29822-5-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629002618.29822-1-yogeshs@ti.com>
References: <20210629002618.29822-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index edb42156..ff807108 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "3314837930ce2cf2bbd51a34f32a7494a6aec8c8"
+SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
 PV = "5.10.41+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

