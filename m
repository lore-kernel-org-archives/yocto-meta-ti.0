Return-Path: <pabigot@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A423E01410
	for <meta-ti@yoctoproject.org>; Mon, 14 Jan 2013 11:41:26 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id 13so5582096iea.7
	for <meta-ti@yoctoproject.org>; Mon, 14 Jan 2013 11:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Tg1YztOstyE8MWQVfuJ0lyeLzRkZv+469HYR3wSBeQo=;
	b=F+cBSPCqTzgjtB6SxSaQ1kOWQLuC7578c79Vaz20QAAHob+U7mCb7dkFJI8S9GnMe5
	mVMpyHWr5JytJ1wVPkBbhPd0GUG442sjyQS8/WRLodvS1yfBpgqLTLMzBkrNlnl+l6xw
	dhN/pBAXzTEHEGUI9tjqJCRbJiNfBlisVPkzTmP+dyIhmwIdwoVT5/0KAgGUYMWIVNZ5
	cthTr98mJ39XzRbBGzMvLrWxh3JmFVIhwQJ8EC+bKK9V5GVD5tX5H33boKsritDz0kGr
	Cy1XkLajalWZNfZduCCaBWnD0a9CGKH15uPo7zsLdJ1VLONwRYL9xaWBbAvWW2ptTdED
	57Kw==
X-Received: by 10.50.214.97 with SMTP id nz1mr7653008igc.36.1358192485946;
	Mon, 14 Jan 2013 11:41:25 -0800 (PST)
Received: from llc.pab (c-66-41-60-82.hsd1.mn.comcast.net. [66.41.60.82])
	by mx.google.com with ESMTPS id rd10sm98877igb.1.2013.01.14.11.41.24
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 11:41:25 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <pab@pabigot.com>
To: meta-ti@yoctoproject.org
Date: Mon, 14 Jan 2013 13:41:01 -0600
Message-Id: <1358192461-23771-3-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1358192461-23771-1-git-send-email-pab@pabigot.com>
References: <1358192461-23771-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 2/2] libgles-omap3: ignore QA errors
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
X-List-Received-Date: Mon, 14 Jan 2013 19:41:26 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

This patch allows libgles-omap3 to build on the danny branch.  The following
warnings are not addressed:

 WARNING: libgles-omap3: No generic license file exists for: proprietary-binary in any provider
 WARNING: QA Issue: libgles-omap3: Files/directories were installed but not shipped
  /usr/lib/ES2.0
 WARNING: libgles-omap3: The compile log indicates that host include and/or library paths were used.
         Please check the log '/prj/oe/omap/build-gumstix-community-danny/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libgles-omap3-4.05.00.03-r35/temp/log.do_compile' for more information.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 recipes-graphics/libgles/libgles-omap3.inc |   30 ++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index cb96e4f..ca6d920 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -353,12 +353,42 @@ RDEPENDS_${PN} += "fbset devmem2"
 
 #HACK! These are binaries, so we can't guarantee that LDFLAGS match :(
 INSANE_SKIP_${PN} = "ldflags dev-so"
+INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"	
+INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths"
+INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths"
 INSANE_SKIP_${PN}-blitwsegl = "ldflags"
+INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags"
+INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags"
+INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags"
+INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags"
 INSANE_SKIP_${PN}-flipwsegl = "ldflags"
+INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags"
+INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags"
+INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags"
+INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags"
 INSANE_SKIP_${PN}-frontwsegl = "ldflags"
+INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags"
+INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags"
+INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags"
+INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags"
 INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags"
+INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags"
+INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags"
+INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
+INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
 INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so"
 INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so"
 INSANE_SKIP_${PN}-tests = "ldflags"
 INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
 
-- 
1.7.7.6


