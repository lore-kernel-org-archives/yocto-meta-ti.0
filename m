Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1238E00596
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2012 07:19:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 58674529D9; Tue, 28 Feb 2012 15:19:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120228151931.58674529D9@arago-project.org>
Date: Tue, 28 Feb 2012 15:19:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-davinci: quoting fixes
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
X-List-Received-Date: Tue, 28 Feb 2012 15:19:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 263ddd18798eb5ef7dc1e58dcd3e392cfca39135
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=263ddd18798eb5ef7dc1e58dcd3e392cfca39135

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Feb 28 16:16:37 2012 +0100

linux-davinci: quoting fixes

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-davinci_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-davinci_git.bb b/recipes-kernel/linux/linux-davinci_git.bb
index 1fda1ee..e4b85d6 100644
--- a/recipes-kernel/linux/linux-davinci_git.bb
+++ b/recipes-kernel/linux/linux-davinci_git.bb
@@ -22,13 +22,13 @@ ARAGO_L1_BR  = "master"
 ARAGO_L1_PV  = "2.6.32+2.6.33-rc4-${PR}+gitr${SRCREV}"
 ARAGO_L1_URI = "git://arago-project.org/git/projects/linux-omapl1.git;protocol=git;branch=${BRANCH} "
 
-SRCREV_hawkboard                  = ${ARAGO_L1_REV}
+SRCREV_hawkboard                  = "${ARAGO_L1_REV}"
 
-PV_omapl138             = ${ARAGO_L1_PV}
+PV_omapl138             = "${ARAGO_L1_PV}"
 
-BRANCH_omapl138         = ${ARAGO_L1_BR}
+BRANCH_omapl138         = "${ARAGO_L1_BR}"
 
-SRC_URI_append_omapl138 = ${ARAGO_L1_URI}
+SRC_URI_append_omapl138 = "${ARAGO_L1_URI}"
 
 SRC_URI_append_omapl138 = " file://logo_linux_clut224.ppm \
                                      file://0001-ahci-ti-Fix-currently-harmless-typo-in-SATA-PHY.patch \


