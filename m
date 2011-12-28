Return-Path: <pabigot@gmail.com>
Received: from mail-gx0-f176.google.com (mail-gx0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4216CE0129D
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:17 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by ggnr4 with SMTP id r4so10609348ggn.35
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=QGk9HKB+13G3HVD1meELuPNRzKjMxSHmazDyqADTH9s=;
	b=tJGkZQDkaMlk9ripvKvaUcCba4P5QtUSHjp5dGTHTLJB3JLxw0x0QByaDcNpxhX83e
	G9zv3AMCYemnM5r3z0LzEcdoZDjl596SBnN2sZqxUEIqjVgxkCE2akkUYEM2GM8qNI+6
	91oef/VhBrEfpnx+g3Ou9D1jJP1vL/CAOMn6A=
Received: by 10.101.101.6 with SMTP id d6mr12259242anm.8.1325033536476;
	Tue, 27 Dec 2011 16:52:16 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id k10sm18006608anb.22.2011.12.27.16.52.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 16:52:15 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 27 Dec 2011 18:51:58 -0600
Message-Id: <1325033520-6907-4-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1325033520-6907-1-git-send-email-bigotp@acm.org>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 3/5] ti-codec-engine: work around XDC runtime error
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
X-List-Received-Date: Wed, 28 Dec 2011 00:52:17 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

do_compile produces:

js: "/prj/oe/bb/build/tmp-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_26_02_11-r114a/codec_engine_2_26_02_11/packages/ti/sdo/ce/osal/linux/package.xs", line 50: XDC runtime error: gnu.targets.arm.GCArmv5T: '$used' is sealed

Fix comments out the conditional check per suggestion in
http://e2e.ti.com/support/dsp/omap_applications_processors/f/447/t/110920.aspx

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 .../bypass-GCArmv5T-used-is-sealed.patch           |   22 ++++++++++++++++++++
 .../codec-engine/ti-codec-engine_2.26.02.11.bb     |    3 ++
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/codec-engine/ti-codec-engine/bypass-GCArmv5T-used-is-sealed.patch

diff --git a/recipes-ti/codec-engine/ti-codec-engine/bypass-GCArmv5T-used-is-sealed.patch b/recipes-ti/codec-engine/ti-codec-engine/bypass-GCArmv5T-used-is-sealed.patch
new file mode 100644
index 0000000..b93161f
--- /dev/null
+++ b/recipes-ti/codec-engine/ti-codec-engine/bypass-GCArmv5T-used-is-sealed.patch
@@ -0,0 +1,22 @@
+do_compile produces:
+
+js: "/prj/oe/bb/build/tmp-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_26_02_11-r114a/codec_engine_2_26_02_11/packages/ti/sdo/ce/osal/linux/package.xs", line 50: XDC runtime error: gnu.targets.arm.GCArmv5T: '$used' is sealed
+
+Fix per suggestion in http://e2e.ti.com/support/dsp/omap_applications_processors/f/447/t/110920.aspx
+
+--- ./packages/ti/sdo/ce/osal/linux/package.xs.orig	2010-12-01 23:24:48.000000000 -0600
++++ ./packages/ti/sdo/ce/osal/linux/package.xs	2011-12-27 14:59:39.382423341 -0600
+@@ -47,10 +47,10 @@
+     }
+ 
+     /* Conditionally load CMEM here */
+-    var targetMod = xdc.useModule(prog.build.target.$name);
+-    if ((":"+targetMod.getISAChain().join(":")+":").match(/:v5T:/i)) {
++    //var targetMod = xdc.useModule(prog.build.target.$name);
++    //if ((":"+targetMod.getISAChain().join(":")+":").match(/:v5T:/i)) {
+         xdc.useModule('ti.sdo.linuxutils.cmem.CMEM');
+-    }
++    //}
+ 
+     var osalGlobal = xdc.useModule('ti.sdo.ce.osal.Global');
+ 
diff --git a/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb b/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
index ad06429..de4fc0e 100644
--- a/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
+++ b/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
@@ -1,6 +1,9 @@
 require ti-codec-engine.inc
 
 PV = "2_26_02_11"
+PR_append = "1"
+
+SRC_URI += "file://bypass-GCArmv5T-used-is-sealed.patch"
 
 SRC_URI[cetarball.md5sum] = "4f755f77119e4da19ab5cc7ae7ccfdb4"
 SRC_URI[cetarball.sha256sum] = "17fa053719265e0901fe3c3f90c9204957c6d0f5351d6b3ba4900df58cb7300f"
-- 
1.7.6.4


