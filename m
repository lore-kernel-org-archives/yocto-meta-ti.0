Return-Path: <tom.rini@gmail.com>
Received: from mail-gx0-f176.google.com (mail-gx0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37819E00747
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:57 -0700 (PDT)
Received: by ggcs6 with SMTP id s6so1237182ggc.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=rVy4XlzkIraWw5wAjg05vW+waLkY6s51+oXlMLsFc6g=;
	b=G7V1REYmTsCJgB7IOXNCY/FARgHazpNQsQm8yyyvPdng+ZST9uwrxBXrIIXtQ1ezR8
	93ggySypokG5RQWJCEULftz8QVvCzV9k4mIwSz2D/P02l0P+ZAUrrknCmNXhvzTL/HxB
	Nu/nq/9n90TUzslgRvMePr1xMivasJVkhzAdPAIYuY5mQHi1/d268hKz0Nep/k6OH9ad
	uusiEq6JVvZLv0RMAW4GfwtPzlGSFayxkWs5ktX1crNpGUQnnxvxfHGx/o/6K4qwEVB3
	REbCJ3RMME2DGFEcPJosci8o+jv7GoLO4Vg9JKJRQAyeZ8NVOj1xOgeoIKXtMdl9ICbD
	GR8w==
Received: by 10.60.3.34 with SMTP id 2mr38992132oez.27.1332958496600;
	Wed, 28 Mar 2012 11:14:56 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id h5sm2962774oea.1.2012.03.28.11.14.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:14:55 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Mar 2012 11:14:41 -0700
Message-Id: <1332958485-967-6-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332524217-27534-1-git-send-email-trini@ti.com>
References: <1332524217-27534-1-git-send-email-trini@ti.com>
Subject: [PATCH v3 06/10] beagleboard.conf: Use '=+' not '+=' in IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 28 Mar 2012 18:14:57 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/beagleboard.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 0043a70..d8bb1e2 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -19,7 +19,7 @@ EXTRA_IMAGEDEPENDS = "u-boot"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 
-IMAGE_FSTYPES += "tar.bz2 ubi"
+IMAGE_FSTYPES =+ "tar.bz2 ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp "
 
 # Guesswork
-- 
1.7.0.4


