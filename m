Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA286E00B45; Thu, 15 Dec 2016 08:07:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C90D1E00BC1
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 08:07:47 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBFFvd0Z027196
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 09:57:39 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBFFvdEA003954
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 09:57:39 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Dec 2016 09:57:39 -0600
Received: from a0866445-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uBFFvOK5018442;	Thu, 15 Dec 2016 09:57:39 -0600
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Dec 2016 10:54:42 -0500
Message-ID: <1481817282-7017-11-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481817282-7017-1-git-send-email-jsobota@ti.com>
References: <1481817282-7017-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 11/11] common-csl-ip: Upstream version 3.3.0.5A
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
X-List-Received-Date: Thu, 15 Dec 2016 16:07:49 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 76181e8..166eaa4 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx"
 
-PV = "03.03.00.04B"
+PV = "03.03.00.05A"
 INC_PR = "r0"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
@@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "master"
 CSL_GIT_DESTSUFFIX = "git"
 
-# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.04B"
-CSL_SRCREV = "a74dc132a21085214b49c3ae8884825d87b6dd2f"
+# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.05A"
+CSL_SRCREV = "811646f507d985dac04544c60c965cadf5e26a4f"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-- 
2.7.4


