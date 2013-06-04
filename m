Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 547C6E01483
	for <meta-ti@yoctoproject.org>; Tue,  4 Jun 2013 13:40:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1DD9152A6C; Tue,  4 Jun 2013 20:40:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130604204047.1DD9152A6C@arago-project.org>
Date: Tue,  4 Jun 2013 20:40:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : libdrm: Add support for dra7xx-evm
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
X-List-Received-Date: Tue, 04 Jun 2013 20:40:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: e47e400d07bc1080eac10eb8a98a067b1fc4a8d1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e47e400d07bc1080eac10eb8a98a067b1fc4a8d1

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Jun  3 17:11:46 2013 -0500

libdrm: Add support for dra7xx-evm

* Change the COMPATIBLE_MACHINE setting to use omap-a15 so that
  the dra7xx-evm machine type is also included.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/drm/libdrm_2.4.39.bbappend |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
index d0c1a77..76c7a84 100644
--- a/recipes-graphics/drm/libdrm_2.4.39.bbappend
+++ b/recipes-graphics/drm/libdrm_2.4.39.bbappend
@@ -1,3 +1,3 @@
-COMPATIBLE_MACHINE = "omap4|omap5"
+COMPATIBLE_MACHINE = "omap4|omap-a15"
 
 EXTRA_OECONF += "--enable-omap-experimental-api"


