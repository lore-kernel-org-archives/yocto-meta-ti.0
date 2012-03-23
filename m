Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A5DBE013A3
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:37:00 -0700 (PDT)
Received: by yhfq46 with SMTP id q46so3800066yhf.35
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=AkdXppEajXQuyFNWX1silkQFiW2ZGGRdC3OHgIQ1tIQ=;
	b=dD9GtklTImcnkxJvgpGicDM5Zng6tVurFsxAUY28V6j5QLq45uG/fHeTozaK+p4+os
	4EYQ7uYx/h8VmCebZUl0CB9yNvtBC0aUcW1F4aCHyhMy+dt4Zb5gjm2ttTVoNGMYLnRM
	AfSy7gJINhHpC5r+v6/oyZDbcDMKW1uEjkbx4x3QkMYflr4SsAiH6C1Bvoy+j1S0wVZD
	wagtv0krLxIpuYaeb10nojpRfgnTUOxLOQH/+FL/1dnohzzpt+LR2xPUL/2x8qg2WDvA
	HW74uAOTmeLfSvpvORFwOF7JJgBw6dVa3tjsosfdeXq1zB4JG5VyJfUC6mWt6kDsoR3N
	AK2w==
Received: by 10.60.14.136 with SMTP id p8mr15260445oec.68.1332524220067;
	Fri, 23 Mar 2012 10:37:00 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id d9sm8324697obq.0.2012.03.23.10.36.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:36:59 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 23 Mar 2012 10:36:56 -0700
Message-Id: <1332524217-27534-3-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1331235244-5173-1-git-send-email-trini@ti.com>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
Subject: [PATCH v2 3/4] omap3evm.conf: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 17:37:01 -0000

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/omap3evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index 9cd04ed..c0936d2 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -17,7 +17,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES = "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-- 
1.7.0.4


