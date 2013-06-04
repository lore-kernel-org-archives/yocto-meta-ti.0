Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61A2BE006C2
	for <meta-ti@yoctoproject.org>; Tue,  4 Jun 2013 13:40:45 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 78FBB52A6C; Tue,  4 Jun 2013 20:40:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130604204044.78FBB52A6C@arago-project.org>
Date: Tue,  4 Jun 2013 20:40:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : dra7xx-evm: Update serial console
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
X-List-Received-Date: Tue, 04 Jun 2013 20:40:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 64b76e0915b2dfbc989002567bebc5080351ff22
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=64b76e0915b2dfbc989002567bebc5080351ff22

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Tue Jun  4 08:14:03 2013 -0500

dra7xx-evm: Update serial console

* Updated the serial console to use ttyO0 which is what the
  evm uses.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/dra7xx-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 5543891..d968d3b 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/omap-a15.inc
 
 IMAGE_FSTYPES += "ubi tar.gz"
 
-SERIAL_CONSOLE = "115200 ttyO2"
+SERIAL_CONSOLE = "115200 ttyO0"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more


