Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91E82E00C05; Tue, 26 Jan 2016 13:17:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44D3BE00C12
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 13:17:01 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0QLH0ZN007818
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:17:00 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0QLH0A0004414
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:17:00 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 Jan 2016 15:16:59 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0QLGvUT012813;	Tue, 26 Jan 2016 15:17:00 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Jan 2016 16:16:47 -0500
Message-ID: <1453843011-28530-10-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
References: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 09/13] qmss-lld-rtos: Add RTOS package for QMSS LLD
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
X-List-Received-Date: Tue, 26 Jan 2016 21:17:05 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb

diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
new file mode 100644
index 0000000..4dbc591
--- /dev/null
+++ b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
@@ -0,0 +1,12 @@
+inherit ti-pdk
+
+require qmss-lld.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " rm-lld-rtos"
+
+XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2l-evm = "k2l"
+XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2g-evm = "k2g"
-- 
1.9.1


