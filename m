Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A91FCE00CAA; Tue, 18 Jul 2017 16:05:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C257E00C65
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4sdn027099
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419094;
	bh=jFHlay9567uiArA22PmipuzBxQv2oviu9gQv7wFItSQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iwj+U44aZ+mV8oehhagoVp8PQxBT/TvRrrwDMqvdfCKDIVkfy9bYwyFHXkPYbtFsW
	FU9Is3RFFZ2gbGgOHtDoIpE6ERBRdJcGJP9bVVLsTFVFvOLaWWOBgnsCLYB16MW9kx
	D+1PfKGAxf2zUTHMQKZoZsO6KMiQ7ewQaklJxVgo=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4sTi032534
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:53 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46i5000997;	Tue, 18 Jul 2017 18:04:54 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:43 -0400
Message-ID: <1500419028-3361-32-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 32/37] emac-lld-rtos: Added emac-lld-rtos recipe
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
X-List-Received-Date: Tue, 18 Jul 2017 23:05:06 -0000
Content-Type: text/plain

Upstreaming RTOS low level driver for Ethernet MAC
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary and merged in to a single recipe

 recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bb

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
new file mode 100644
index 0000000..0ad74cb
--- /dev/null
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
@@ -0,0 +1,31 @@
+SUMMARY = "TI RTOS low level driver for Ethernet MAC (EMAC) peripheral"
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://emacver.h;beginline=1;endline=47;md5=f66bb3695972ca2a85d990a390f45d88"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
+EMAC_LLD_GIT_PROTOCOL = "git"
+EMAC_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.06A"
+EMAC_LLD_SRCREV = "30ed663809ab178098f8207e9d49913d1446ee6c"
+
+BRANCH ="${EMAC_LLD_GIT_BRANCH}"
+SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${EMAC_LLD_SRCREV}"
+PV = "01.00.03.06A"
+PR = "r0"
+
+DEPENDS_append = " board-rtos osal-rtos"
+DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti43x = " starterware-rtos"
+DEPENDS_append_k2g  = " cppi-lld-rtos qmss-lld-rtos"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "EMAC LLD"
-- 
1.9.1


