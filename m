Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21156E01239; Fri, 13 Jul 2018 12:10:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14D97E00D33
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 12:10:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DJANul026932
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531509023;
	bh=mIFrG9KbMtHlmVRekPkhB5ActOPdehgz7ynUWVyFrtA=;
	h=From:To:Subject:Date;
	b=h2lMfCzDafF6tGwTkq6ILtHJ+8Zdg+w584AAhyKaxyhUuLakYF5eQbF+SCAq99+Uz
	Vvhl8Fe0BBOepHk5soE0745V0P967nTIBypyd8qWx6eqoL7/wHgC1ti2ZlU8OVsQXS
	eHxYXOZr8mlD/fkZgchCDKpg3+PhQic/2G/OJzjQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DJANjv014868
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:10:23 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 14:10:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 14:10:22 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DJAJ9p005345
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:10:21 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Jul 2018 15:10:13 -0400
Message-ID: <1531509016-6395-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 0/3] Enable SGX on k3 (AM654x)
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
X-List-Received-Date: Fri, 13 Jul 2018 19:10:26 -0000
Content-Type: text/plain

Enable SGX on k3 (AM654x)

Eric Ruei (3):
  conf: machine: k3: enable sgx
  ti-sgx-ddk-um: add k3 (AM654x) support
  ti-sgx-ddk-km: add k3 (AM654x) support

 conf/machine/include/k3.inc                                 |  4 ++--
 ...ddk-km_1.14.3699939.bb => ti-sgx-ddk-km_1.17.4948957.bb} | 10 ++++------
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb      |  1 +
 ...ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} | 13 +++++--------
 4 files changed, 12 insertions(+), 16 deletions(-)
 copy recipes-bsp/powervr-drivers/{ti-sgx-ddk-km_1.14.3699939.bb => ti-sgx-ddk-km_1.17.4948957.bb} (75%)
 copy recipes-graphics/libgles/{ti-sgx-ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} (87%)

-- 
1.9.1


