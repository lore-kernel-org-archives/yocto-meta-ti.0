Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2094.1590774382361927197
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 29 May 2020 10:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=J8IQFXwr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04THkLTw091731
	for <meta-ti@lists.yoctoproject.org>; Fri, 29 May 2020 12:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1590774381;
	bh=YVvD21I9Yn5bHCdknec3BqMey1/QRLqBizBetoXtsx0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J8IQFXwrk0wjxkTgENUbnvVEwlqrgFmFaaTWgBhn4v4KlGUKO/rYOIckoOA0eTt5S
	 OMx5ZPaHucyBeWPcFe3EEVwy25PgOwRFcTuIB0o0i6PmPVp4piUA5PCyTbjCOiXvVD
	 9hE/xfBtN684wh3Mn+o6jTpPVzsIfH/Le8t0vhWM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04THkLYN029688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 29 May 2020 12:46:21 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 29
 May 2020 12:45:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 29 May 2020 12:45:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04THjBxu126081;
	Fri, 29 May 2020 12:45:11 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] linux-ti-staging: update to 5.4.40 and 07.00.00.004 tag
Date: Fri, 29 May 2020 12:45:05 -0500
Message-ID: <20200529174505.27706-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529174505.27706-1-dmurphy@ti.com>
References: <20200529174505.27706-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 7a2492a9..6f9f4619 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "83062031887b4a57d8e7761d56b6a08b931c8ad4"
+SRCREV = "8591cbda22d3b1a85bb8fae1195ce06323949bd3"
 PV = "5.4.40+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 27495512..e705c0ad 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -61,7 +61,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "7f8dc0f36a11569b8e901d8a466b5fcb4f7f01b8"
+SRCREV = "bf0b43568bb5b401970127e59bbbc7921cebe6d2"
 PV = "5.4.40+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.26.2

