Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 138AAE00CAC; Tue, 18 Jul 2017 16:04:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E27FE00CA6
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4iFv007567
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419084;
	bh=up5jb00PLH7xUXR+P18J7KRFOyhvUK9gIpPe7nNjG18=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uYPyWe09KkykV6iin5hp57GkGzi8zSctSx8Z7xGNvgnxVdgGLXCMqSWV3URaO8US/
	sfucT8JT+hNqasBFUCRklIbGXrTPpuL8+H0R7jp7RJnFIXZ+TkbWasYN16bZ+8eCvN
	HvS9C7FuueHleqdkld9RWCnLXs4n1ZjysLARrkSw=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4ixD008758
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:44 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hu000997;	Tue, 18 Jul 2017 18:04:43 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:34 -0400
Message-ID: <1500419028-3361-23-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 23/37] iqn2-lld-rtos: Adding rtos recipe for iqn2-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:53 -0000
Content-Type: text/plain

Upstreaming TI RTOS low level driver for IQN2 peripheral module

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary

 recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb
new file mode 100644
index 0000000..318f1cf
--- /dev/null
+++ b/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb
@@ -0,0 +1,12 @@
+SUMMARY = "TI RTOS low level driver for IQN2 peripheral module"
+
+inherit ti-pdk
+
+require recipes-bsp/iqn2-lld/iqn2-lld.inc
+
+PR = "${INC_PR}.0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "IQN2 LLD"
-- 
1.9.1


