Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.540.1582225717897526948
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xxxDIxie;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C156EE016E8; Thu, 20 Feb 2020 11:08:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FAA1E016B7
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 11:08:34 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJ8YTE073205
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 13:08:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582225714;
	bh=rfK8euyZQXln5KmJF3cOSjW8Iyy8m4cMCAuTf+uVtdw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xxxDIxieFq7X+jytfCBv7Zk8QCXpx81qpRzaN3+8rX0ly+tYG9gidJJGJPi0Iu5Dt
	 RWex5q+OTDN/Pr2+QaTpxaq0FOF7ROjgaIpZuQUw4aMGzd5Kzmqe9YdxOxD/dWL8ky
	 l/PmdhrVJTihZLaUwTj2+PfwAgAAx7U++/nvzlZM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJ8Yq3108008
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 13:08:34 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 13:08:33 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 13:08:33 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJ8Xpr074493;
	Thu, 20 Feb 2020 13:08:33 -0600
From: "Denys Dmytriyenko" <denys@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 2/4] omap-a15: add gc320 machine feature
Date: Thu, 20 Feb 2020 18:47:20 +0000
Message-ID: <20200220184722.25828-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220184722.25828-1-denys@ti.com>
References: <20200220184722.25828-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/omap-a15.inc                  | 2 +-
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index cc055365..a220828a 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -36,4 +36,4 @@ MACHINE_GUI_CLASS = "smallscreen"
 UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu mmip dsp"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu mmip dsp gc320"
diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index d6ecd229..9487e724 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-libs"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://Manifest.html;md5=a9121e8936ace09820d23f7626daaca5"
 
-COMPATIBLE_MACHINE = "dra7xx"
+COMPATIBLE_MACHINE = "omap-a15"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

