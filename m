Return-Path: <tom.rini@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DF81E013E3
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:51 -0700 (PDT)
Received: by obbef5 with SMTP id ef5so2318832obb.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=0CqprySTiGHjg5AUZqeRlY3xpIwQZpUAJ7FVBLL3eIM=;
	b=yGcfTCWBUIy/byVgPZjCGsH38fX4nMe1llZZbGpBd/sxTYjQ/4GSfgKPZdJAIj2qc8
	eJi5wwedmSsf//AEdezFAGqE1K/CF6tlJW32OsuOkRDqkrUDCFRDAiSnpT6t+ocKyHbq
	GgmXcKqlwB9TQIk8mbmZMdssdHNqgdtS77+TIkJtVt+1t9pcWzHiZxxRy1k8yJmDBMlw
	1Przuk2DrFOhN1auZgAIwGMZ/YUVNpwbKWZV7uzVr+f4JLgwn9aq0qsZJXt8Fkw7/1Kd
	YIfhXKixciHnLz5VYy15vvhY0LyrmBIwe61XeOr7vGf2fe/9LnN4xA/dKsroBH+hADUt
	eogQ==
Received: by 10.182.119.101 with SMTP id kt5mr39513216obb.70.1332958490624;
	Wed, 28 Mar 2012 11:14:50 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id h5sm2962774oea.1.2012.03.28.11.14.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:14:49 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Mar 2012 11:14:38 -0700
Message-Id: <1332958485-967-3-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332524217-27534-1-git-send-email-trini@ti.com>
References: <1332524217-27534-1-git-send-email-trini@ti.com>
Subject: [PATCH v3 03/10] omap3evm.conf: Use '=+' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 28 Mar 2012 18:14:51 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/omap3evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index 9cd04ed..6a74f11 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -17,7 +17,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES =+ "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-- 
1.7.0.4


