Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B078E007FD
	for <meta-ti@yoctoproject.org>; Fri, 13 Dec 2013 23:36:34 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 342B352A5D; Sat, 14 Dec 2013 07:36:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131214073633.342B352A5D@arago-project.org>
Date: Sat, 14 Dec 2013 07:36:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with fixes for audio-display and connectivity
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
X-List-Received-Date: Sat, 14 Dec 2013 07:36:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 97439937456c1477c7b949b3dc9329e3363797e3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=97439937456c1477c7b949b3dc9329e3363797e3

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Dec 14 02:29:13 2013 -0500

linux-ti-staging: update with fixes for audio-display and connectivity

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 129d67a..eaf0df2 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -33,11 +33,11 @@ S = "${WORKDIR}/git"
 BRANCH = "ti-linux-3.12.y"
 
 # Corresponds to ti2013.12.00 release
-SRCREV = "3b9c905e7ddbdf94ddaee40c5b8e9745a72afc6b"
+SRCREV = "9921cde9aa3f323d5a0e9e5207b7ad173652a89d"
 PV = "3.12.4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


