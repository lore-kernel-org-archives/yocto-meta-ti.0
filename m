Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C32F2E00348
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 09:30:23 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id AA2DB52A68; Wed, 28 Nov 2012 17:30:21 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121128173021.AA2DB52A68@arago-project.org>
Date: Wed, 28 Nov 2012 17:30:21 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Nicolas Dechesne : Revert "libdrm: enable omap experimental api support"
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
X-List-Received-Date: Wed, 28 Nov 2012 17:30:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8b6f2e0f967b54b6cf4138d105e392ef1c1dd76b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8b6f2e0f967b54b6cf4138d105e392ef1c1dd76b

Author: Nicolas Dechesne <n-dechesne@ti.com>
Date:   Thu Nov 22 15:35:57 2012 +0100

Revert "libdrm: enable omap experimental api support"

This reverts commit cce5a7aea905d2e2b167ab51b132ec43ed519a12.

Because oe-core (then poky master) was upgraded to libdrm 2.40,
and because OMAP experimental support was enabled there too.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/drm/libdrm_2.4.39.bbappend |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
deleted file mode 100644
index d0c1a77..0000000
--- a/recipes-graphics/drm/libdrm_2.4.39.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-COMPATIBLE_MACHINE = "omap4|omap5"
-
-EXTRA_OECONF += "--enable-omap-experimental-api"


