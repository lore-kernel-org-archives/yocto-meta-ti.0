Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C73E8E00DB6; Mon, 15 Jan 2018 13:56:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 961DFE00D17
	for <meta-ti@yoctoproject.org>; Mon, 15 Jan 2018 13:56:07 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0FLu6XW010756
	for <meta-ti@yoctoproject.org>; Mon, 15 Jan 2018 15:56:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516053366;
	bh=cSJHrrfVfy2C4aviU5AIR+RdSqkC/A63Iui7rahrpEY=;
	h=From:To:Subject:Date;
	b=G09kZh9duGy1xRY7KECbl3MOQa9LPWSLJgQEu4SZzLL8SwQ2L65IO17STX4jXnSHT
	A0c9EMPOiQ413zfAK3YrTuvlFWS4vTS0/bFoGsM85wWV2jtxlvZifrTyXq8ZzOqO9J
	3WjLqMRBbk9aV1WGzQ2iOuD6r5yOuX1sYjRoen+g=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FLu6IN032477
	for <meta-ti@yoctoproject.org>; Mon, 15 Jan 2018 15:56:06 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 15 Jan 2018 15:56:06 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 15 Jan 2018 15:56:06 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FLu6wW032240
	for <meta-ti@yoctoproject.org>; Mon, 15 Jan 2018 15:56:06 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 15 Jan 2018 16:56:04 -0500
Message-ID: <1516053364-28226-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] i2c-lld-rtos: Adding dependency to pruss-lld-rtos for am335x, am437x and am57xx
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
X-List-Received-Date: Mon, 15 Jan 2018 21:56:08 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
index a178c27..674af36 100644
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
@@ -26,8 +26,12 @@ PR = "r0"
 DEPENDS_append = " osal-rtos \
 "
 DEPENDS_append_ti33x = " starterware-rtos \
+                         pruss-lld-rtos \
 "
 DEPENDS_append_ti43x = " starterware-rtos \
+                         pruss-lld-rtos \
+"
+DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
 "
 
 # Build with make instead of XDC
-- 
1.9.1


