Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D0ADE00CBD; Tue, 18 Jul 2017 16:04:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E583E00C97
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:43 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4h16020787
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419083;
	bh=JENPprBNoUQAiGxumpo8jGYjgNaXuOpANLibsOU6INU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ERtWC5uFsFp2aLuQ9B6hbz/iV5DpEhEE/txd4/EgcydmM50tyB2n1ZAwawopJYOnH
	dqV/6p7v/NJi6OY5D9sZwC/QNmuN0X4yHp5z7R42mtUsCBWIFQdOreFEA8EYvX5aEc
	iPfIKB+IIEB5ftNaK1Hn8LfmGG4o6QG1iwk71tCc=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4g4X032318
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:42 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46ht000997;	Tue, 18 Jul 2017 18:04:42 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:33 -0400
Message-ID: <1500419028-3361-22-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 22/37] dfe-lld-rtos: Added RTOS recipe for dfe-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:51 -0000
Content-Type: text/plain

Upstreaming TI RTOS low level driver for Digital Radio Front End
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary
 recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb

diff --git a/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb b/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb
new file mode 100644
index 0000000..5caa07a
--- /dev/null
+++ b/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb
@@ -0,0 +1,12 @@
+SUMMARY = "TI RTOS level driver for Digital Radio Front End"
+
+inherit ti-pdk
+
+require recipes-bsp/dfe-lld/dfe-lld.inc
+
+PR = "${INC_PR}.0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "DFE LLD"
-- 
1.9.1


