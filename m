Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D8D5E0073F
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 14:03:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D014E52A8F; Mon, 11 Jun 2012 21:03:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120611210315.D014E52A8F@arago-project.org>
Date: Mon, 11 Jun 2012 21:03:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-tester: bump SRCREV to fix failure reporting
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
X-List-Received-Date: Mon, 11 Jun 2012 21:03:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 897596f437af47cb376ddcfb39518f6cb37a7684
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=897596f437af47cb376ddcfb39518f6cb37a7684

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Jun  8 11:37:44 2012 +0200

beaglebone-tester: bump SRCREV to fix failure reporting

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 6bb598a..b5e3081 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r14"
+PR = "r15"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "1a13257030c497920243062c65068c89840d8b6e"
+SRCREV = "3b19f1caf8c616e3f4a25abacca28b2239d3ec82"
 
 S = "${WORKDIR}/git"
 


