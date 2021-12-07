Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.60363.1638835865986829887
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 16:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=P+HVHyAm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B70AxVt078624;
	Mon, 6 Dec 2021 18:10:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638835859;
	bh=xhSq/GGF3zEpqWI+Kp9RBr0FxyzfeTVyzmZ9CPjypaw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=P+HVHyAmX7xU1bjFXsbJUt41ir7ACEL5e3Cn/60lJg1e9sDuoC+yrbQXPpgIUcaPd
	 s+CZa1EwgD+33GEkCRILpDTl+hN3eQWIUQwy5AachUBHfJUqtIf2LWar+WFBA3k49m
	 Lf8Yh1Nwj59z+3mzCYuPYUho83U4h1SEN48H3ReY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B70AxgH021321
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Dec 2021 18:10:59 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Dec 2021 18:10:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Dec 2021 18:10:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B70Axfd102205;
	Mon, 6 Dec 2021 18:10:59 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 1/2] linux-ti-staging: Bump linux version for 08.01.00.006
Date: Mon, 6 Dec 2021 18:10:58 -0600
Message-ID: <20211207001059.5572-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211207001059.5572-1-praneeth@ti.com>
References: <20211207001059.5572-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Bump linux and rt-linux version to 08.01.00.006

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 0dba981f..53c7462f 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "0c67d996db8f3c9149598bc98657ae28fee22208"
+SRCREV = "541ec9a6995c3dd881d6f0b63cc714a08ded457d"
 PV = "5.10.65+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 545ea569..9fd9506e 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "dfe78b39dc37d37666f04c788abcf7d72cca3e91"
+SRCREV = "dcc6bedb2c2bdb509709e4ae08303206e95ce6c2"
 PV = "5.10.65+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

