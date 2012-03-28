Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63D2EE00747
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:48 -0700 (PDT)
Received: by yhfq46 with SMTP id q46so1222020yhf.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=E5TSEYWTheOEpZpU63ryLSoAhisMjH2PY0bUzEgPE38=;
	b=B7qsc03KUhivutvTo9KKtd/qRewjEA5QZa9wXw5rCERNj6+kMeO4TXQn41VJmmxlky
	RXZdPRbc2dh6rnjFRCVcZ9dkLVTTcbOULR0hIdpptAMmaAlC1hWxla1ECH8ItLRcxVSb
	f1Vjk6PNniqhEIiAeDZhJPanC3I23gFOYXZ6hwGcTRQXbM6pFcxa8rvYN6BDfvXn1/lc
	vQ33KYSvpGHaOvoPZuglB4/PdtQs5lg6yjRSKxKa1hzVi6FefotFjt8DEEAvKIXl1Lpu
	2RrYlsxicMk9xrTNbf4k/l57/4TulnW9+bNgHq511jWoiHCTnzAC6t1GkmoFsWWC7bip
	62Qw==
Received: by 10.60.20.3 with SMTP id j3mr33052500oee.43.1332958487639;
	Wed, 28 Mar 2012 11:14:47 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id h5sm2962774oea.1.2012.03.28.11.14.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:14:46 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Mar 2012 11:14:36 -0700
Message-Id: <1332958485-967-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332524217-27534-1-git-send-email-trini@ti.com>
References: <1332524217-27534-1-git-send-email-trini@ti.com>
Subject: [PATCH v3 01/10] am37x-evm.conf: Use '=+' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 28 Mar 2012 18:14:48 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/am37x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index e4170f4..3c6130a 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -16,7 +16,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES =+ "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-- 
1.7.0.4


