Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66F31E00A80; Fri,  7 Aug 2015 15:01:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EED50E00A94
	for <meta-ti@yoctoproject.org>; Fri,  7 Aug 2015 15:01:17 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C220252A21; Fri,  7 Aug 2015 22:01:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150807220117.C220252A21@arago-project.org>
Date: Fri,  7 Aug 2015 22:01:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am335x-evm: bump max_leb_cnt to fit larger FS
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
X-List-Received-Date: Fri, 07 Aug 2015 22:01:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 7ce026fb81abbac7c11e7e85be675d54cc0b119b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7ce026fb81abbac7c11e7e85be675d54cc0b119b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Aug  8 03:59:44 2015 +0000

am335x-evm: bump max_leb_cnt to fit larger FS

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 21e79a2..bbb5d83 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -24,7 +24,7 @@ SERIAL_CONSOLE = "115200 ttyO0"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4200"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:


