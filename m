Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76AF1E00596
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2012 12:39:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A8CC952090; Mon, 23 Apr 2012 19:39:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120423193912.A8CC952090@arago-project.org>
Date: Mon, 23 Apr 2012 19:39:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : bonescript: update to latest git
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
Commit: a70dab6fe30ae2f784cb6fe46e612ad378a9fe9c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a70dab6fe30ae2f784cb6fe46e612ad378a9fe9c

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Sun Apr 22 14:50:06 2012 +0200

bonescript: update to latest git

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/payload/bonescript.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-misc/payload/bonescript.bb b/recipes-misc/payload/bonescript.bb
index b1e92df..72bcab0 100644
--- a/recipes-misc/payload/bonescript.bb
+++ b/recipes-misc/payload/bonescript.bb
@@ -1,18 +1,18 @@
 DESCRIPTION = "Scripting tools for the BeagleBoard and BeagleBone"
 
-PR = "r14"
+PR = "r15"
 
 inherit systemd
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=659ee0c98db2664403c769d6b9ab50eb"
 
-SRC_URI = "http://dominion.thruhere.net/koen/angstrom/beaglebone/bonescript-ca0f663083cea4e434864aa276d46ff79d471dff.tar.bz2 \
+SRC_URI = "http://dominion.thruhere.net/koen/angstrom/beaglebone/bonescript-6af82b41178c37644399b19039ea7e80c1dbf8ee.tar.bz2 \
            file://bonescript-git \
            file://bone101.service \
           "
-SRC_URI[md5sum] = "2b7edd83a752eaf0be0c7488d32c7e72"
-SRC_URI[sha256sum] = "839ee1147b83924f259dc5e373d73eb0eaa6ece76322dc156a6b04113fa89a91"
+SRC_URI[md5sum] = "e5e214857afbd2e59b52171e60810be2"
+SRC_URI[sha256sum] = "e703416a63406c8b6c89fb1079406833ce6a9eb0ae1ba0a55fe3802b83186c50"
 
 S = "${WORKDIR}/bonescript"
 


