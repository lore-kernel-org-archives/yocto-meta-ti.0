Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9E3AE00BC2; Fri, 23 May 2014 12:17:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F4D3E0073A
	for <meta-ti@yoctoproject.org>; Fri, 23 May 2014 12:17:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0C3BC52A73; Fri, 23 May 2014 19:17:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140523191749.0C3BC52A73@arago-project.org>
Date: Fri, 23 May 2014 19:17:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: bump to 3.12.20 stable release
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
X-List-Received-Date: Fri, 23 May 2014 19:17:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: def35960f4c9347686aabc49a091d1ee7614dd6b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=def35960f4c9347686aabc49a091d1ee7614dd6b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 22 22:24:48 2014 +0000

linux-ti-staging: bump to 3.12.20 stable release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 154d2fc..ac30ab5 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,11 +36,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "f0d4672333685697320f4907d5b4d3919121c299"
-PV = "3.12.17"
+SRCREV = "ffe21d87399ec09620878613a9ebfbc6c1d7c548"
+PV = "3.12.20"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_FRAGMENTS = "baseport.cfg connectivity.cfg ipc.cfg"


