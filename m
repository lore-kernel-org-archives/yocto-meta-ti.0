Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CC57E0153F
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 09:58:19 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4HGwIeo030285
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 11:58:19 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4HGwBW5026687
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 11:58:17 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 18 May 2013 00:58:12 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4HGwAut014936;
	Fri, 17 May 2013 22:28:12 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 May 2013 22:27:56 +0530
Message-ID: <1368809879-27201-7-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <prabu@ti.com>
References: <prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] libgles-omap3: Remove unnecessary inclusion of folders into package
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
X-List-Received-Date: Fri, 17 May 2013 16:58:20 -0000
Content-Type: text/plain

Inclusion of all .so files is not necessary for the
package build.

Signed-off-by: Prabindh Sundareson <prabu@ti.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 8e5dad6..4521d59 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -285,10 +285,6 @@ INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
 INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
 INSANE_SKIP_${PN}-tests = "ldflags"
 
-# Quality control is really poor on these SDKs, so hack around the latest madness:
-FILES_${PN} += "${libdir}/*.so "
-FILES_${PN}-dev = "${includedir}"
-
 inherit update-rc.d
 
 INITSCRIPT_NAME = "pvr-init"
-- 
1.7.1


