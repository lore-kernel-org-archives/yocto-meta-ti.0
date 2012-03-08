Return-Path: <tom.rini@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF902E00596
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 11:34:13 -0800 (PST)
Received: by mail-iy0-f176.google.com with SMTP id w33so1426952iag.35
	for <meta-ti@yoctoproject.org>; Thu, 08 Mar 2012 11:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=xE4HVmIyrQHeSBcL+/0x5giMhEaiFKtgmSE7PwVVDhs=;
	b=RpahKt/BOCIW4Rg0uNahxUKKZ2WrMWqt4ZAi8cf1+YySUHCtXHfz03G9Wx3pPPw/yr
	ALWZ0rPdsYNgV6xaFqwHNNAdc6uF6xbxTrbAcS8xNUsGz1XO+vEtkoH1xbwPXY/+rVvY
	r/Fv/J2iLzU6APDQ0T/1SSxNwZpya4k6A4SY2qB2dgsG32tTH81uyDcyia1iFVyXTE53
	TeG0U5Nq7+8bJfps2TB4xf7cl9JCofEY9+O+i7U92ddg1fyM/Nq6QoCRVCJooW50HEMm
	nDQ8ENzS/63QMtOaVT7hV6Ryax9BUvvs5Q6BrKG91GCiMwgPyK7UaXGkWDJ7HR1IsTBG
	fviw==
Received: by 10.50.89.233 with SMTP id br9mr19045623igb.48.1331235251865;
	Thu, 08 Mar 2012 11:34:11 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id mi10sm2419490igc.8.2012.03.08.11.34.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 11:34:11 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  8 Mar 2012 12:34:03 -0700
Message-Id: <1331235244-5173-4-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1331235244-5173-1-git-send-email-trini@ti.com>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
Subject: [PATCH 3/4] omap3evm.conf: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 08 Mar 2012 19:34:14 -0000

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


