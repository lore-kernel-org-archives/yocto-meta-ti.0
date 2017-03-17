Return-Path: <fw@javox-solutions.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 616E6E009B9; Fri, 17 Mar 2017 08:48:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM,SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [80.67.31.29 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [80.67.31.29 listed in dnsbl.sorbs.net]
X-Greylist: delayed 552 seconds by postgrey-1.32 at yocto-www;
	Fri, 17 Mar 2017 08:48:46 PDT
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
	[80.67.31.29])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AC07E0097C
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 08:48:46 -0700 (PDT)
Received: from [87.79.86.159] (helo=javoxdev2.fritz.box)
	by smtprelay02.ispgateway.de with esmtpa (Exim 4.84)
	(envelope-from <fw@javox-solutions.com>)
	id 1cotyW-00067l-VT; Fri, 17 Mar 2017 16:39:33 +0100
From: Florian Wickert <fw@javox-solutions.com>
To: meta-ti@yoctoproject.org
Date: Fri, 17 Mar 2017 16:38:42 +0100
Message-Id: <1489765123-11940-1-git-send-email-fw@javox-solutions.com>
X-Mailer: git-send-email 2.1.4
X-Df-Sender: ZndAamF2b3gtc29sdXRpb25zLmNvbQ==
Subject: [PATCH] u-boot-ti.inc: added dependency to bc-native
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
X-List-Received-Date: Fri, 17 Mar 2017 15:48:49 -0000

The script in scripts/Makefile.spl uses bc in line 201. Not having the dependency in the recipe can make the compile task fail.

Signed-off-by: Florian Wickert <fw@javox-solutions.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 57f7fe6..0d6a4b8 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -27,7 +27,7 @@ SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH
 PV_append = "+git${SRCPV}"
 
 # u-boot needs devtree compiler to parse dts files
-DEPENDS += "dtc-native"
+DEPENDS += "dtc-native bc-native"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
2.1.4


