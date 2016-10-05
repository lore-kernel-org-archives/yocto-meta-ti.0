Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7A2DE00444; Wed,  5 Oct 2016 11:36:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0FD4E0034A
	for <meta-ti@yoctoproject.org>; Wed,  5 Oct 2016 11:36:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D0BE3529BA; Wed,  5 Oct 2016 18:36:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161005183657.D0BE3529BA@arago-project.org>
Date: Wed,  5 Oct 2016 18:36:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc-rtos: Remove M4F target for omap-a15
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
X-List-Received-Date: Wed, 05 Oct 2016 18:36:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 49bb9c096c23b487e199a14d9b487f38c107d2e1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=49bb9c096c23b487e199a14d9b487f38c107d2e1

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Sep 27 01:29:08 2016 +0000

ti-ipc-rtos: Remove M4F target for omap-a15

- M4F target is not needed for omap-a15
- This reduces build time for platform associated with omap-a15

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_git.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index e49a555..53c9a6e 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -35,7 +35,7 @@ SRCREV_ipc-metadata = "394e8b9fda6981f4c485c4a48c0a13a0a3236390"
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
 DEPENDS_append_keystone = " ti-cgt6x-native \
@@ -61,7 +61,6 @@ IPC_TARGETS_omap-a15 = "\
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
-    ti.targets.arm.elf.M4F="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
 
 IPC_TARGETS_keystone = " \


