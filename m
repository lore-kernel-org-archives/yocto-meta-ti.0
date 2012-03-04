Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16AE7E00747
	for <meta-ti@yoctoproject.org>; Sat,  3 Mar 2012 21:48:41 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 38236529BA; Sun,  4 Mar 2012 05:48:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120304054840.38236529BA@arago-project.org>
Date: Sun,  4 Mar 2012 05:48:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : ti-hw-bringup-image: change require to include to make meta-angstrom a soft dependency
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
X-List-Received-Date: Sun, 04 Mar 2012 05:48:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 17600a532e574ec9e09a18a9cb6197b73331c3df
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=17600a532e574ec9e09a18a9cb6197b73331c3df

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Sat Mar  3 11:53:07 2012 +0100

ti-hw-bringup-image: change require to include to make meta-angstrom a soft dependency

The image will be non-functional, but parsing completes with only oe-core + meta-ti

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/images/ti-hw-bringup-image.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
index 5f7afce..2be8baf 100644
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ b/recipes-misc/images/ti-hw-bringup-image.bb
@@ -1,6 +1,6 @@
 # Image for assisting in hardware bringup
 
-require recipes-images/angstrom/systemd-image.bb
+include recipes-images/angstrom/systemd-image.bb
 
 EXTRA_MACHINE_IMAGE_INSTALL ?= ""
 


