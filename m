Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C07CE00CA4; Thu, 27 Sep 2018 08:23:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64BA6E00BE8
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 08:23:29 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RFNTtr109201
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538061809;
	bh=RszDIJzpZ389GtyG4rpJsTQzEUiIz0P7rZTNvnxt3zE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=dMAPPJg1WeUWSBCG9spYsmpF0RCL573p9XaTBZv5DuYnzjMWKfr3UmUzXXxGAPMCi
	TAZAdC85IfHUe3RV2utSplfyMh7fIaMiSxumnpFI8Xb0/y+ZO7GtNjSQxIOZtKH/bN
	5up8YzQr1ymgswu2WvS6B/bIKpCF233aEUZGt1GU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNS2m018739
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:29 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 10:23:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 10:23:28 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNIJW014983
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 11:22:36 -0400
Message-ID: <1538061764-54977-23-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 22/30] sa-lld: sa-lld-rtos: Updated to version 04.00.00.00A, added k3 support and makefile build for k3
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
X-List-Received-Date: Thu, 27 Sep 2018 15:23:55 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sa-lld/sa-lld-rtos_git.bb | 14 +++++++++++++-
 recipes-bsp/sa-lld/sa-lld.inc         |  6 +++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
index ac46dcc..abd75bf 100644
--- a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
@@ -6,9 +6,21 @@ require recipes-bsp/sa-lld/sa-lld.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE_append = "|c667x-evm"
+COMPATIBLE_MACHINE_append = "|c667x-evm|k3"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE_k3 = "0"
+
+# SA promote/demote library depends on osal
+DEPENDS_append_k3 = " osal-rtos \
+"
+export PDK_SA_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+INSANE_SKIP_${PN} = "arch"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "SA LLD"
+
diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index c2be902..4c5812e 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -8,14 +8,14 @@ SA_LLD_GIT_PROTOCOL = "git"
 SA_LLD_GIT_BRANCH = "master"
 SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
 
-# Below commit ID corresponding to "DEV.SA_LLD.03.00.00.21"
-SA_LLD_SRCREV = "7ad90025beacbafefd4a41bbe22525d8b55f7635"
+# Below commit ID corresponding to "DEV.SA_LLD.04.00.00.00A"
+SA_LLD_SRCREV = "87da7160925db0d3e52b8d7a53853777549a9a93"
 
 BRANCH = "${SA_LLD_GIT_BRANCH}"
 SRC_URI = "${SA_LLD_GIT_URI};destsuffix=${SA_LLD_GIT_DESTSUFFIX};protocol=${SA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${SA_LLD_SRCREV}"
 
-PV = "03.00.00.21"
+PV = "04.00.00.00A"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


