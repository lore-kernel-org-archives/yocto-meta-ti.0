Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF95BE00CAA; Tue, 18 Jul 2017 16:05:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D0D0E00CCD
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:51 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4fPd001287
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419081;
	bh=PxzYBr3FkdQ7f9/ccmoJDDCPUyatRfOjJO4isAvxAlQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cU4nkiOJEkgoqVDWmmJgg4gH/8lrlSROj9AxadCraNiFQn5B+tdp6jgDJNS/cOb1H
	LI/lauNQxpFg/0xU2RZr77eBeLnTmpro7+AHC0f+HILI2Jx2mWBegzW0uJ7MiZfeW0
	+J65YVRAzPi2EHXiBLsCkGxuhVMLICaG5RE0pEtY=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4aVP008646
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:35 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46ho000997;	Tue, 18 Jul 2017 18:04:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:28 -0400
Message-ID: <1500419028-3361-17-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 17/37] hyplnk-lld-rtos: Add rtos recipe for hyplnk-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:05:03 -0000
Content-Type: text/plain

Upstreaming RTOS recipe for Hyperlink low level driver

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary

 recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
new file mode 100644
index 0000000..3be848b
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
@@ -0,0 +1,12 @@
+SUMMARY = "TI RTOS low level driver for Hyperlink peripheral"
+
+inherit ti-pdk
+
+require recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+
+PR = "${INC_PR}.0"
+
+COMPATIBLE_MACHINE_append = "|c66x"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "HYPLNK LLD"
-- 
1.9.1


