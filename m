Return-Path: <tom.rini@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 593B4E013C9
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 11:34:13 -0800 (PST)
Received: by mail-iy0-f176.google.com with SMTP id w33so1426952iag.35
	for <meta-ti@yoctoproject.org>; Thu, 08 Mar 2012 11:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=N6VkGO5zZQ6BeQiYMA/qeExav9+L8pa+Onf61z0oJeA=;
	b=X9spoOQPvE3fq+XQJ5lrbYEipIaAhA/Buu2uhK/KH4wuXqlw0+OXRqr93950m71x5D
	gpkAlYWZXI4zN4AgUSPbYI0asLmlF1OaRkqdbP/e0BOizFgOmdRf+JVsZ98Gu6h5aQY9
	AEopdSjqhRipYrwFzYV1rrGLlEpwslNqk6XwgE6Zd2YhRCkk6fhForn9YRCezG+J4HAs
	kZIdBQ9XqhxnR2ZKRTnFSwg1VKlr9Pdz1NsRs2+3+j8yHdmekqLNWs3zsuACkWLFDWYG
	0srtJPkXNEwrL04nmiOBCY0mcGQoHrJRNVk8WfC/OkAKIKcgxFSwgFfrWT97tDf2oSWH
	+2eA==
Received: by 10.50.57.163 with SMTP id j3mr8698158igq.3.1331235253250;
	Thu, 08 Mar 2012 11:34:13 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id mi10sm2419490igc.8.2012.03.08.11.34.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 11:34:12 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  8 Mar 2012 12:34:04 -0700
Message-Id: <1331235244-5173-5-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1331235244-5173-1-git-send-email-trini@ti.com>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
Subject: [PATCH 4/4] am335x-evm.conf: Add 'ubi' to IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 08 Mar 2012 19:34:13 -0000

We also change to using '+=' not '?=' with IMAGE_FSTYPES and add the
required MKUBIFS_ARGS / UBINIZE_ARGS.  These are placed next to the
line that sets us to use the PSP kernel tree and reference the TI wiki
for the source of our info.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/am335x-evm.conf |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index eedf072..624f386 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -12,11 +12,15 @@ GUI_MACHINE_CLASS = "smallscreen"
 
 require conf/machine/include/ti33x.inc
 
-IMAGE_FSTYPES ?= "tar.bz2"
+IMAGE_FSTYPES += "ubi tar.bz2"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
+# UBI information, for more details see
+# http://processors.wiki.ti.com/index.php/UBIFS_Support
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 1580"
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
-- 
1.7.0.4


