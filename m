Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DE62E00826; Wed,  1 Mar 2017 12:23:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5521FE00826
	for <meta-ti@yoctoproject.org>; Wed,  1 Mar 2017 12:23:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 424EE52A7C; Wed,  1 Mar 2017 20:23:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170301202346.424EE52A7C@arago-project.org>
Date: Wed,  1 Mar 2017 20:23:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-ipc: explicitly depend on virtual/kernel: do_shared_workdir
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
X-List-Received-Date: Wed, 01 Mar 2017 20:23:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty-next
Commit: 2c8294a83bc79a988b91f09e0b5243c761463574
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2c8294a83bc79a988b91f09e0b5243c761463574

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Mar  1 05:55:01 2017 +0000

ti-ipc: explicitly depend on virtual/kernel:do_shared_workdir

ipc code looks for kernel's generated version.h file:
  #include linux_version_include(KERNEL_BUILD_DIR)

which now ends up in the following shared workdir:
  work-shared/<mach>/kernel-build-artifacts/include/generated/uapi/linux/version.h

It appears if kernel is provided by sstate, shared workdir is not
getting populated, so depend on the task explicitly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc_git.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 6ccd2c4..5878b63 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -27,6 +27,8 @@ INITSCRIPT_PARAMS = "defaults 10"
 
 EXTRA_OECONF += "PLATFORM=${PLATFORM} KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} KERNEL_BUILD_DIR=${STAGING_KERNEL_BUILDDIR}"
 
+do_compile[depends] += "virtual/kernel:do_shared_workdir"
+
 do_configure() {
     ( cd ${S}; autoreconf -f -i -s )
     oe_runconf


