Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3388E0045D
	for <meta-ti@yoctoproject.org>; Wed, 24 Oct 2012 18:01:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C7FDD52AB7; Thu, 25 Oct 2012 01:01:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121025010141.C7FDD52AB7@arago-project.org>
Date: Thu, 25 Oct 2012 01:01:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Enrico Butera : libdrm: enable omap experimental api support
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
X-List-Received-Date: Thu, 25 Oct 2012 01:01:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cce5a7aea905d2e2b167ab51b132ec43ed519a12
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cce5a7aea905d2e2b167ab51b132ec43ed519a12

Author: Enrico Butera <ebutera@users.berlios.de>
Date:   Fri Oct 19 15:51:24 2012 +0200

libdrm: enable omap experimental api support

This is needed to build gst-plugin-ducati.

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Signed-off-by: Hervé Fache <h-fache@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/drm/libdrm_2.4.39.bbappend |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
new file mode 100644
index 0000000..d0c1a77
--- /dev/null
+++ b/recipes-graphics/drm/libdrm_2.4.39.bbappend
@@ -0,0 +1,3 @@
+COMPATIBLE_MACHINE = "omap4|omap5"
+
+EXTRA_OECONF += "--enable-omap-experimental-api"


