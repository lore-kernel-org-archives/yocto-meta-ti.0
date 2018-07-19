Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 793C6E014AA; Thu, 19 Jul 2018 10:24:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13329E00E27
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOPbJ071071
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021065;
	bh=25wHmpHrYUTuN1lCG5YXItDYCOYjXRUiTiBevUQj64U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=JkdV/8aYlsdp2lIQP0TuLF39P3sMmrM0QUzcNeSqt//vTnvwuJ/5TKI742iahTU0D
	EhOGCqviJZGfGEuMa+VP2kCqu4/cG68r/p+sArfeNlp6wv4ibCN/FYh5JRGZsGrJYZ
	cdJ1tHIUjelll8vubfYk7ZFOxIyEjta0/OxgOcLA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOP7M015366
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:25 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:25 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORV023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:24 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:34 -0400
Message-ID: <1532021058-48916-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 01/45] mmap-lld: Update to version 2.0.0.8A & adding rtos recipe
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:27 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb | 10 ++++++++++
 recipes-bsp/mmap-lld/mmap-lld.inc         |  6 +++---
 2 files changed, 13 insertions(+), 3 deletions(-)
 create mode 100644 recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb

diff --git a/recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb b/recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb
new file mode 100644
index 0000000..faee597
--- /dev/null
+++ b/recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb
@@ -0,0 +1,10 @@
+inherit ti-pdk
+
+require recipes-bsp/mmap-lld/mmap-lld.inc
+
+PR = "${INC_PR}.0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "MMAP LLD"
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index c65ceb3..e6c4cd6 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -9,14 +9,14 @@ MMAP_LLD_GIT_PROTOCOL = "git"
 MMAP_LLD_GIT_BRANCH = "master"
 MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
 
-# Commit correspond to DEV.MMAP.02.00.00.07
-MMAP_LLD_SRCREV = "4426949ddfafdc8ea9408dbf5a642c3e840f4997"
+# Commit correspond to DEV.MMAP.02.00.00.08A
+MMAP_LLD_SRCREV = "bbccde8da6c87f59af3b0494e2d75ba52c69df20"
 
 BRANCH="${MMAP_LLD_GIT_BRANCH}"
 SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${MMAP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${MMAP_LLD_SRCREV}"
 
-PV = "2.0.0.7"
+PV = "2.0.0.8A"
 INC_PR = "r0"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"
-- 
1.9.1


