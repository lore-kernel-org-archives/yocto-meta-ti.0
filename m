Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.11413.1603376952972861425
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2020 07:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=u1SF7AF0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09METB40013886
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2020 09:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603376951;
	bh=zwFhTCe3u9b0/rqFr2U/O3oApSPNmyaCkkLSxRmca+Y=;
	h=From:To:CC:Subject:Date;
	b=u1SF7AF0uHVZqK6se7wgWBUAfdu4FkwczUcHjBhy83Ohf4LYWqq1NjB2OcicQZqJ4
	 tQjk0hIh0ZLZmuKsP2e52Z0GxluV6+uSpIe6xLos0uleN/Xw8ImrfhC1U9adTYGTt/
	 k8dj3I5Oe7BxHMXGe54fij4GIW7OGH2CzA91dYF8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09METB3M024082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2020 09:29:11 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 22
 Oct 2020 09:29:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 22 Oct 2020 09:29:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09METANp019906;
	Thu, 22 Oct 2020 09:29:11 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] boot-monitor: update to latest commit SHA
Date: Thu, 22 Oct 2020 09:29:09 -0500
Message-ID: <20201022142909.20780-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 1b6f3206afe7..9c436d1c1669 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -15,7 +15,7 @@ BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "e1f885ab6dc544884728e333cc6e396f7eb08286"
+SRCREV = "d57d5c1d8f0b0b1487484d9ceb1595bd4507231a"
 
 BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
 
-- 
2.28.0.585.ge1cfff676549

