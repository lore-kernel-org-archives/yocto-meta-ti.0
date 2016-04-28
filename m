Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 823C2E00E0A; Thu, 28 Apr 2016 12:00:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 317AEE00E00
	for <meta-ti@yoctoproject.org>; Thu, 28 Apr 2016 12:00:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DA2E252A57; Thu, 28 Apr 2016 19:00:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160428190038.DA2E252A57@arago-project.org>
Date: Thu, 28 Apr 2016 19:00:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am335x-evm: handle omap vs. 8250 uart gracefully b/ w EVM and IDK
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
X-List-Received-Date: Thu, 28 Apr 2016 19:00:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 497d0b774e2ce74c93f6784006f62ba3f3fc46e0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=497d0b774e2ce74c93f6784006f62ba3f3fc46e0

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 28 02:02:15 2016 +0000

am335x-evm: handle omap vs. 8250 uart gracefully b/w EVM and IDK

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index ac643b4..f932f4c 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -12,7 +12,7 @@ MACHINE_FEATURES += "touchscreen"
 IMAGE_FSTYPES += "ubi tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0 115200;ttyS3 115200;ttyO3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 # UBI information.  Note that this is board and kernel specific.  Changes


