Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27162E014AD
	for <meta-ti@yoctoproject.org>; Wed, 17 Apr 2013 17:21:24 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 03C7552A5E; Thu, 18 Apr 2013 00:21:22 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130418002123.03C7552A5E@arago-project.org>
Date: Thu, 18 Apr 2013 00:21:22 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : u-boot-ti-staging: Add SRCPV to the PR
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
X-List-Received-Date: Thu, 18 Apr 2013 00:21:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 05d5325de7224d62738edc2ade07a6d645366d70
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=05d5325de7224d62738edc2ade07a6d645366d70

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Wed Apr 10 16:51:44 2013 -0500

u-boot-ti-staging: Add SRCPV to the PR

* Add the SRCPV to the PR to make it clear which revision of
  the sources are being built and to match the kernel
  versioning.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
index cf01bd0..4659fe9 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
@@ -2,7 +2,7 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices"
 
-PR = "r2"
+PR = "r3+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 


