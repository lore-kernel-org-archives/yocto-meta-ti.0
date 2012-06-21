Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80957E01426
	for <meta-ti@yoctoproject.org>; Thu, 21 Jun 2012 16:13:12 -0700 (PDT)
Received: by wibhq12 with SMTP id hq12so50905wib.11
	for <meta-ti@yoctoproject.org>; Thu, 21 Jun 2012 16:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=dJGnRm6tFAQR1UEU8Ag40YaVRDHBQ6cEwjDhPPyqikQ=;
	b=0E2Wrd7oJYlK41XHYiQ1tniKWiOcIV2lz5fCk8EaHB718Wv2/z+sUah2yx8pYZxk1b
	0OvgRsxcO1V59c+k7GIxcCMdR82dQ/MBqbKL0690YiJsvLa75LEybx7VzRZ9ljA/P0uP
	0td0p1nmSrUHh0JJ+LpWQBVeCOxfOoCOnNT5xGAN0Z0q7lGjYtxdizVskOIsn+CAMu/m
	AmXew5aCld1TT08x7Hk+AAL8cRnaYQGATvdiuBScqSjZ0kZyma358PBmG09lrhR85h20
	wq/zIhVZjrJu5eTSyLPP4S/bkoaNOsm1oHmCCxrbtJKPWSr2YuRXNRBEUcZS//Ei1/aR
	qP2Q==
Received: by 10.180.92.69 with SMTP id ck5mr384463wib.14.1340320391273;
	Thu, 21 Jun 2012 16:13:11 -0700 (PDT)
Received: from localhost.localdomain (p5B0A25C2.dip.t-dialin.net.
	[91.10.37.194])
	by mx.google.com with ESMTPS id k8sm93735657wia.6.2012.06.21.16.13.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 16:13:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 22 Jun 2012 01:19:38 +0200
Message-Id: <1340320778-912-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1340320778-912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1340320778-912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] linux.inc: remove unused variable RPSRC
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
X-List-Received-Date: Thu, 21 Jun 2012 23:13:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-kernel/linux/linux.inc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index 02f7cef..ac51dae 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 inherit kernel siteinfo
 
-RPSRC = "http://www.rpsys.net/openzaurus/patches/archive"
-
 # Enable OABI compat for people stuck with obsolete userspace
 ARM_KEEP_OABI ?= "1"
 
-- 
1.7.4.4


