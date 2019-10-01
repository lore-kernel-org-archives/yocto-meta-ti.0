Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DB78E00C46; Mon, 30 Sep 2019 17:21:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [64.68.198.64 listed in list.dnswl.org]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEDB0E00790
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 17:21:21 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D34F40BF0;
	Tue,  1 Oct 2019 00:21:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lBjM8bHThhDR; Tue,  1 Oct 2019 00:21:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E342440B37;
	Tue,  1 Oct 2019 00:21:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3294A174272;
	Mon, 30 Sep 2019 20:21:18 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 30 Sep 2019 20:21:11 -0400
Message-Id: <1569889271-9597-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] beaglebone-getting-started: update to the latest and fix licenses
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
X-List-Received-Date: Tue, 01 Oct 2019 00:21:22 -0000

From: Khem Raj <raj.khem@gmail.com>

This is as per
https://github.com/jadonk/beaglebone-getting-started/blob/master/LICENSE.txt
* Mention CC-BY-SA-3.0
* Update to GPLv3+ since RNDIS addition
* Remove ambiguous "others" license

Package now contains sample bash scripts for the host
* skip file-rdeps QA check

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/beagleboard/beaglebone-getting-started.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
index 6c61a4e..adde30b 100644
--- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
+++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
-DESCRIPTION = "BeagleBone Getting Started Guide"
+SUMMARY = "BeagleBone Getting Started Guide"
 
-PR = "r21"
+PR = "r22"
 
 inherit allarch
 
-LICENSE = "GPLv2+ & MIT & PD & others"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
+LICENSE = "CC-BY-SA-3.0 & GPLv3+ & MIT & PD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6f02761e31334c48f7021fb94c89aaa"
 
-SRCREV = "6c548a307c948b28a99d48fd17d9790b56182196"
+SRCREV = "05bedba192646152b7bc80b0accaea75aef864e5"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"
@@ -18,3 +18,4 @@ do_install() {
 }
 
 FILES_${PN} += "${datadir}/${PN}"
+INSANE_SKIP_${PN} = "file-rdeps"
-- 
2.7.4


