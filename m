Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.4665.1618289148618809850
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 21:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ci4qxNtZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13D4jlVp126313;
	Mon, 12 Apr 2021 23:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618289147;
	bh=t8MhNiQY7v/kzvk0ginSVXhNS7KwfwGozq32XBgMOWo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ci4qxNtZbTioD1iVTGGTqYPh3ciTxbi2RcteroW9fEAolXII9ZX2uhVAqh1MpbAWy
	 R43gTxOCLYVvNHaED8xmGjC2hd5AXEsmrwajM5zYdtI7wstdqoLBnu/LjmvYf72IZV
	 JxP3VmKL514J2hW4HzqKf/97ZkZ0nK5Q3gnqc2fY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13D4jlRh107929
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Apr 2021 23:45:47 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 12
 Apr 2021 23:45:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 12 Apr 2021 23:45:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13D4jlPu072900;
	Mon, 12 Apr 2021 23:45:47 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 3/4] Revert "linux-ti-staging-5.10: With the kernel being AUTOREV'd remove the minor version"
Date: Mon, 12 Apr 2021 23:45:45 -0500
Message-ID: <20210413044546.12409-4-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413044546.12409-1-praneeth@ti.com>
References: <20210413044546.12409-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit a0ee3effd66844aad8f693db821b6e3cc002240a.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index fc115958..e317e3a4 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 BRANCH = "ti-linux-5.10.y"
 
 SRCREV = "44fb363f878fa80d5b502291954bb83d9cae842b"
-PV = "5.10+git${SRCPV}"
+PV = "5.10.7+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.17.1

