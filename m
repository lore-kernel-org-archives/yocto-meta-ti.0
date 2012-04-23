Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76ABFE0030B
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2012 12:39:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8BFC8529DA; Mon, 23 Apr 2012 19:39:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120423193912.8BFC8529DA@arago-project.org>
Date: Mon, 23 Apr 2012 19:39:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-getting-started: updated to latest git
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
X-List-Received-Date: Mon, 23 Apr 2012 19:39:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2efdf23c6d1743060ef98109e6fe29f6efef8175
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2efdf23c6d1743060ef98109e6fe29f6efef8175

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Sun Apr 22 14:50:05 2012 +0200

beaglebone-getting-started: updated to latest git

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index 548a9c0..ede7b3c 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r19"
+PR = "r20"
 
 inherit allarch
 
 LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "4750e2bdd29ce037a045149b50ad73906d26999f"
+SRCREV = "7d1f070ab2e981a89db302b1b61e85562b949dac"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"


