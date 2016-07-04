Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E481DE00D0C; Sun,  3 Jul 2016 23:17:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C23F0E00CF0
	for <meta-ti@yoctoproject.org>; Sun,  3 Jul 2016 23:17:44 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0164C529BF; Mon,  4 Jul 2016 06:17:43 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160704061744.0164C529BF@arago-project.org>
Date: Mon,  4 Jul 2016 06:17:43 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machine: bump max_leb_cnt numbers again
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
X-List-Received-Date: Mon, 04 Jul 2016 06:17:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d1c43c5eac5c438f890ecf66259df2ec3871f8dc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d1c43c5eac5c438f890ecf66259df2ec3871f8dc

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jul  4 02:06:58 2016 -0400

machine: bump max_leb_cnt numbers again

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |    2 +-
 conf/machine/am437x-evm.conf |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 0936a9c..ed78e50 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4900"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 5100"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 4a86e00..8af6a77 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2300"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2400"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:


