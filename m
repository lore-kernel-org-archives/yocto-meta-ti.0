Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37068E00C39; Wed,  9 Mar 2016 19:16:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5A4AE00C1B
	for <meta-ti@yoctoproject.org>; Wed,  9 Mar 2016 19:16:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 77191529C2; Thu, 10 Mar 2016 03:16:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160310031646.77191529C2@arago-project.org>
Date: Thu, 10 Mar 2016 03:16:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am335x: use ttyS to check for actual device, while 8250 is disabled
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
X-List-Received-Date: Thu, 10 Mar 2016 03:16:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c56e55b55c2af2d67a08e90bd38e6beaa87261ca
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c56e55b55c2af2d67a08e90bd38e6beaa87261ca

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar 10 02:41:58 2016 +0000

am335x: use ttyS to check for actual device, while 8250 is disabled

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 9013c7c..5b3481f 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -12,7 +12,7 @@ MACHINE_FEATURES += "touchscreen"
 IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyO0 115200;ttyO3"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 # UBI information.  Note that this is board and kernel specific.  Changes


