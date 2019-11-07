Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8D44E00E1F; Thu,  7 Nov 2019 10:09:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E931E00E05
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:51 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9p3j039649
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150191;
	bh=IM6SCBG9eM1oxONpt1Hcqx1NIh3lFut6/Ts7Qbhg4xI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UxnlSBFXBnXkPI0ufP6rcwM4kyAvv8IjHfRm9/2SuvOkCYL6kzpcxQT9WMvVYTx+P
	c4x5f+O03JFxu27fh3bw8Z31bQkBAeCbIqBXDDy/06umLCSPRw6O0Mw7CJjBkDqH+U
	Ex4WaYFPEwwEHD6IU/1kJP0ADhM/T5KKUOEsmbiw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9p72004172
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:51 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:34 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIM067418;
	Thu, 7 Nov 2019 12:09:50 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:11 -0500
Message-ID: <1573149037-762-17-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 16/42] iqn2-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:55 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/iqn2-lld/iqn2-lld.inc | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
index 29b230a..a203dc4 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -1,21 +1,11 @@
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
 LICENSE = "BSD-3-Clause"
 
-IQN2_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/iqn2-lld.git"
-IQN2_LLD_GIT_PROTOCOL = "git"
-IQN2_LLD_GIT_BRANCH = "master"
-IQN2_LLD_GIT_DESTSUFFIX = "git/ti/drv/iqn2"
+inherit ti-pdk-fetch
+PE = "1"
 
-# Following commit corresponds to DEV.IQN_LLD.01.00.00.11A
-IQN2_LLD_SRCREV = "41c0cd3cb4fc25453904f8c583ebd0a7a0e5b940"
-
-BRANCH = "${IQN2_LLD_GIT_BRANCH}"
-SRC_URI = "${IQN2_LLD_GIT_URI};destsuffix=${IQN2_LLD_GIT_DESTSUFFIX};protocol=${IQN2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${IQN2_LLD_SRCREV}"
-
-PV = "1.0.0.11A"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2l"
 
-S = "${WORKDIR}/${IQN2_LLD_GIT_DESTSUFFIX}"
+TI_PDK_COMP = "ti.drv.iqn2"
-- 
2.7.4


