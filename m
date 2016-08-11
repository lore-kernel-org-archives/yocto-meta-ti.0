Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E7A7E00DBC; Wed, 10 Aug 2016 19:33:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5763EE00DBC
	for <meta-ti@yoctoproject.org>; Wed, 10 Aug 2016 19:33:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 67EC752AB8; Thu, 11 Aug 2016 02:33:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160811023324.67EC752AB8@arago-project.org>
Date: Thu, 11 Aug 2016 02:33:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am57xx/dra7xx: disable UBI images by default
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
X-List-Received-Date: Thu, 11 Aug 2016 02:33:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 2e0e6b5cb9ecb480ac6a443d82cb800b675308c5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2e0e6b5cb9ecb480ac6a443d82cb800b675308c5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug  9 07:03:46 2016 +0000

am57xx/dra7xx: disable UBI images by default

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am57xx-evm.conf |    2 +-
 conf/machine/dra7xx-evm.conf |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 7dbc088..16ce76a 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz"
+IMAGE_FSTYPES += "tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyO2"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 6c69683..a03a7fe 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz"
+IMAGE_FSTYPES += "tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"


