Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BFECE0070C
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 11:33:51 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 24BB9529F7; Thu, 17 May 2012 18:33:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120517183351.24BB9529F7@arago-project.org>
Date: Thu, 17 May 2012 18:33:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beagleboard-getting-started: update for revision A6 release
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
X-List-Received-Date: Thu, 17 May 2012 18:33:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a334f160ea27ed8f671b14c9cf9c7620af8d9297
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a334f160ea27ed8f671b14c9cf9c7620af8d9297

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed May 16 08:45:48 2012 +0200

beagleboard-getting-started: update for revision A6 release

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index ede7b3c..603a01a 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r20"
+PR = "r21"
 
 inherit allarch
 
 LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "7d1f070ab2e981a89db302b1b61e85562b949dac"
+SRCREV = "6c548a307c948b28a99d48fd17d9790b56182196"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"


