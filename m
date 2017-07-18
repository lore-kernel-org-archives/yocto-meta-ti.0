Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32865E00CA7; Tue, 18 Jul 2017 16:04:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B9D7E00C88
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:41 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4ff8007559
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419081;
	bh=rsx8oBd5y6C1dbByt4xHra0LtFc3+t0y1kkuJW6tsYs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EtwzdLuLX4VJvheUpgvbj0M1Te6vVEMgajB+z1tuaxvZodPLFb335h6QIBrrICdTr
	GvIgB24+aq58VvThsZBr5CSu0hkkO0OSvaEzW1dvBoMFvOk2YD0AcC8oUDARxXB1Fl
	8aQWAy/0qNyTVZr4+RpUrDBwplLm4IcAiOBZk6Pw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4fgn008724
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:40 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hs000997;	Tue, 18 Jul 2017 18:04:40 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:32 -0400
Message-ID: <1500419028-3361-21-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 21/37] aif2-lld-rtos: Added RTOS recipe for aif2-lld
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

Upstreaming RTOS low level driver for Antenna Interface

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary & merged in to a single recipe

 recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb

diff --git a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
new file mode 100644
index 0000000..962965b
--- /dev/null
+++ b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
@@ -0,0 +1,16 @@
+SUMMARY = "TI RTOS low level driver for Antenna Interface"
+
+inherit ti-pdk
+
+require recipes-bsp/aif2-lld/aif2-lld.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " qmss-lld-rtos \
+                   cppi-lld-rtos \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "AIF2 LLD"
-- 
1.9.1


