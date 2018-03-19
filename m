Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05FD9E00B1E; Mon, 19 Mar 2018 07:40:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6746AE008E4
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 07:40:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEeto4027129
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 09:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521470455;
	bh=vqX0rWMqA96+oWX01Kr8g+Lo/YdBvK2LjxWT2Blb3VE=;
	h=From:To:Subject:Date;
	b=uYDjzJ3hVvwKOnvadD4LVD2trK0y8ghsMxgGnxGs9YNj4Wc7mwkyDp48vLOwOQBm5
	hsirmfESRJO/4mp8SA2YrgUW14g6su5hNbZHJ+d093/ug7xZEs0GQbkyWZuVjsOyM6
	nuDXW62zv0CEE29IQ0dxCZ0yboZ8rvzWwjjg7mT4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEetXS019631
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 09:40:55 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:40:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:40:54 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEesPw022993
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 09:40:54 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Mar 2018 10:40:53 -0400
Message-ID: <1521470453-15700-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] spi-lld-rtos: Update to version 01.00.00.10A
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
X-List-Received-Date: Mon, 19 Mar 2018 14:40:56 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
index 8ad3b6a..04d007b 100644
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
+++ b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
@@ -12,14 +12,14 @@ SPI_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/spi-lld.git"
 SPI_LLD_GIT_PROTOCOL = "git"
 SPI_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.09"
-SPI_LLD_SRCREV = "85ae103a18df777512a8485a4ed7f84189ee0ff6"
+# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.10A"
+SPI_LLD_SRCREV = "3a62b6d24ba3c70c27442820196a76f98ab6e458"
 
 BRANCH = "${SPI_LLD_GIT_BRANCH}"
 SRC_URI = "${SPI_LLD_GIT_URI};protocol=${SPI_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${SPI_LLD_SRCREV}"
-PV = "01.00.00.09"
+PV = "01.00.00.10A"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
-- 
1.9.1


