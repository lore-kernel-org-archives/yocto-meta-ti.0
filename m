Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03622E00DD5; Fri, 14 Dec 2018 11:31:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DD3AE00DC2
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 11:31:55 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEJVtsJ035469
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544815915;
	bh=bd0VTtGZMoaM/jku93SqOLNPmE6M9krji425WM7WcW8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HFyIr1PGAoScPoLEYlahQXUlLxKi2H0gK1R9obP5twqWSNze8lb/J46OFMhwLKu/Z
	aoBDH0hzym1pwZBq57K0YKYCwN8lRK2bGmIc8Uj/NFyafycObSQsdaz9bHSJyqldCU
	P+1Tqd60jHccUJMShduwxvYdSIA6cQFmW+O5F4Z4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEJVtKj101405
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:55 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 13:31:55 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 13:31:54 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEJVmdW031115
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:54 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 14 Dec 2018 14:31:41 -0500
Message-ID: <1544815903-10792-33-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 32/34] usb-lld-rtos: SRCREV update to 01.00.00.16B, add dependency to sciclient-rtos for k3
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
X-List-Received-Date: Fri, 14 Dec 2018 19:31:56 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
index 8956763..5f4aa67 100644
--- a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
+++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
@@ -12,19 +12,20 @@ USB_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/usb.git"
 USB_LLD_GIT_PROTOCOL = "git"
 USB_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.15A"
-USB_LLD_SRCREV = "ab94ca08198bc87b008d98a3142f62833fa0b40b"
+# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.16B"
+USB_LLD_SRCREV = "79992405d709e8593ef0e488fed336d8c186a07d"
 
 BRANCH = "${USB_LLD_GIT_BRANCH}"
 SRC_URI = "${USB_LLD_GIT_URI};protocol=${USB_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${USB_LLD_SRCREV}"
-PV = "01.00.00.15A"
+PV = "01.00.00.16B"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos"
 DEPENDS_append_ti33x = " starterware-rtos"
 DEPENDS_append_ti43x = " starterware-rtos"
+DEPENDS_append_k3 = " sciclient-rtos"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
-- 
1.9.1


