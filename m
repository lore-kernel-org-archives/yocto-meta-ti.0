Return-Path: <tom.rini@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36522E013DF
	for <meta-ti@yoctoproject.org>; Thu, 29 Mar 2012 10:18:29 -0700 (PDT)
Received: by obbef5 with SMTP id ef5so4359358obb.35
	for <meta-ti@yoctoproject.org>; Thu, 29 Mar 2012 10:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=NGwQlIfN9m4YKYiuN2+AeFMgYOF8pC7s5Cm13tkx108=;
	b=epPr2Yjm3w1DwUGu0VwyarsrKPv5xu3euPH/l67oKnGV0rUHnYATN0jcil3N01459J
	p7nxN9ZAf+kgOey30s3zu50wb9FhKMSW8uY8lWbJEKtiRM7a6lRKzey0SBebDkHmNtur
	kVWn07H4dkY1/kHtfsDtQEa4/nm7DixwyJwP5xlMY14XPPBsGS62PEENYof9cgplsT6F
	VPMUZ3j68ntzj3dQALGP+b5Byy2CEqOCTosbK2B65JiWmjneCnClV/z/6joVWv36h4Q/
	vupUa2YiNaEZ954joenjp510IeNS3W3YNRR0uVOM8i/KfOeGaQo24BOvEgvWl8tZ/D8O
	l71A==
Received: by 10.182.159.41 with SMTP id wz9mr44152075obb.69.1333041508841;
	Thu, 29 Mar 2012 10:18:28 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id r8sm2854153oer.6.2012.03.29.10.18.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 10:18:27 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 29 Mar 2012 10:18:16 -0700
Message-Id: <1333041498-18971-2-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332958485-967-1-git-send-email-trini@ti.com>
References: <1332958485-967-1-git-send-email-trini@ti.com>
Subject: [PATCH v4 2/4] ti814x.inc: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 29 Mar 2012 17:18:29 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '+=' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/include/ti814x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti814x.inc b/conf/machine/include/ti814x.inc
index c53557f..475a212 100644
--- a/conf/machine/include/ti814x.inc
+++ b/conf/machine/include/ti814x.inc
@@ -20,7 +20,7 @@ UBOOT_LOADADDRESS = "0x80008000"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 # Ship all kernel modules
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES += "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
 SERIAL_CONSOLE = "115200 ttyO0"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"
-- 
1.7.0.4


