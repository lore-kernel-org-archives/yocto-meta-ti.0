Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60067E01477
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 11:36:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EA38D52A55; Tue, 26 Mar 2013 18:36:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326183618.EA38D52A55@arago-project.org>
Date: Tue, 26 Mar 2013 18:36:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : omap5-evm: Update serial console to proper value
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
X-List-Received-Date: Tue, 26 Mar 2013 18:36:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: ca64840babba4231384a111c677c606a8f6f25eb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ca64840babba4231384a111c677c606a8f6f25eb

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Fri Mar 22 14:25:48 2013 -0500

omap5-evm: Update serial console to proper value

* The serial console for the OMAP5 uEVM is ttyO2 not ttyO0

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/omap5-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
index 0504bb6..5fe3942 100644
--- a/conf/machine/omap5-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/omap-a15.inc
 
 IMAGE_FSTYPES += "ubi tar.gz"
 
-SERIAL_CONSOLE = "115200 ttyO0"
+SERIAL_CONSOLE = "115200 ttyO2"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more


