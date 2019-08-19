Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2FB6E00B3E; Mon, 19 Aug 2019 11:42:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94854E00A75
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 11:41:58 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JIfvnt055573
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 13:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566240117;
	bh=KtqR0mktyOIjPSt37bwlDy28p00v9NW7cgy+HpmBVcQ=;
	h=From:To:Subject:Date;
	b=EyXgej968Mb7lWmFyCiskM/54CcO8ZYIbYH4lNiSKdSQ9TqsM/IfmbHVttz2NFAhv
	hKBmpT27DCLx297/Y/6QT2k/IJU5snRN/IpZ2gCyHrXH1cTaiSws/T/1ghx0hBn8G1
	K+epoUceRimoGivYWCLKDbWDIDHgP4ftcfEC0AXE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JIfvs3129515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 13:41:57 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 19 Aug 2019 13:41:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 19 Aug 2019 13:41:57 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JIfvWZ035405
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 13:41:57 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Aug 2019 14:41:54 -0400
Message-ID: <1566240114-57261-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] sciclient-rtos: Adding mcu1_1 to LIMIT_CORES for am65xx targets
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
X-List-Received-Date: Mon, 19 Aug 2019 18:42:04 -0000
Content-Type: text/plain

The default TI_PDK_LIMIT_CORES set in conf/machine/includes/am65xx.inc
doesn't contain mcu1_1 which sciclient supports for am65x. Hence
appending it in the recipe.
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index 941db46..a8dcd56 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -20,7 +20,7 @@ SRC_URI = "${SCICLIENT_GIT_URI};protocol=${SCICLIENT_GIT_PROTOCOL};branch=${BRAN
 
 SRCREV = "${SCICLIENT_SRCREV}"
 PV = "01.00.00.03"
-PR = "r0"
+PR = "r1"
 
 DEPENDS_append = " osal-rtos common-csl-ip-rtos"
 
@@ -33,6 +33,8 @@ SCICLIENT_ROOTPATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv
 export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
 export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages"
 
+# Sciclient for am65x supports mcu1_1 in addition to the default cores in TI_PDK_LIMIT_CORES
+TI_PDK_LIMIT_CORES_append_am65xx = " mcu1_1"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "SCICLIENT"
-- 
1.9.1


