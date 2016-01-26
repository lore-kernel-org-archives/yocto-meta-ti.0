Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25117E00C1C; Tue, 26 Jan 2016 13:17:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A0E3E00C1B
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 13:17:02 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0QLH1Ka005569
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:17:01 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0QLH0Fs004443
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:17:01 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 Jan 2016 15:17:00 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0QLGvUV012813;	Tue, 26 Jan 2016 15:17:00 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Jan 2016 16:16:49 -0500
Message-ID: <1453843011-28530-12-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
References: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 11/13] cppi-lld-rtos: Add RTOS package for CPPI LLD
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
X-List-Received-Date: Tue, 26 Jan 2016 21:17:07 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb

diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
new file mode 100644
index 0000000..5c4e39b
--- /dev/null
+++ b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
@@ -0,0 +1,13 @@
+inherit ti-pdk
+require cppi-lld.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " rm-lld-rtos \
+                   qmss-lld-rtos \
+"
+
+XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2l-evm = "k2l"
+XDCARGS_k2g-evm = "k2g"
-- 
1.9.1


