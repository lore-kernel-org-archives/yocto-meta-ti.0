Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 248DBE013A3
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 06:12:31 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BDD1852A8B; Mon, 27 Feb 2012 14:12:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120227141230.BDD1852A8B@arago-project.org>
Date: Mon, 27 Feb 2012 14:12:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-getting-started: update SRM to rev A5
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
X-List-Received-Date: Mon, 27 Feb 2012 14:12:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f5d2815cb90d80853b53e76b1472db09e09b52d0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f5d2815cb90d80853b53e76b1472db09e09b52d0

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Feb 14 05:17:57 2012 +0100

beaglebone-getting-started: update SRM to rev A5

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index d02c749..548a9c0 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r18"
+PR = "r19"
 
 inherit allarch
 
 LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "9b46d33531f0c740be25bbff5d485bec522f5934"
+SRCREV = "4750e2bdd29ce037a045149b50ad73906d26999f"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"


