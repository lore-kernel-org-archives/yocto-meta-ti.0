Return-Path: <tom.rini@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01403E013E1
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:49 -0700 (PDT)
Received: by ghbz10 with SMTP id z10so1247338ghb.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=cyL021UkwtjZEJaWyepa+6Kz4tonvnxAxgPcKwbod1Q=;
	b=t8TZ37VB8mUtyhaIeVUGXX+9afsdgLAbM6ufEJQxB2glzyN3mci9XRmySmD67iHTzj
	fgWJ89ZgEs8Jo+OXthTuW5J6B5v2juwlCKuHOHNySYxwvMIO4VN0u7JETz+UkUYI7ZKF
	QTLZwo4G/KDKKIgLpEdaxsp1o4aDFobOfqYDf21Wl5lZF2Eg4yf/CDPTQl9p1evpEmlz
	/ShMOta0aYehjQ2M6sGpp0+MCXXHyslI4pB9N9uMkNI2JbfCbN5hojC7W+7+3Btm6OmV
	0ulonXtyOceiqaMu/tSbH3aanMS+uSUSfXBYhqbRiLBzECO+7lN1urSdP3HRTIL4fwWG
	XLcg==
Received: by 10.60.28.137 with SMTP id b9mr39049569oeh.57.1332958489278;
	Wed, 28 Mar 2012 11:14:49 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id h5sm2962774oea.1.2012.03.28.11.14.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:14:48 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Mar 2012 11:14:37 -0700
Message-Id: <1332958485-967-2-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332524217-27534-1-git-send-email-trini@ti.com>
References: <1332524217-27534-1-git-send-email-trini@ti.com>
Subject: [PATCH v3 02/10] ti814x.inc: Use '=+' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 28 Mar 2012 18:14:50 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/include/ti814x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti814x.inc b/conf/machine/include/ti814x.inc
index c53557f..a7edb16 100644
--- a/conf/machine/include/ti814x.inc
+++ b/conf/machine/include/ti814x.inc
@@ -20,7 +20,7 @@ UBOOT_LOADADDRESS = "0x80008000"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 # Ship all kernel modules
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES =+ "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
 SERIAL_CONSOLE = "115200 ttyO0"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"
-- 
1.7.0.4


