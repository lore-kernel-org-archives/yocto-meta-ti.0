Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03481E00748; Mon, 30 Nov 2015 09:06:35 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28A3BE005B3
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 09:06:29 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E478B52A6D; Mon, 30 Nov 2015 17:06:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151130170628.E478B52A6D@arago-project.org>
Date: Mon, 30 Nov 2015 17:06:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap5-evm: bump max_leb_cnt once more
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
X-List-Received-Date: Mon, 30 Nov 2015 17:06:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7a5b3add4289870e7b06de09150baf528272a29a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7a5b3add4289870e7b06de09150baf528272a29a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Nov 30 12:05:41 2015 -0500

omap5-evm: bump max_leb_cnt once more

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/omap5-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
index 520bb95..32c1b97 100644
--- a/conf/machine/omap5-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -19,7 +19,7 @@ SERIAL_CONSOLE = "115200 ttyO2"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3900"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4000"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:


