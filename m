Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26204E00343
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 12:45:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EA43152A19; Fri, 23 Aug 2013 19:45:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130823194515.EA43152A19@arago-project.org>
Date: Fri, 23 Aug 2013 19:45:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : boot-monitor: use commit ID instead of tag, update to latest release
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
X-List-Received-Date: Fri, 23 Aug 2013 19:45:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 89a028b124cc0bfd30e92001741f05bf11177abc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=89a028b124cc0bfd30e92001741f05bf11177abc

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Aug 23 11:03:12 2013 -0400

boot-monitor: use commit ID instead of tag, update to latest release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index c8a022a..895de6c 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -14,13 +14,13 @@ COMPATIBLE_MACHINE = "keystone-evm"
 SRC_URI = "git://arago-project.org/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "1.0"
-PR = "r1+gitr${SRCPV}"
+PR = "r2+gitr${SRCREV}"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "DEV.MCSDK-03.00.00.07"
+SRCREV = "94cab20c4a4725a014d6f815704557d28fec9610"
 
 do_compile () {
 	unset LDFLAGS


