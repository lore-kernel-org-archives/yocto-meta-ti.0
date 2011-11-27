Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64EA3E0030A
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 27 Nov 2011 07:03:48 -0800 (PST)
Received: by mail-ww0-f51.google.com with SMTP id 28so7786465wwo.8
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 27 Nov 2011 07:03:48 -0800 (PST)
Received: by 10.180.108.47 with SMTP id hh15mr42180543wib.14.1322406227980;
	Sun, 27 Nov 2011 07:03:47 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ep13sm35611568wbb.8.2011.11.27.07.03.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Nov 2011 07:03:47 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Sun, 27 Nov 2011 16:03:38 +0100
Message-Id: <1322406218-8831-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1322406218-8831-1-git-send-email-koen@dominion.thruhere.net>
References: <1322406218-8831-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 2/2] beagleboard: remove x-load from IMAGE_DEPENDS, we're SPL based now
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
X-List-Received-Date: Sun, 27 Nov 2011 15:03:48 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/beagleboard.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 73483bc..0043a70 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -14,6 +14,9 @@ GUI_MACHINE_CLASS = "bigscreen"
 
 require conf/machine/include/omap3.inc
 
+# SPL build
+EXTRA_IMAGEDEPENDS = "u-boot"
+
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 
 IMAGE_FSTYPES += "tar.bz2 ubi"
-- 
1.7.2.5


