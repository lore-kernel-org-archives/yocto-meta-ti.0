Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5CD3E00CDD; Thu, 21 Mar 2019 06:16:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39458E00C45
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 06:16:19 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDGI8g105456
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174178;
	bh=myiR+1EDo7EA4XEpFfrxZElZpzQz8hv1rHkSZ85p2VE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RfECLIDKfW6vwqV7NjW6Ye8kkeRygD+HlehrhAT4tXyDUMXLoKUbOZyKElH93P10H
	db7MCxq3m38RdwI3YMlbLJyPgk1GYnKpHpAHtiM8F1bmXMfFY/IhC5fqSqr0UbUnsC
	RinQq2yXvN466oehzfLIHy5fRTcU7jy3/bH+9cqE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDGIu1061787
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:18 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:16:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:16:18 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDGHZf025094
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:18 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 09:15:45 -0400
Message-ID: <1553174173-28679-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 01/29] board-rtos: SRCREV bump to 01.00.10.04, added dependency on osal-rtos for all targets
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
X-List-Received-Date: Thu, 21 Mar 2019 13:16:19 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
index d6b5ddc..75d8cc3 100644
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -12,23 +12,23 @@ BOARD_GIT_URI = "git://git.ti.com/keystone-rtos/board.git"
 BOARD_GIT_PROTOCOL = "git"
 BOARD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.BOARD.01.00.10.03A"
-BOARD_SRCREV = "ad6c58a9026e8ae91d438d07883fc07a7e80186d"
+# Below commit ID corresponds to "DEV.BOARD.01.00.10.04"
+BOARD_SRCREV = "ebad99b91a1b6bee0eac29a3bfd9e81b1d05dfdc"
 
 BRANCH ="${BOARD_GIT_BRANCH}"
 SRC_URI = "${BOARD_GIT_URI};protocol=${BOARD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${BOARD_SRCREV}"
-PV = "01.00.10.03A"
+PV = "01.00.10.04"
 PR = "r0"
 
 DEPENDS_append = " i2c-lld-rtos \
                    spi-lld-rtos \
                    uart-lld-rtos \
+                   osal-rtos \
 "
 
-DEPENDS_append_omap-a15 = " osal-rtos \
-                            ti-ndk \
+DEPENDS_append_omap-a15 = " ti-ndk \
                             mmcsd-lld-rtos \
                             pm-lld-rtos \
 "
@@ -43,7 +43,6 @@ DEPENDS_append_ti33x = " gpio-lld-rtos \
                          gpmc-lld-rtos \
                          icss-emac-lld-rtos \
                          mmcsd-lld-rtos \
-                         osal-rtos \
                          pruss-lld-rtos \
                          starterware-rtos \
                          ti-ndk \
@@ -53,7 +52,6 @@ DEPENDS_append_ti43x = " gpio-lld-rtos \
                          gpmc-lld-rtos \
                          icss-emac-lld-rtos \
                          mmcsd-lld-rtos \
-                         osal-rtos \
                          pruss-lld-rtos \
                          starterware-rtos \
                          ti-ndk \
-- 
1.9.1


