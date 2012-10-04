Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94F16E00717
	for <meta-ti@yoctoproject.org>; Wed,  3 Oct 2012 18:22:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D5412529B8; Thu,  4 Oct 2012 01:22:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121004012209.D5412529B8@arago-project.org>
Date: Thu,  4 Oct 2012 01:22:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-hw-bringup-image: remove duplicate timestamp-service , as it's in systemd-image
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
X-List-Received-Date: Thu, 04 Oct 2012 01:22:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 3d7f21491e8a4a9838f0f025802f710f1a9300a1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3d7f21491e8a4a9838f0f025802f710f1a9300a1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Sep 14 00:57:22 2012 -0400

ti-hw-bringup-image: remove duplicate timestamp-service, as it's in systemd-image

Since systemd-image from meta-angstrom already includes timestamp-service, remove
the duplicate from ti-hw-bringup-image recipe, which uses the former as a base.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/images/ti-hw-bringup-image.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
index 9490098..1d00210 100644
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ b/recipes-misc/images/ti-hw-bringup-image.bb
@@ -23,7 +23,6 @@ IMAGE_INSTALL += " \
 	bc \
 	task-ti-test \
 	kernel-modules \
-	timestamp-service \
 	${EXTRA_MACHINE_IMAGE_INSTALL} \
 "
 


