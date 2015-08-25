Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7964E00C31; Tue, 25 Aug 2015 13:54:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5741FE00BE0
	for <meta-ti@yoctoproject.org>; Tue, 25 Aug 2015 13:54:05 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 255D4529FA; Tue, 25 Aug 2015 20:54:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150825205405.255D4529FA@arago-project.org>
Date: Tue, 25 Aug 2015 20:54:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machines: bump max_leb_cnt to fit larger images
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
X-List-Received-Date: Tue, 25 Aug 2015 20:54:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d8cba916f310305fd116b455c0c04975cf6f5b7b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d8cba916f310305fd116b455c0c04975cf6f5b7b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Aug 26 02:11:29 2015 +0000

machines: bump max_leb_cnt to fit larger images

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |    2 +-
 conf/machine/am437x-evm.conf |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index bbb5d83..571cbec 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -24,7 +24,7 @@ SERIAL_CONSOLE = "115200 ttyO0"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4200"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4400"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 15e5f53..04f0571 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -24,7 +24,7 @@ SERIAL_CONSOLE = "115200 ttyO0"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 1918"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:


