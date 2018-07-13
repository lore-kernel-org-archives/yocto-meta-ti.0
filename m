Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FB33E010E1; Fri, 13 Jul 2018 13:54:13 -0700 (PDT)
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
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3198E009CA
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 13:54:12 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DKsCNS071910
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 15:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531515252;
	bh=JE8kR5OKeLUlSDi6suuw2yv/MWTQbO+vZi+cZOQOQrA=;
	h=From:To:Subject:Date;
	b=KxIzXHCiM+NNURsLZnRRHKcEjc9XYICXezWgrjSNUhBpzGENUaA3uT6ms+ui59Mth
	XEYSspk897NLW90VrXmhGwnkug/uJKuFdR/rw3P+mCMB4XqjfkNqH2fNZHHmf0q86t
	4GdNSOEpyY/t5KBoKvaED/uASGvgVB6IQiuGIXoA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DKsCN5005636
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 15:54:12 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 15:54:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 15:54:11 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DKsB5Y025037
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 15:54:11 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Jul 2018 16:54:06 -0400
Message-ID: <1531515249-12170-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v4 0/3] Enable SGX on k3 (AM654x)
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
X-List-Received-Date: Fri, 13 Jul 2018 20:54:13 -0000
Content-Type: text/plain

Enable SGX on k3 (AM654x)

Eric Ruei (3):
  conf: machine: k3: enable sgx
  ti-sgx-ddk-um: add k3 (AM654x) support
  ti-sgx-ddk-km: add k3 (AM654x) support

 conf/machine/include/k3.inc                        |  4 ++--
 ...14.3699939.bb => ti-sgx-ddk-km_1.17.4948957.bb} | 12 +++++-------
 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |  1 +
 ...14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} | 22 +++++-----------------
 4 files changed, 13 insertions(+), 26 deletions(-)
 copy recipes-bsp/powervr-drivers/{ti-sgx-ddk-km_1.14.3699939.bb => ti-sgx-ddk-km_1.17.4948957.bb} (73%)
 copy recipes-graphics/libgles/{ti-sgx-ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} (81%)

-- 
1.9.1


