Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBB1AE01423
	for <meta-ti@yoctoproject.org>; Tue, 29 May 2012 13:51:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 89A2252A9D; Tue, 29 May 2012 20:51:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120529205125.89A2252A9D@arago-project.org>
Date: Tue, 29 May 2012 20:51:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : ti-hw-bringup-image: disable sdcard image class
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
X-List-Received-Date: Tue, 29 May 2012 20:51:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e4a354f6b06ceed3ddcce73b2fe9bfa9f43334af
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e4a354f6b06ceed3ddcce73b2fe9bfa9f43334af

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri May 25 09:31:47 2012 +0200

ti-hw-bringup-image: disable sdcard image class

The class breaks with the current genext2fs in oe-core.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/images/ti-hw-bringup-image.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
index 2be8baf..9490098 100644
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ b/recipes-misc/images/ti-hw-bringup-image.bb
@@ -29,4 +29,5 @@ IMAGE_INSTALL += " \
 
 export IMAGE_BASENAME = "TI-hw-bringup"
 
-inherit sdcard_image
+# This doesn't work with the current genext2fs in oe-core
+# inherit sdcard_image


