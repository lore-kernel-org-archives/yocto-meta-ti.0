Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF7D3E0097D; Mon, 27 Apr 2015 08:42:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93409E00960
	for <meta-ti@yoctoproject.org>; Mon, 27 Apr 2015 08:42:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4664852A9A; Mon, 27 Apr 2015 15:42:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150427154213.4664852A9A@arago-project.org>
Date: Mon, 27 Apr 2015 15:42:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-cgt6x: update LICENSE to the proper format
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
X-List-Received-Date: Mon, 27 Apr 2015 15:42:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 80193adbc4f280dc8111bd88335bfdca9219da9f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=80193adbc4f280dc8111bd88335bfdca9219da9f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Apr 24 23:55:57 2015 +0000

ti-cgt6x: update LICENSE to the proper format

This avoids warnings in master.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/devtools/ti-cgt6x_8.0.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
index d297930..69c6d60 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI DSP Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
-LICENSE = "TI TSPA with portions under Thai Open Source Software Center & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & Public Domain & other similar"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
 LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
 LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"


