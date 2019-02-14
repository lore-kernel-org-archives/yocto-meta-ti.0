Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4143EE00C75; Thu, 14 Feb 2019 08:53:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 236B4E00BBC
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 08:53:28 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1EGrSqT031051
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 10:53:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550163208;
	bh=3ELNgYDA3s7QdcW6+ZtWGcSi2TCM+boFG5mDKml0MNQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=mxsPYbeq6xVNZvNSs3DlezDcV+FQKLUYF+YhcGcewdxUxq7VA779hN5TVxVfVWmPp
	3wOrj2dHfduPWEX6mugL15d1Jx+vKiv8NHQ01yM+TsVbJMxMuJLMqbbp/iGA9qpS7F
	eSTmqJFb/usUedSDfzK5+XrsTB1CW8q1bp9SSp84=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1EGrSiI082960
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 10:53:28 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 14 Feb 2019 10:53:28 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 14 Feb 2019 10:53:27 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1EGrQ3H015579
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 10:53:27 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Feb 2019 11:53:23 -0500
Message-ID: <1550163203-38002-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1550163203-38002-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1550163203-38002-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] uart-lld-rtos: Updating checksum file & dependency for ti33x
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
X-List-Received-Date: Thu, 14 Feb 2019 16:53:30 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
index 0dceecb..be1f8c8 100644
--- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
+++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "TI RTOS low level driver for Universal Asynchronous Receiver/Tran
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://UART.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
+LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=94b6a199da1caf777f6756cb70aca4a7"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -14,19 +14,21 @@ UART_LLD_GIT_PROTOCOL = "git"
 UART_LLD_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to "DEV.UART_LLD.01.00.00.13"
-UART_LLD_SRCREV = "3af02f4c4e4d5fe126d49076d343f41ea3878106"
+UART_LLD_SRCREV = "f9298edb5a39bd72f256b53a0b63c6c019cdedce"
 
 BRANCH = "${UART_LLD_GIT_BRANCH}"
 SRC_URI = "${UART_LLD_GIT_URI};protocol=${UART_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${UART_LLD_SRCREV}"
 PV = "01.00.00.13"
-PR = "r0"
+PR = "r1"
 
 DEPENDS_append = " edma3-lld-rtos \
                    osal-rtos \
 "
-DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti33x = " starterware-rtos \
+                         pruss-lld-rtos \
+"
 DEPENDS_append_ti43x = " starterware-rtos"
 
 DEPENDS_remove_k3 = "edma3-lld-rtos "
@@ -43,3 +45,5 @@ XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "UART LLD"
+
+INSANE_SKIP_${PN} = "arch"
-- 
1.9.1


