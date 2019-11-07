Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D564FE00E05; Thu,  7 Nov 2019 10:09:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B983E00E05
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:55 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9svv039668
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150194;
	bh=W4pj+cu7EQL+cFRUGxGwlHi4aqLT3hgokB2r4LAxMnw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=K3GTWIaJqRi9DUHzXzf8ZdRwTYHCYI1vC3u6Qo3rxp/VSg6kUXzkk4iTIeMNNTuar
	ErkjuPzAyFTRzI+1Xj40JruFuiuqPAMRQxEm9gwwXb8mj7tkxlpMc3HtVYZp2iK2hv
	vXVp1NULJnXpaXDWvINFuwU+U74ND7Y0CYBWr0tQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9sd4071238
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:54 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:39 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIY067418;
	Thu, 7 Nov 2019 12:09:54 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:23 -0500
Message-ID: <1573149037-762-29-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 28/42] rm-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:10:00 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/rm-lld/rm-lld.inc | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld.inc b/recipes-bsp/rm-lld/rm-lld.inc
index 69f950e..0e46d1d 100644
--- a/recipes-bsp/rm-lld/rm-lld.inc
+++ b/recipes-bsp/rm-lld/rm-lld.inc
@@ -2,22 +2,12 @@ DESCRIPTION = "TI Resource Manager Low Level Driver"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
 
-RM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/rm-lld.git"
-RM_LLD_GIT_PROTOCOL = "git"
-RM_LLD_GIT_BRANCH = "master"
-RM_LLD_GIT_DESTSUFFIX = "git/ti/drv/rm"
+inherit ti-pdk-fetch
+PE = "1"
 
-# Below commit ID corresponds to "DEV.RM_LLD.02.02.00.03B"
-RM_LLD_SRCREV = "dbe616355318981999c2f7a70a14377fcda913c8"
-
-BRANCH = "${RM_LLD_GIT_BRANCH}"
-SRC_URI = "${RM_LLD_GIT_URI};destsuffix=${RM_LLD_GIT_DESTSUFFIX};protocol=${RM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${RM_LLD_SRCREV}"
-
-PV = "02.02.00.03B"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "keystone"
 
 BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/rm"
+TI_PDK_COMP = "ti.drv.rm"
-- 
2.7.4


