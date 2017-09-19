Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3186E00C62; Tue, 19 Sep 2017 10:34:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BB38E00C01
	for <meta-ti@yoctoproject.org>; Tue, 19 Sep 2017 10:34:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8JHYmNP020293
	for <meta-ti@yoctoproject.org>; Tue, 19 Sep 2017 12:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505842488;
	bh=nvSkYCW37Pve1zlh0Xa43K+FryLeS2NSIuvW1Ph12D4=;
	h=From:To:CC:Subject:Date;
	b=RrWu0DEZ0shW+AIZvfnHM3Po2KxtWf0AK9Do23Prq4dGrypl5Gnhc47IU9GWWP61u
	nB6HUSAY8VzD8LbhyUiC93FlUjUF8JtJNrZb3GXKIZ0glp196S9bg4UovRPj0jJVF0
	UrrPkGv9fMBomBxYzVQjzv6ZmwCI3dra5zqsxexg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JHYmwl011364
	for <meta-ti@yoctoproject.org>; Tue, 19 Sep 2017 12:34:48 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 19 Sep 2017 12:34:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 19 Sep 2017 12:34:47 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JHYlW1018444;
	Tue, 19 Sep 2017 12:34:47 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Sep 2017 13:34:46 -0400
Message-ID: <1505842486-12219-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] uio-test_pruss: Update to new version 1.0.2.0
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
X-List-Received-Date: Tue, 19 Sep 2017 17:34:49 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/uio-test-pruss/uio-test-pruss_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
index 724ca07..0fae726 100644
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Provides test pruss firmware for uio based tests"
 LICENSE = "BSD-3-Clause"
-PV = "1.0.1.0"
+PV = "1.0.2.0"
 require recipes-ti/includes/ti-paths.inc
 
 S = "${WORKDIR}/git"
@@ -14,12 +14,12 @@ UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git"
 UIO_TEST_PRUSS_GIT_PROTOCOL = "git"
 SRC_URI = "${UIO_TEST_PRUSS_GIT_URI};protocol=${UIO_TEST_PRUSS_GIT_PROTOCOL};branch=${BRANCH}"
 
-# Corresponds to version 01.00.01.00
-UIO_TEST_PRUSS_SRCREV = "72f7454c2460bd7d52dab70631b38bf5d3585542"
+# Corresponds to version 01.00.02.00
+UIO_TEST_PRUSS_SRCREV = "e52a7b099d7203ca52519650df51419e9fef7e0c"
 
 SRCREV = "${UIO_TEST_PRUSS_SRCREV}"
 
-PR = "r2"
+PR = "r0"
 
 COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
 
-- 
1.9.1


