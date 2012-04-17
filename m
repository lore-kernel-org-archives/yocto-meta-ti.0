Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F07EE0044A
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:47:53 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so1432535wgb.11
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=cj5FyKMP2HFe42dLIS4X/tJEddJ5MJpDA6fGCAIvETw=;
	b=cYvXzq87lP8Dp9OBAElCdSzFNcFV8Eh0obMlhAeF6QTAZ1RjPUefwmnAa6lMp5cY2h
	kq5Qgi42gwdPDaVUvz/Ho05HnRm8mOhsMAGy3Q1oSomnGma/nV1cZh/sPM9z8UumXPYj
	QhRzPZqwhlZt89IU/ObSW3ssmM2MWipRG7maEtx+Jged8dg8+OoHmsU1v5e5f/yZ1F4W
	J4UFKY8A+nEXVtEVqPlQL2CvdDt/2TzF0L0PZTi1qX9Lsb68ma4RzI/ExKh2vuze9r9K
	oU9i/5CuKnrBo7H09ot7bHojbrUS5tdZ8Qai959CC+WAnnK8hyFLMx7i2yUT3KCkKclN
	uo4Q==
Received: by 10.180.98.8 with SMTP id ee8mr12177240wib.14.1334666872588;
	Tue, 17 Apr 2012 05:47:52 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm43052691wiw.5.2012.04.17.05.47.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 05:47:51 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue, 17 Apr 2012 14:47:40 +0200
Message-Id: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmaW+Oj6qejtvcWa9nkULIFtk1DqWLUPBLtlbTaVcQ+EgQ4XBA6j4pd/0MyhGVATSt+LN6F
Cc: denys@ti.com
Subject: [PATCH v2 1/7] linux 3.0: update to 3.0.28
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 12:47:53 -0000

Runtime tested on Angstrom/beagleboard-xM

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/omap3.inc    |    2 +-
 recipes-kernel/linux/linux_3.0.bb |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 16078db..9903856 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r118"
+MACHINE_KERNEL_PR = "r119"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index a817c1d..522a87d 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,9 +5,9 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.25"
-# v3.0.25 tag
-SRCREV_pn-${PN} = "9bf176a3e029ae7f2dc6feae185091525a988be2"
+PV = "3.0.28"
+# v3.0.28 tag
+SRCREV_pn-${PN} = "0527fde0639955203ad48a9fd83bd6fc35e82e07"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "a"
-- 
1.7.2.5


