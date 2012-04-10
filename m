Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D201E00596
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 13:00:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EB9C452A70; Tue, 10 Apr 2012 20:00:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120410200049.EB9C452A70@arago-project.org>
Date: Tue, 10 Apr 2012 20:00:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-tester: bump SRCREV to fix PMIC test
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
X-List-Received-Date: Tue, 10 Apr 2012 20:00:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 69102ec043838f6fcba9dd0df0cc07e74700b268
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=69102ec043838f6fcba9dd0df0cc07e74700b268

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Apr  9 18:06:42 2012 +0200

beaglebone-tester: bump SRCREV to fix PMIC test

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 7a72547..6bb598a 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r13"
+PR = "r14"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "dc89e2d6b2ac0238a7aa5a334d7c86d7b8613837"
+SRCREV = "1a13257030c497920243062c65068c89840d8b6e"
 
 S = "${WORKDIR}/git"
 


