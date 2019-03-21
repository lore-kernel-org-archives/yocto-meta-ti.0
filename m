Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AF69E00DB5; Thu, 21 Mar 2019 06:16:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47E62E00D11
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 06:16:23 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDGNHZ080869
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174183;
	bh=jX6vw499/J8gYwFw23J7WbMBwVlYWvTDasYaSCDN+w0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=x7/OaOHD5sfy1JeWZvn4ggmPnCRhgk01f9L9LpGPM5HSY171wef/8vtJl7ESnVcOX
	TxV/oNBIM+z5reNWVihfMteL9pwWevR3aznymVIPaofAs3l/EtqTFUAs5KYHsuKv0l
	3Mo9W7OrXavKEpBPI3qdOYj4bPYzmpQMZFw+4NyU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDGMbA061864
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:16:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:16:22 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDGHZu025094
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:22 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 09:16:00 -0400
Message-ID: <1553174173-28679-17-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 16/29] sa-lld: SRCREV update to 04.00.00.02, added osal-rtos dependency for rtos
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
X-List-Received-Date: Thu, 21 Mar 2019 13:16:51 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sa-lld/sa-lld-rtos_git.bb | 2 +-
 recipes-bsp/sa-lld/sa-lld.inc         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
index abd75bf..5bcdc2e 100644
--- a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE_append = "|c667x-evm|k3"
 TI_PDK_XDCMAKE_k3 = "0"
 
 # SA promote/demote library depends on osal
-DEPENDS_append_k3 = " osal-rtos \
+DEPENDS_append = " osal-rtos \
 "
 export PDK_SA_ROOT_PATH ="${WORKDIR}/build"
 export DEST_ROOT="${S}"
diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index b77645a..0d8b0f9 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -8,14 +8,14 @@ SA_LLD_GIT_PROTOCOL = "git"
 SA_LLD_GIT_BRANCH = "master"
 SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
 
-# Below commit ID corresponding to "DEV.SA_LLD.04.00.00.01"
-SA_LLD_SRCREV = "50aa35de32e3699d11b0bec9eb92571e6e843571"
+# Below commit ID corresponding to "DEV.SA_LLD.04.00.00.02"
+SA_LLD_SRCREV = "0fa21847bc633c66512352007b4a713073aae968"
 
 BRANCH = "${SA_LLD_GIT_BRANCH}"
 SRC_URI = "${SA_LLD_GIT_URI};destsuffix=${SA_LLD_GIT_DESTSUFFIX};protocol=${SA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${SA_LLD_SRCREV}"
 
-PV = "04.00.00.01"
+PV = "04.00.00.02"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


