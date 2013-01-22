Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED7B2E01456
	for <meta-ti@yoctoproject.org>; Tue, 22 Jan 2013 09:13:47 -0800 (PST)
Received: by mail-ie0-f170.google.com with SMTP id k10so12091419iea.1
	for <meta-ti@yoctoproject.org>; Tue, 22 Jan 2013 09:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=7iRtXQBAvlfm3lmxUTZC5edjR+C40NZOGCiBeCd43IE=;
	b=l4/P6c+jzNmcDp3X7JlSdUfbXEE2dbOfAbA+O+89MequOzuN7TlWLJ8v1TF+qOS4/U
	N4niP2Wr3wuTld6ZZL+L60NVxG+UL9Y9djTLS997QUPkIjwV4y3pWMbEoXfG24XeASMs
	RmOGuqLVsChmvHxl2yGwWLgvCplXpnlthOumES8cVJkU/w2WGM062geH4eJjlSiDSpl7
	WeGKrh1XUitERIA2+080sI9RhPhdFVCIoagirLqfeOU9I5bdvMDq89tyOmf3Pvs5V2Ht
	IfPGVseeqFBn6hyYtwIpyxsMxqp0ybHPUKeCV9ZnN87QW3CjwYR3eEc1M1q26mZ59cnH
	svRA==
X-Received: by 10.50.149.166 with SMTP id ub6mr12294268igb.57.1358874827395;
	Tue, 22 Jan 2013 09:13:47 -0800 (PST)
Received: from mars.hq.bec-systems.com (oh-69-34-21-229.sta.embarqhsd.net.
	[69.34.21.229])
	by mx.google.com with ESMTPS id rd10sm11141774igb.1.2013.01.22.09.13.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 09:13:45 -0800 (PST)
From: Cliff Brake <cliff.brake@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 22 Jan 2013 12:13:20 -0500
Message-Id: <1358874800-28157-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH] add extra '#' to multi-line comment
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
X-List-Received-Date: Tue, 22 Jan 2013 17:13:48 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Bitbake is getting more particular:
ERROR: There is a confusing multiline, partially commented expression on
line 27 of file /scratch/oe/oe-build-core-3/sources/meta-ti/...
Please clarify whether this is all a comment or should be parsed.

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
---
 recipes-kernel/linux/linux_3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index 0ec0d26..d6ed98c 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -24,6 +24,7 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;pro
 
 # Needs refresh:
 #            file://beagle/0003-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch \
+#
 
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
-- 
1.8.1.1


