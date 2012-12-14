Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E69E7E00348
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2012 09:38:16 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id 13so6217045iea.35
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2012 09:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=svnHkJ2akqDU3XtR5P71hv4yKFUTdy+A7Ta5+t6aDDg=;
	b=hsdwPpv+l1S6DO0MAeRnvMmH/iJzJ+s2JJIUAyCvubMz/GPAwfOsm0m6bDy0MkYDWH
	qFlojP4u9oq3hvAl07tosnlqLDlP/YgmtvLHmmnRBnJkyn/NqyhL5p20O8r1yXXGWhQr
	4ENE2a3fb+2RQdfpWV1EXHRcRfcHe7XoZj0zCRPzWkd47fh7ySjipxUlNuVQ2OFpdrTY
	2GUCWvnLyzdBp5wTDNhN+4MQOp/Te7Fs6EMoihMLOIBdofqVmv8wXdYLDSALIVMJJK7C
	Su3Lpy/E0tosWDMk7SONzUtVXguQXc6AjIaMZS7KuS/b3pui3L38g5Axfn5QBIKg3BfY
	JPpw==
Received: by 10.43.130.131 with SMTP id hm3mr5166604icc.25.1355506696581;
	Fri, 14 Dec 2012 09:38:16 -0800 (PST)
Received: from mars.hq.bec-systems.com (oh-69-34-21-229.sta.embarqhsd.net.
	[69.34.21.229])
	by mx.google.com with ESMTPS id gs6sm4430392igc.11.2012.12.14.09.38.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 09:38:15 -0800 (PST)
From: cliff.brake@gmail.com
To: meta-ti@yoctoproject.org
Date: Fri, 14 Dec 2012 12:38:08 -0500
Message-Id: <1355506688-5738-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH] mesa-dri: update to 8.0.5 to match oe-core
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 17:38:17 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
---
 recipes-graphics/mesa/mesa-dri_8.0.4.bbappend | 1 -
 recipes-graphics/mesa/mesa-dri_8.0.5.bbappend | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)
 delete mode 100644 recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
 create mode 100644 recipes-graphics/mesa/mesa-dri_8.0.5.bbappend

diff --git a/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend b/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
deleted file mode 100644
index 164ec1b..0000000
--- a/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require mesa-omap3-common.inc
diff --git a/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend b/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend
new file mode 100644
index 0000000..164ec1b
--- /dev/null
+++ b/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend
@@ -0,0 +1 @@
+require mesa-omap3-common.inc
-- 
1.8.0.2


