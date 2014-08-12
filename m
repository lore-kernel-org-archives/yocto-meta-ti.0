Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5725DE007D2; Tue, 12 Aug 2014 15:11:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37160E0079A
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 15:11:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4428752A1D; Tue, 12 Aug 2014 22:11:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140812221106.4428752A1D@arago-project.org>
Date: Tue, 12 Aug 2014 22:11:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : beaglebone.conf: use correct UBOOT_MACHINE
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
X-List-Received-Date: Tue, 12 Aug 2014 22:11:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 9e7c32cb67f7911e78d1ac2f4246e7a308f2df81
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9e7c32cb67f7911e78d1ac2f4246e7a308f2df81

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug 12 21:13:51 2014 +0000

beaglebone.conf: use correct UBOOT_MACHINE

Previous patch introduced a typo, the correct name is am335x_boneblack_config.

Thanks to Diego Sueiro <diego.sueiro@gmail.com> for spotting it.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/beaglebone.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 0b4dce3..8a7e52a 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -11,4 +11,4 @@ IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-UBOOT_MACHINE = "am335x_boneblack"
+UBOOT_MACHINE = "am335x_boneblack_config"


