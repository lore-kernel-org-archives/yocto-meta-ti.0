Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46D7EE014F2
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2013 13:55:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C067A52A57; Fri, 26 Apr 2013 20:55:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130426205515.C067A52A57@arago-project.org>
Date: Fri, 26 Apr 2013 20:55:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update to ti2013.04.00 release
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
X-List-Received-Date: Fri, 26 Apr 2013 20:55:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 03fbb4900039867612b2f10438bbcf547ada0518
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=03fbb4900039867612b2f10438bbcf547ada0518

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Apr 26 16:05:28 2013 -0400

u-boot-ti-staging: update to ti2013.04.00 release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
index 685dcd0..5fbd0c9 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH
 
 BRANCH ?= "ti-u-boot-2013.01.01"
 
+# This commit corresponds to ti2013.04.00 release tag
 SRCREV = "7552b4c906b0a50fbc5225dc43ed0192618e9d5d"
 
 SPL_BINARY = "MLO"


