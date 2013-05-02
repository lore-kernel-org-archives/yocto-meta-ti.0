Return-Path: <prabu@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99781E01530
	for <meta-ti@yoctoproject.org>; Thu,  2 May 2013 06:40:39 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42DecAX019884
	for <meta-ti@yoctoproject.org>; Thu, 2 May 2013 08:40:38 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42DeWoQ028448
	for <meta-ti@yoctoproject.org>; Thu, 2 May 2013 08:40:36 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 21:40:32 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r42De1ML016387;
	Thu, 2 May 2013 19:10:33 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 2 May 2013 19:09:21 +0530
Message-ID: <1367501964-6294-7-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1367501964-6294-1-git-send-email-prabu@ti.com>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] libgles-omap3: Skip ldflags check for debug binaries also
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
X-List-Received-Date: Thu, 02 May 2013 13:40:39 -0000
Content-Type: text/plain

The libraries libusc.so, libPVRScopeServices.so, libews.so generate
"No GNU_HASH in the elf binary" error during rootfs packaging due to
prebuilt-binary packaging. This patch skips the check.

Signed-off-by: Prabindh Sundareson <prabu@ti.com>
---
 recipes-graphics/libgles/libgles-omap3.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index c33062a..ae69e69 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -285,6 +285,7 @@ INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags"
 INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
 INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
 INSANE_SKIP_${PN}-tests = "ldflags"
+INSANE_SKIP_${PN}-dev = "ldflags dev-so"
 
 # Quality control is really poor on these SDKs, so hack around the latest madness:
 FILES_${PN} += "${libdir}/*.so "
-- 
1.7.1


