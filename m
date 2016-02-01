Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7E2CE00AAB; Mon,  1 Feb 2016 14:09:07 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35A0BE00444
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 14:09:03 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3167D52A78; Mon,  1 Feb 2016 22:09:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160201220903.3167D52A78@arago-project.org>
Date: Mon,  1 Feb 2016 22:09:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : conf: machine: am57xx-evm, dra7xx-evm: Increase max_leb_cnt
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
X-List-Received-Date: Mon, 01 Feb 2016 22:09:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 960368396dd3ab25291571ad336d276be29d73cf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=960368396dd3ab25291571ad336d276be29d73cf

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri Jan 29 23:06:50 2016 +0000

conf: machine: am57xx-evm, dra7xx-evm: Increase max_leb_cnt

* With the addition of the video analytics demo, the filesystem has
  exceeded size limited by the previous max_leb_cnt.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am57xx-evm.conf |    2 +-
 conf/machine/dra7xx-evm.conf |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 8d5d5cc..e32b98f 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -23,7 +23,7 @@ UBOOT_MACHINE = "am57xx_evm_config"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 6400"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 9bfcb5c..986b8e2 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -23,7 +23,7 @@ UBOOT_MACHINE = "dra7xx_evm_config"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 6400"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:


