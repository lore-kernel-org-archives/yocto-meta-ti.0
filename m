Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B763E00961; Mon,  2 Feb 2015 12:39:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D33BE008E5
	for <meta-ti@yoctoproject.org>; Mon,  2 Feb 2015 12:38:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8D74352A77; Mon,  2 Feb 2015 20:38:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150202203852.8D74352A77@arago-project.org>
Date: Mon,  2 Feb 2015 20:38:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : dra7xx-evm: ubifs: Increase "max_leb_cnt"
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
X-List-Received-Date: Mon, 02 Feb 2015 20:39:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 766d60e931325b8114878a1556d3b4bb1dca61ea
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=766d60e931325b8114878a1556d3b4bb1dca61ea

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Wed Jan 21 23:52:49 2015 +0000

dra7xx-evm: ubifs: Increase "max_leb_cnt"

* This is need to allow some room for customers to build on top
      of the filesystem that we support
    * This is needed for larger filesystem size to support dev image.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/dra7xx-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 175450f..3b88668 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -23,7 +23,7 @@ UBOOT_MACHINE = "dra7xx_evm_config"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4352"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 5120"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:


