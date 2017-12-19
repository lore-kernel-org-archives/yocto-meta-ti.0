Return-Path: <gaurav@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA703E00D7F; Tue, 19 Dec 2017 09:59:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AAD1E00B5F
	for <meta-ti@yoctoproject.org>; Tue, 19 Dec 2017 09:59:25 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBJHxPFl018249
	for <meta-ti@yoctoproject.org>; Tue, 19 Dec 2017 11:59:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513706365;
	bh=6fq0rZEKHnySb3dnF5CxF0dxTudtyyFa5yS5YAmoJxc=;
	h=From:To:CC:Subject:Date;
	b=jCw39AX67vQB75P7ZWZxLzGqt5XGUu9dI5CwRMr1JrrhZJHartFf0fqdWmuaoWg+7
	+S6uMYHUkF+V13bf5FEu/PBtcdun1eM4DcI3GJBzJFKmT/0Fe+l1oS2kWn8Vn8LUvz
	PlsDts8TjUyOudJms6rK0/3Fb0l5yqnfyI1hO8Vo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJHxPXw030287
	for <meta-ti@yoctoproject.org>; Tue, 19 Dec 2017 11:59:25 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 19 Dec 2017 11:59:24 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 19 Dec 2017 11:59:24 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJHxOnr011901;
	Tue, 19 Dec 2017 11:59:24 -0600
From: Gaurav Mitra <gaurav@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Dec 2017 11:58:49 -0600
Message-ID: <20171219175849.75856-1-gaurav@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2] Enable OpenMP RTOS eclipse plugin signature
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
X-List-Received-Date: Tue, 19 Dec 2017 17:59:26 -0000
Content-Type: text/plain

Signed-off-by: Gaurav Mitra <gaurav@ti.com>
---
 recipes-ti/openmp-rtos/openmp-rtos_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index f5bf4765..fd9c0ba5 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -4,7 +4,8 @@ LICENSE = "BSD"
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "2_06_02_00"
+PV = "2_06_02_01"
+ECLIPSE_PLUGIN_VERSION = "2.06.02.01"
 PR = "r0"
 
 OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
@@ -12,10 +13,9 @@ OPENMP_RTOS_GIT_PROTOCOL = "git"
 OPENMP_RTOS_GIT_BRANCH = "master"
 
 BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
-SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH} \
-"
+SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH}"
 
-SRCREV = "a2a518dcc9154a372b38bd5be8a483359123823c"
+SRCREV = "69af0caf19c2713e21b25e77acf103074be129f2"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 
-- 
2.14.1


