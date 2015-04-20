Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9FD83E0079F; Mon, 20 Apr 2015 13:20:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53783E0079F
	for <meta-ti@yoctoproject.org>; Mon, 20 Apr 2015 13:20:04 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 833D052A6B; Mon, 20 Apr 2015 20:20:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150420202002.833D052A6B@arago-project.org>
Date: Mon, 20 Apr 2015 20:20:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : am57xx-evm: ubifs: Increase max_leb_cnt.
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
X-List-Received-Date: Mon, 20 Apr 2015 20:20:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 34cc0d20a08596584a4087fa3fc1286fd7037b99
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=34cc0d20a08596584a4087fa3fc1286fd7037b99

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Apr 14 16:53:36 2015 +0000

am57xx-evm: ubifs: Increase max_leb_cnt.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am57xx-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 3010e04..c923174 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -23,7 +23,7 @@ UBOOT_MACHINE = "beagle_x15_config"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4352"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 5120"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:


