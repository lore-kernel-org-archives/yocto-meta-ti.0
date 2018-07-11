Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0BDDE00D3E; Wed, 11 Jul 2018 08:45:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 718BEE00A48
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 08:45:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6BFjZjL026776
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 10:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531323935;
	bh=BR1+TKoZfHGLcYViRvAWthXLJidiz/4sB1Rq438iGzo=;
	h=From:To:Subject:Date;
	b=ht7qWC2zdi33Y5te522YL6KHkp98gRRgcsDVrNjmS0aRr16oJxby2EZu7EG1z5Rc2
	wueUiCe0rvVr8iztpclsyj4ek5riBJMWH/uhfUv7nEo2mZGMJdKU0BsewcTMg8ewF4
	R88w2qtylKwfIVDe662BfWg/BCbQWUjY2g0p3JII=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BFjZDk008111
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 10:45:35 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 11 Jul 2018 10:45:34 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 11 Jul 2018 10:45:35 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BFjYCI031016
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 10:45:34 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 11 Jul 2018 11:45:28 -0400
Message-ID: <1531323931-31875-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 0/3] Enable SGX on k3 (AM654x)
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
X-List-Received-Date: Wed, 11 Jul 2018 15:45:37 -0000
Content-Type: text/plain

Enable SGX on k3 (AM654x)

Eric Ruei (3):
  conf: machine: k3: enable sgx
  ti-sgx-ddk-um: add k3 (AM654x) support
  ti-sgx-ddk-km: add k3 (AM654x) support

 conf/machine/include/k3.inc                        |  4 +-
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  | 92 ++++++----------------
 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |  1 +
 ...14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} | 10 +--
 4 files changed, 33 insertions(+), 74 deletions(-)
 copy recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb => recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb (2%)
 copy recipes-graphics/libgles/{ti-sgx-ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} (93%)

-- 
1.9.1


