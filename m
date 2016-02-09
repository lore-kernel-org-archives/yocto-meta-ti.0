Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A56EE00D98; Tue,  9 Feb 2016 12:48:02 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD847E00CB9
	for <meta-ti@yoctoproject.org>; Tue,  9 Feb 2016 12:47:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 83CC352A4B; Tue,  9 Feb 2016 20:47:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160209204754.83CC352A4B@arago-project.org>
Date: Tue,  9 Feb 2016 20:47:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ompa5-evm.conf: bump max_leb_cnt
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
X-List-Received-Date: Tue, 09 Feb 2016 20:48:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c27b74eadb853f1b155533c686224ea66bc6fb3a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c27b74eadb853f1b155533c686224ea66bc6fb3a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb  9 21:27:08 2016 +0000

ompa5-evm.conf: bump max_leb_cnt

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/omap5-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
index 32c1b97..3c834cb 100644
--- a/conf/machine/omap5-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -19,7 +19,7 @@ SERIAL_CONSOLE = "115200 ttyO2"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4000"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4200"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:


