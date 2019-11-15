Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BF34E00E94; Fri, 15 Nov 2019 07:34:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CC73E00E8F
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:18 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYIBg067940
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832058;
	bh=dF8WYp1hPJdZcPZbd4PvM/Go4aIq8yJKELuIxnuklMw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GYFE6+XuTWkGYsiRbjURgZYV+ydArTsvH5hiSlg/8A4iadjeMYm+xHMvHnRBb3H6b
	Hd8EzJMOHoep/4iv27ZM8fPVxD6GH6GQV1+cHziy3R3BFX4t9O5kBdzaMYJ+UO0QGZ
	Kylg5q0/HVRIjmtv/T/2EQNb7WSnBF0sM0KlW5tM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYHZX010554
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:18 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:17 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:17 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfg041975;
	Fri, 15 Nov 2019 09:34:17 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:40 -0500
Message-ID: <1573830902-17409-21-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 20/42] nwal-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:20 -0000
Content-Type: text/plain

LIC_FILES_CHKSUM changed to use a relative path.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/nwal-lld/nwal-lld.inc | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index 024aeef..3a593c7 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -1,25 +1,18 @@
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
 
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-NWAL_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git"
-NWAL_LLD_GIT_PROTOCOL = "git"
-NWAL_LLD_GIT_BRANCH = "master"
+inherit ti-pdk-fetch
 
-# Below commit ID corresponds to "DEV.NWAL.02.01.00.13"
-NWAL_LLD_SRCREV = "dd41b84a985ef2824068e57525158c350e0d51be"
+TI_PDK_COMP = "ti.drv.nwal"
 
-BRANCH = "${NWAL_LLD_GIT_BRANCH}"
-SRC_URI = "${NWAL_LLD_GIT_URI};protocol=${NWAL_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${NWAL_LLD_SRCREV}"
+PE = "1"
 
-PV = "02.01.00.13"
 INC_PR = "r0"
 
 BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/nwal"
 
 DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l  = "k2l"
-- 
2.7.4


