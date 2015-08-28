Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBB16E00C6B; Fri, 28 Aug 2015 09:31:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2F37E00C27
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 09:31:11 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DB75C52A62; Fri, 28 Aug 2015 16:31:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150828163110.DB75C52A62@arago-project.org>
Date: Fri, 28 Aug 2015 16:31:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : am437x-evm: bump max_leb_cnt to fit larger image
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
X-List-Received-Date: Fri, 28 Aug 2015 16:31:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 241739c16b9c7d0ac52504ac7735a70de966943d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=241739c16b9c7d0ac52504ac7735a70de966943d

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Fri Aug 28 09:26:49 2015 +0000

am437x-evm: bump max_leb_cnt to fit larger image

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am437x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 04f0571..9ff8944 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -24,7 +24,7 @@ SERIAL_CONSOLE = "115200 ttyO0"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2200"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:


