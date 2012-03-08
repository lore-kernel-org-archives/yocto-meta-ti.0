Return-Path: <tom.rini@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E25BE00596
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 11:34:11 -0800 (PST)
Received: by yenq4 with SMTP id q4so593094yen.35
	for <meta-ti@yoctoproject.org>; Thu, 08 Mar 2012 11:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=x7ZTW7xmojOujvZ36hLh5hhy7kgSnsiQ+bOfhx3JUZg=;
	b=z7ORnrV6R5TV/nAcx77L79sQA7OQkr3L+V+dPQ78SW+McMnnAu1EEWueE0Cm89HSVi
	m/nuGH5rxE1aMGuGCzm5AZqHGrKVjPa4SVSUqDXg11pyiTAS+eLCVhXvwV646T6ZlqNI
	V8ZTCYKzeOixQXiZj2t1rTzhwrCB3zZgkQFEJDe48O4IHt+A0xanw9r7DObCKW/01WPu
	bFLjvO2YzqmjkI2UGr5FEeLgBmec8N1tMWXkQNDoFjmTTbBQSR4ZUXF3I0dzi2/Zqkzq
	yBjfKKk0OrIIUZtQqqLr5HdLzXSHKKU9+GYVBgFq/TG3gcCNlZc8YgcyjXK9H0FRACiN
	/CVQ==
Received: by 10.50.77.170 with SMTP id t10mr8620139igw.35.1331235250629;
	Thu, 08 Mar 2012 11:34:10 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id mi10sm2419490igc.8.2012.03.08.11.34.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 11:34:09 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  8 Mar 2012 12:34:02 -0700
Message-Id: <1331235244-5173-3-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1331235244-5173-1-git-send-email-trini@ti.com>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
Subject: [PATCH 2/4] ti814x.inc: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 08 Mar 2012 19:34:11 -0000

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


