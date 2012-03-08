Return-Path: <tom.rini@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D254E00596
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 11:34:09 -0800 (PST)
Received: by mail-iy0-f176.google.com with SMTP id w33so1426952iag.35
	for <meta-ti@yoctoproject.org>; Thu, 08 Mar 2012 11:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=eJR+qGvx7s2aGdqnLjTmc7lgNXE6ybFgVMP9lhyxrC0=;
	b=qKaMkrs6wFJC2nbODY0asMa/qszWwLldaT+8fdd6omcJibfS9vG41tDY1rIOeJXHdb
	FgRL+4CM4zMDxta+7f47EdojPsmzau0XQ1woSLWFLffwltlT2zogR4DK2AODI187t2g3
	jaCC4Zw+bkZMyOS8dKqDfCNiWIxVKggmmnJUnnB4oFcmDA3AF/CQTswtMompQDzT4KeQ
	B9tAk5JDIQAiP+X1NS2BSyMLzlPp8YJAjdM+qnyltORtXdt8kLX+N+dZAaLTE3Wm2NE6
	t31Xa82zsiORhHs3IXFqJB0WUzqHP/e7XBUI0R0nBYqAOia8l0/HNgImqkb9SnRiAZh8
	whGw==
Received: by 10.50.163.65 with SMTP id yg1mr8686953igb.31.1331235249334;
	Thu, 08 Mar 2012 11:34:09 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id mi10sm2419490igc.8.2012.03.08.11.34.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 11:34:08 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  8 Mar 2012 12:34:01 -0700
Message-Id: <1331235244-5173-2-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1331235244-5173-1-git-send-email-trini@ti.com>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
Subject: [PATCH 1/4] am37x-evm.conf: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 08 Mar 2012 19:34:09 -0000

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/am37x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index e4170f4..ddb54e8 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -16,7 +16,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES += "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-- 
1.7.0.4


