Return-Path: <tmannan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23505E009CF; Tue,  4 Sep 2018 12:28:51 -0700 (PDT)
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
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A5ECE008FF
	for <meta-ti@yoctoproject.org>; Tue,  4 Sep 2018 12:28:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w84JSoIs019375
	for <meta-ti@yoctoproject.org>; Tue, 4 Sep 2018 14:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536089330;
	bh=ipLfl1+K7U4N31P7U81VzyMgr+WZdoD5rZbpEjCV788=;
	h=From:To:Subject:Date;
	b=SAn8zmRpRQfwQ+Gk/sTw47Fbdq/GOPEiU2+oR5mJtH+j1LwYp8QavMo3swCDPg4AB
	+PQDQzKVcncAv1LBAZHw8eAFRj5fQTG0d+HAYAvvewBlKVcUPmRngaK2kfigvBZnGw
	alnc1T+MkL4OlzE8Hr3iE4dJUWUVmMp4Jz61I7Ak=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84JSnuO004875
	for <meta-ti@yoctoproject.org>; Tue, 4 Sep 2018 14:28:49 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 4 Sep 2018 14:28:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 4 Sep 2018 14:28:49 -0500
Received: from ares-ubuntu1.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84JSnoJ014327
	for <meta-ti@yoctoproject.org>; Tue, 4 Sep 2018 14:28:49 -0500
From: Tinku Mannan <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 4 Sep 2018 15:28:44 -0400
Message-ID: <1536089325-9189-1-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] Updating to version 01.00.00.13
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
X-List-Received-Date: Tue, 04 Sep 2018 19:28:51 -0000
Content-Type: text/plain

Updating to use COPYING.txt as license checksum file
Also updating md5 checksum for COPYING.txt

Tinku Mannan (1):
  icss-emac-lld: Updating to version 01.00.00.13

 recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.4


