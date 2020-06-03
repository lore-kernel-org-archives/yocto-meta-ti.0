Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.16447.1591198061552002699
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2020 08:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iR/kD3ks;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 053FRete029846
	for <meta-ti@lists.yoctoproject.org>; Wed, 3 Jun 2020 10:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1591198060;
	bh=vEIESQz4vxPEr3x2Jy36ZLsBb21O4EHxNfNS69Nrnjo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iR/kD3ksZQK5Toe8AMBD/w7+183/EjRglK6aYYU9AC+Ump0o0G0bACVAPguGV6o7i
	 +flBl89d0EvxOAy0Bk8A0UaZYJ2ZYXIg/hoaltj1dHu4tuS/euXERB7EyamBmhBugk
	 oY/+qr4AopIKzHJbG+xR95o0ydZZemB/SN4sxkNM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 053FReAL112163
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 3 Jun 2020 10:27:40 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Jun
 2020 10:27:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Jun 2020 10:27:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 053FRdSS033180;
	Wed, 3 Jun 2020 10:27:39 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] linux-ti-staging: update to 07.00.00.005 tag
Date: Wed, 3 Jun 2020 10:27:38 -0500
Message-ID: <20200603152738.5647-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603152738.5647-1-dmurphy@ti.com>
References: <20200603152738.5647-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 6f9f4619..6c53ec95 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "8591cbda22d3b1a85bb8fae1195ce06323949bd3"
-PV = "5.4.40+git${SRCPV}"
+SRCREV = "17e2c5c658e9bcdf7566c9e7f70b1f0a8c9f7036"
+PV = "5.4.43+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index e705c0ad..bfcc7f5b 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -61,7 +61,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "bf0b43568bb5b401970127e59bbbc7921cebe6d2"
+SRCREV = "66cf445b7697a4963cfc796e06918fe5b147fe7d"
 PV = "5.4.40+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.26.2

