Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 921F8E00348
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2012 15:21:21 -0700 (PDT)
Received: by wibhq12 with SMTP id hq12so174310wib.5
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2012 15:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=KpXzlOS9SZU++e5Lv/ybKJ9CTQgcQjvibHWFtDFFDHU=;
	b=o534O+hQtwCS9ypkA43vDODbKcCVOXI3elHVny0Zb0XlLYgs3lQlsB10YeT3UI8it5
	r4r5PbaNnKBJE9fIWpwlLebhknN3rgwHwNvAAJ20rwi+ce5tnPb3ne91vbWounjhw3iv
	yMWkSkZzDxvYqCXKHC56Ir+558eM/C+7AGYgStcNeO9ka6CPUt9b3tQbxcVI9Sy5MBxC
	6FL6n073z5ADxtII9aciFrgRxJ9jmFoFyjIJ0yQ6iEtTet2qVZFYn8QQkJY3MXDe2f1C
	kgdW9KPHCfjB/ZUFeRAaBGP3JoaaM4E5qT0mlW//et/wlmgPisBEcu+gJf1xQyu+0hPD
	cgBQ==
Received: by 10.216.44.3 with SMTP id m3mr13345907web.129.1347488476357;
	Wed, 12 Sep 2012 15:21:16 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3A61.dip.t-dialin.net.
	[91.10.58.97])
	by mx.google.com with ESMTPS id t7sm15344476wix.6.2012.09.12.15.21.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 15:21:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Thu, 13 Sep 2012 00:28:53 +0200
Message-Id: <1347488933-11901-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH] mesa-xlib_*.bbappend: remove
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
X-List-Received-Date: Wed, 12 Sep 2012 22:21:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

oe-core removed mesa-xlib recipes

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-graphics/mesa/mesa-xlib_8.0.4.bbappend |    1 -
 recipes-graphics/mesa/mesa-xlib_git.bbappend   |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100644 recipes-graphics/mesa/mesa-xlib_8.0.4.bbappend
 delete mode 100644 recipes-graphics/mesa/mesa-xlib_git.bbappend

diff --git a/recipes-graphics/mesa/mesa-xlib_8.0.4.bbappend b/recipes-graphics/mesa/mesa-xlib_8.0.4.bbappend
deleted file mode 100644
index 164ec1b..0000000
--- a/recipes-graphics/mesa/mesa-xlib_8.0.4.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require mesa-omap3-common.inc
diff --git a/recipes-graphics/mesa/mesa-xlib_git.bbappend b/recipes-graphics/mesa/mesa-xlib_git.bbappend
deleted file mode 100644
index 164ec1b..0000000
--- a/recipes-graphics/mesa/mesa-xlib_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require mesa-omap3-common.inc
-- 
1.7.4.4


