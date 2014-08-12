Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71FCAE00786; Mon, 11 Aug 2014 19:03:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05345E00786
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 19:03:45 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BF28052981; Tue, 12 Aug 2014 02:03:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140812020344.BF28052981@arago-project.org>
Date: Tue, 12 Aug 2014 02:03:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Alexandre Belloni : beaglebone: use the am335x_boneblack u-boot configuration
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
X-List-Received-Date: Tue, 12 Aug 2014 02:03:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 7eeebc0f79d9097e771855d4cfefdb6989be3d05
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7eeebc0f79d9097e771855d4cfefdb6989be3d05

Author: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date:   Mon Aug  4 21:45:50 2014 +0000

beaglebone: use the am335x_boneblack u-boot configuration

Using the am335x_boneblack configuration for u-boot allows to save the
environment to the emmc. Else, it is not possible to save the
environment at all.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/beaglebone.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 8a83a1a..0b4dce3 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -11,4 +11,4 @@ IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-UBOOT_MACHINE = "am335x_evm_config"
+UBOOT_MACHINE = "am335x_boneblack"


