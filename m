Return-Path: <tom.rini@gmail.com>
Received: from mail-gx0-f176.google.com (mail-gx0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1E3BE013D9
	for <meta-ti@yoctoproject.org>; Thu, 29 Mar 2012 10:18:30 -0700 (PDT)
Received: by ggcs6 with SMTP id s6so2129766ggc.35
	for <meta-ti@yoctoproject.org>; Thu, 29 Mar 2012 10:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=fI41W7H44Hz/wbzLHZCXIX6WwCNbQRVJWMt0LFooKpg=;
	b=E7OR0fMyX8/Y9VpNxqbk1e83i6ta2uYdu8ixuV8aqw62Ul2YS0das+nvHqaY7V47QN
	2rsviPbko+4nPZ2GBcBrX9RAYU2luuXSqtTzgJC0LJpwZxv9Xp7e4TUu7Eyd4TnyJXNk
	0aYojXK2LcO/opX3700oBifa2Yja3Bt2s9IWARHpaAa2BYMtYPwHEV31tWhr7q1CZ04B
	Zz5DqSsoWveRPXuzJ/Lyg7X/Ly6aOhDglu4xOUUqGWrj1KxpYN94gxjlJdvRhB/WJGdJ
	jRZdgdw/tOdvE7bk6b/WSUExvapGmY9N7fVpmP0JO73d0sFrBGlv8GVmzqqXu/5mvI5i
	YJkA==
Received: by 10.60.28.103 with SMTP id a7mr44644754oeh.24.1333041510244;
	Thu, 29 Mar 2012 10:18:30 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id r8sm2854153oer.6.2012.03.29.10.18.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 10:18:29 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 29 Mar 2012 10:18:17 -0700
Message-Id: <1333041498-18971-3-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332958485-967-1-git-send-email-trini@ti.com>
References: <1332958485-967-1-git-send-email-trini@ti.com>
Subject: [PATCH v4 3/4] omap3evm.conf: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 29 Mar 2012 17:18:31 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '+=' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/omap3evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index 9cd04ed..16caf05 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -17,7 +17,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES += "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-- 
1.7.0.4


