Return-Path: <denys@ti.com>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3874E01438
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 23:14:19 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAB00JZ1TBCOCU0@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 14 Sep 2012 01:14:01 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 99E522004C; Fri,
	14 Sep 2012 02:14:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 14 Sep 2012 02:13:59 -0400
Message-id: <1347603239-10221-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH 1/2] ti-hw-bringup-image: remove duplicate timestamp-service, as it's in systemd-image
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
X-List-Received-Date: Fri, 14 Sep 2012 06:14:19 -0000

Since systemd-image from meta-angstrom already includes timestamp-service, remove
the duplicate from ti-hw-bringup-image recipe, which uses the former as a base.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-misc/images/ti-hw-bringup-image.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
index e8dd5ed..62b4c73 100644
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ b/recipes-misc/images/ti-hw-bringup-image.bb
@@ -23,7 +23,6 @@ IMAGE_INSTALL += " \
 	bc \
 	packagegroup-ti-test \
 	kernel-modules \
-	timestamp-service \
 	${EXTRA_MACHINE_IMAGE_INSTALL} \
 "
 
-- 
1.7.8.6


