Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49026E00CE8; Wed, 13 Dec 2017 07:05:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10FD7E00AF2
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 07:05:11 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDF5Bgm030113
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 09:05:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513177511;
	bh=o4W33LPwg4RvYDcmGAT2xoHVmTykMkzXC0dBwSGh0ok=;
	h=From:To:Subject:Date;
	b=v7p955Z91bBYQ0l3/czydgNEWqUm65DqaxExMTz23v2mZ7+8G8neyTD8ahk89bCkL
	DoF8YFeNEfl85iKz5qkZpS0Fa9ECrS0bMQBv3SIoQ30avcDVyc21JR8fmmpie9hivC
	mXooNPuSF7mwxfTmLTSnJb5IZrJzfiGy7tR83HLk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDF5ASn002825
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 09:05:11 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 09:05:10 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 09:05:10 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDF5Apm025835
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 09:05:10 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 13 Dec 2017 10:05:07 -0500
Message-ID: <1513177507-50723-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] fatfs-rtos: Update to version 1.0.0.8
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
X-List-Received-Date: Wed, 13 Dec 2017 15:05:13 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
index 0b8a6df..2f3b6de 100644
--- a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
+++ b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
@@ -12,14 +12,14 @@ FATFS_GIT_URI = "git://git.ti.com/keystone-rtos/fatfs.git"
 FATFS_GIT_PROTOCOL = "git"
 FATFS_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.FATFS_LLD.01.00.00.06A"
-FATFS_SRCREV = "7cb9e45da11cd3c60fe48c38c9dcdaa6e49a8276"
+# Below commit ID corresponds to "DEV.FATFS_LLD.01.00.00.08"
+FATFS_SRCREV = "374ae86c9b1f3a4ffbbb09c739e6e5d6709afd09"
 
 BRANCH ="${FATFS_GIT_BRANCH}"
 SRC_URI = "${FATFS_GIT_URI};protocol=${FATFS_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${FATFS_SRCREV}"
-PV = "01.00.00.06A"
+PV = "01.00.00.08"
 PR = "r0"
 
 DEPENDS_append = " mmcsd-lld-rtos \
-- 
1.9.1


