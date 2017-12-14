Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D8F1E00D75; Thu, 14 Dec 2017 09:06:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 930A4E00D41
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 09:06:01 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEH60X2014250
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 11:06:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513271160;
	bh=6eE60Oib1DHvmxqdynh4uGMuaWqz9cLu4VURQubQE6I=;
	h=From:To:Subject:Date;
	b=D1kzdrm2Ds7FF9QgGojxlyy5d1mJCtCvVkVahQXD/3Z8K53/6lLhf4KSf5uy4ujBu
	c20IIJJUUjmaYhxGwrufyGmsYa/J6Rzojqn8gTBqsqrteai+PZwctXepYZe2rGgpiU
	J2b9cIg34igbnM8v57DKkcBikXDFhMqEHYrdPKYc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEH60ZN031580
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 11:06:00 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 11:06:00 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 11:06:00 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEH60MY002202
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 11:06:00 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Dec 2017 12:05:59 -0500
Message-ID: <1513271159-31531-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH ] spi-lld-rtos: Updating to version 1.0.0.9
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
X-List-Received-Date: Thu, 14 Dec 2017 17:06:02 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
index 4ed7248..8ad3b6a 100644
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
+++ b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
@@ -12,14 +12,14 @@ SPI_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/spi-lld.git"
 SPI_LLD_GIT_PROTOCOL = "git"
 SPI_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.07A"
-SPI_LLD_SRCREV = "d37daaf3a922e893fe845d44324393994321d443"
+# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.09"
+SPI_LLD_SRCREV = "85ae103a18df777512a8485a4ed7f84189ee0ff6"
 
 BRANCH = "${SPI_LLD_GIT_BRANCH}"
 SRC_URI = "${SPI_LLD_GIT_URI};protocol=${SPI_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${SPI_LLD_SRCREV}"
-PV = "01.00.00.07A"
+PV = "01.00.00.09"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
-- 
1.9.1


