Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF9F8E00CBA; Tue, 18 Jul 2017 16:05:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58562E00CAC
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:55 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4jnT001294
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419085;
	bh=1Co7wQmqxmpOnFegLymRAd7vqiVcc1iC6K3ZJF8aoCg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gEYbUh2KrsJP6XW+CZy7T435DNNoDH2YOyjKkf86tVz5Cr9DQUqa4Y2Rd7JNV8Hk1
	jAEJDaHgJT07MTI00lRc2c+Lm0Qm7QmfOVXMAHaph8xbVEoz23oFyTishthfi7BJbO
	1t3z7OVYxKCOxBT1mhcwahiAdkpEDjEAAHVGttGE=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4eX8032162
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:39 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hr000997;	Tue, 18 Jul 2017 18:04:39 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:31 -0400
Message-ID: <1500419028-3361-20-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 20/37] sa-lld-rtos: Added rtos recipe for sa-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:05:07 -0000
Content-Type: text/plain

Upstreaming RTOS low level driver for Security Accelerator (SA)

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary

 recipes-bsp/sa-lld/sa-lld-rtos_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-bsp/sa-lld/sa-lld-rtos_git.bb

diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
new file mode 100644
index 0000000..ac46dcc
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
@@ -0,0 +1,14 @@
+SUMMARY = "TI RTOS low level driver for Security Accelerator (SA)"
+
+inherit ti-pdk
+
+require recipes-bsp/sa-lld/sa-lld.inc
+
+PR = "${INC_PR}.0"
+
+COMPATIBLE_MACHINE_append = "|c667x-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "SA LLD"
-- 
1.9.1


