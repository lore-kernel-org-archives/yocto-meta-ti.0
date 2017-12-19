Return-Path: <gaurav@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0DCB4E00CEF; Tue, 19 Dec 2017 11:26:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73855E00B5F
	for <meta-ti@yoctoproject.org>; Tue, 19 Dec 2017 11:26:20 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBJJQKEs023609
	for <meta-ti@yoctoproject.org>; Tue, 19 Dec 2017 13:26:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513711580;
	bh=nCYWCwgt6KD0J1lkFO+EAo4MxgFnkx19N/7qB/rvZB4=;
	h=From:To:CC:Subject:Date;
	b=B/vwrGVXUG9fML/uuFNM9ddsOkvmNFti+TzddxK9DOFcqHd64zvTz95sUaVXXKZ3m
	ODRIE4G3SLw2wJ9WIRRnAH5Pfa2H7tufM5t0howzMOcM6u81cGx3exn1iQ5TIKgCVl
	46jvFgxrb0swrPlMRH64RjzyKm4bp2MgLZRjOJ2Q=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJJQKUK002581
	for <meta-ti@yoctoproject.org>; Tue, 19 Dec 2017 13:26:20 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 19 Dec 2017 13:26:20 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 19 Dec 2017 13:26:20 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJJQKks018232;
	Tue, 19 Dec 2017 13:26:20 -0600
From: Gaurav Mitra <gaurav@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Dec 2017 13:26:09 -0600
Message-ID: <20171219192609.88086-1-gaurav@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3] Enable OpenMP RTOS eclipse plugin signature
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
X-List-Received-Date: Tue, 19 Dec 2017 19:26:22 -0000
Content-Type: text/plain

Signed-off-by: Gaurav Mitra <gaurav@ti.com>
---
 recipes-ti/openmp-rtos/openmp-rtos_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index f5bf4765..5692d89b 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "2_06_02_00"
+PV = "2_06_02_01"
 PR = "r0"
 
 OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
@@ -12,10 +12,9 @@ OPENMP_RTOS_GIT_PROTOCOL = "git"
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


