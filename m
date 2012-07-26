Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68B99E01304
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 18:32:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8A2E652A69; Thu, 26 Jul 2012 01:32:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120726013210.8A2E652A69@arago-project.org>
Date: Thu, 26 Jul 2012 01:32:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-tester: bump SRCREV to fix serial console race
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
X-List-Received-Date: Thu, 26 Jul 2012 01:32:12 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bbc293f9e1304bc4f563bb0e6366f0bac09c6b5b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bbc293f9e1304bc4f563bb0e6366f0bac09c6b5b

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Jun  8 16:37:46 2012 +0200

beaglebone-tester: bump SRCREV to fix serial console race

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index b5e3081..9995556 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r15"
+PR = "r16"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "3b19f1caf8c616e3f4a25abacca28b2239d3ec82"
+SRCREV = "4f6335aedf520917a0bc0c83e9c1ac1135b8a2af"
 
 S = "${WORKDIR}/git"
 


