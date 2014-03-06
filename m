Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E6F6E00A44
	for <meta-ti@yoctoproject.org>; Thu,  6 Mar 2014 11:04:21 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 383DA52A14; Thu,  6 Mar 2014 19:04:21 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140306190421.383DA52A14@arago-project.org>
Date: Thu,  6 Mar 2014 19:04:21 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with musb, QSPI and touchscreen fixes
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
X-List-Received-Date: Thu, 06 Mar 2014 19:04:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 21399867026f5a9efd5f5d812bae3f1e6e1ea290
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=21399867026f5a9efd5f5d812bae3f1e6e1ea290

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar  6 12:57:59 2014 -0500

linux-ti-staging: update with musb, QSPI and touchscreen fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 1b97ab2..1668c28 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,11 +36,12 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "83f0643caa2e8dabd42024bebfa4565eff347be7"
+# Corresponds to tag ti2013.12.01
+SRCREV = "2325bb5680986b6914d8fd0b5d0bdc20081fe8d3"
 PV = "3.12.10"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "j+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "k+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


