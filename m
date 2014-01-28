Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14950E003FA
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 17:13:25 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DAAC6529BC; Tue, 28 Jan 2014 01:13:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140128011324.DAAC6529BC@arago-project.org>
Date: Tue, 28 Jan 2014 01:13:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : boot-monitor: keystone-evm: update to latest version
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
X-List-Received-Date: Tue, 28 Jan 2014 01:13:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bb88de3462480930c3b27138fd670a57beb9156e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bb88de3462480930c3b27138fd670a57beb9156e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Jan 27 19:49:56 2014 -0500

boot-monitor: keystone-evm: update to latest version

- Update SRC URL
- Update Revision string
- Update SRCREV commit id

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

-----
Updated Revision numbers
-----
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 895de6c..7c5e9cf 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -11,16 +11,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 
 COMPATIBLE_MACHINE = "keystone-evm"
 
-SRC_URI = "git://arago-project.org/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
-PV = "1.0"
-PR = "r2+gitr${SRCREV}"
+PV = "2.0"
+PR = "r0+gitr${SRCPV}"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "94cab20c4a4725a014d6f815704557d28fec9610"
+#Tag "K2_BM_13.11"
+SRCREV = "ba597d183423971e63295cdd59d3c90245e9170a"
 
 do_compile () {
 	unset LDFLAGS


