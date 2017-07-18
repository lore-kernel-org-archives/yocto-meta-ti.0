Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4FF6E00C6A; Tue, 18 Jul 2017 16:04:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FC6FE00CA2
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4cYn001283
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419078;
	bh=UPFO/WQP6K8unQxGshoKTthdc8P+jRtiYZ4q5RWekzM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AALuJjea6FYF7cZbrsdpSFFN0zLwE5iAuZbXqdlqX1jG7JYj1eGRz4JZZ23Y5nDat
	1H/ilW29ujtHUGThFuRn10PWB9MdE3LDraImCLwhxBu2m/joGE+pRdLmkIp3v4AvNK
	G4FqOhZoeLg3k2m8mkPY1omJK2uhDfChB3RtoTYs=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4XXj008559
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:32 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hm000997;	Tue, 18 Jul 2017 18:04:33 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:26 -0400
Message-ID: <1500419028-3361-15-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 15/37] tsip-lld-rtos: Add rtos recipe for tsip-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:58 -0000
Content-Type: text/plain

Upstreaming RTOS recipe for Telecom Serial Interface Port (TSIP)

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary & merged in to a single recipe

 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb

diff --git a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
new file mode 100644
index 0000000..cae1b47
--- /dev/null
+++ b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "TI RTOS low level driver for Telecom Serial Interface Port (TSIP)"
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://tsip.h;beginline=1;endline=32;md5=dab2257b0b8a3678c26915f6eb49b71e"
+
+COMPATIBLE_MACHINE = "k2e-evm|c667x-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+TSIP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/tsip-lld.git"
+TSIP_LLD_GIT_PROTOCOL = "git"
+TSIP_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.TSIP_LLD.01.00.00.07A"
+TSIP_LLD_SRCREV = "211d2f1a5c3c7ec80349a18e6e6cae6c9e4df921"
+
+BRANCH = "${TSIP_LLD_GIT_BRANCH}"
+SRC_URI = "${TSIP_LLD_GIT_URI};protocol=${TSIP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${TSIP_LLD_SRCREV}"
+PV = "01.00.00.07"
+PR = "r0"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "TSIP LLD"
-- 
1.9.1


