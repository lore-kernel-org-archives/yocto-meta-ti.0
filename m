Return-Path: <tom.rini@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0132E013E5
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:53 -0700 (PDT)
Received: by mail-ob0-f176.google.com with SMTP id ef5so2318832obb.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=CXGtuXajlpYnXabrwWHeVIGluZsIUy55Jx5noDYqYiA=;
	b=iPXhlmusOvF3Z4Yr61WtUraiB60z6qtDLtTyT924RPYd4G8Swc/+CuSdegL/l7GXn5
	bkI2NggZ67LzyLGvQh4niW/GWf0oyDF/tv5cgJ/rD0J7O64mLNIBHkaq2Y8RzxIyTdUS
	B/ob+j8+McaOTuZ110IvcQZy6Zx0TGACty17xq4iCR2/4NF6VhZpBxtOZ8ig8YuS8yBV
	bf+GQGNZMU0iGwaSaBPhxjCQ+yACnkTn1KR/FOZC687gv6kBYyFoUmTNl2AW7GEG1JDQ
	ITo9GNpz0YEkvuw1T8A9lOoMkf324QMgq53uPpBXLUyFMps1SuN7lM6789Dk6aKH8Nyf
	CPEQ==
Received: by 10.182.174.101 with SMTP id br5mr40276641obc.0.1332958493514;
	Wed, 28 Mar 2012 11:14:53 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id h5sm2962774oea.1.2012.03.28.11.14.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:14:52 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Mar 2012 11:14:40 -0700
Message-Id: <1332958485-967-5-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332524217-27534-1-git-send-email-trini@ti.com>
References: <1332524217-27534-1-git-send-email-trini@ti.com>
Subject: [PATCH v3 05/10] am3517-evm.conf: Use '=+' not '+=' in IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 28 Mar 2012 18:14:53 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/am3517-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index b3efa9a..aa476a1 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -16,7 +16,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES += "ubi tar.bz2"
+IMAGE_FSTYPES =+ "ubi tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS2"
-- 
1.7.0.4


