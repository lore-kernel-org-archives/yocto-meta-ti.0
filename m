Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75E87E00717; Tue, 10 Feb 2015 12:41:09 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A190E00717
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 12:40:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 727E552A5C; Tue, 10 Feb 2015 20:40:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150210204056.727E552A5C@arago-project.org>
Date: Tue, 10 Feb 2015 20:40:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : keystone: stop backfilling rtc
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
X-List-Received-Date: Tue, 10 Feb 2015 20:41:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6747cadbe244cb68ad4e4dc96b1eb3f1c484bd07
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6747cadbe244cb68ad4e4dc96b1eb3f1c484bd07

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Feb  6 00:10:25 2015 +0000

keystone: stop backfilling rtc

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 9a5c11f..820fe12 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -20,3 +20,4 @@ EXTRA_IMAGEDEPENDS += "u-boot"
 EXTRA_IMAGEDEPENDS += "boot-monitor"
 
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat pci"
+MACHINE_FEATURES_BACKFILL_CONSIDERED = "rtc"


