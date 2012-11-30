Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9B4DE00655
	for <meta-ti@yoctoproject.org>; Fri, 30 Nov 2012 08:35:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8081352ABF; Fri, 30 Nov 2012 16:35:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121130163519.8081352ABF@arago-project.org>
Date: Fri, 30 Nov 2012 16:35:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : keystone-evm: update serial port and virtual terminal settings
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
X-List-Received-Date: Fri, 30 Nov 2012 16:35:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: c2f1b57a6c58eb96d2824b7733681a720a48a969
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c2f1b57a6c58eb96d2824b7733681a720a48a969

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Nov 30 11:31:07 2012 -0500

keystone-evm: update serial port and virtual terminal settings

Keystone uses the old ttyS0 serial name instead of the new ttyO0.
Also disable spawning gettys on virtual terminals.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/keystone-evm.conf |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index 5e264a8..e73d84b 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -16,7 +16,9 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
 
 IMAGE_FSTYPES += "tar.bz2 cpio"
 
-SERIAL_CONSOLE = "115200 ttyO0"
+SERIAL_CONSOLE = "115200 ttyS0"
+
+SYSVINIT_ENABLED_GETTYS = ""
 
 UBOOT_MACHINE = "tci6638_evm_config"
 


