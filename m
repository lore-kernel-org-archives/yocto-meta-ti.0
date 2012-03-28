Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5CDCE00747
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:15:01 -0700 (PDT)
Received: by mail-yw0-f48.google.com with SMTP id q46so1222020yhf.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=OyR8IPqF06mxOJbwqrJfoWaUayvCX14NT8hIHu38ReA=;
	b=Z2KaZrF2JoQpGD608Lm26Lf1tgdXC8O6rpioC4Z5McjCjlbepppbu+hTwLMIdqWYF3
	N1zuvsVO+FTiXX1IkanQIRysa/qAc60ijlju0+4JR/3QwJoPFUCMn9ZvftGdvYGRcj/r
	NAPyfcCReyPXiGTa2SjOw08MHyV03wJRRVkDPvM3V4uTU8YFlgtnZUYOaf9jJ9squYkM
	2VWbHVUWHFwsZjG4gejLUxAx0LYhRcCZ5mWhK7aq98/DVv+L4Sq+I+P80D7kUMVJWCvE
	Bi8vbPHXWYZ5g1dm+FlW1fR4pBos69xW3M9i1Cro5WXOF7bD6/PXsCC04/NAmpU+FsLH
	07tA==
Received: by 10.60.18.137 with SMTP id w9mr39146966oed.7.1332958501686;
	Wed, 28 Mar 2012 11:15:01 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id h5sm2962774oea.1.2012.03.28.11.15.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:15:01 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Mar 2012 11:14:44 -0700
Message-Id: <1332958485-967-9-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332524217-27534-1-git-send-email-trini@ti.com>
References: <1332524217-27534-1-git-send-email-trini@ti.com>
Subject: [PATCH v3 09/10] omap3-touchbook.conf: Use '=+' not '+=' in IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 28 Mar 2012 18:15:02 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/omap3-touchbook.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/omap3-touchbook.conf b/conf/machine/omap3-touchbook.conf
index 95d93ac..edded08 100644
--- a/conf/machine/omap3-touchbook.conf
+++ b/conf/machine/omap3-touchbook.conf
@@ -19,7 +19,7 @@ require conf/machine/include/omap3.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 
-IMAGE_FSTYPES += "tar.bz2"
+IMAGE_FSTYPES =+ "tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp "
 
 # Guesswork
-- 
1.7.0.4


