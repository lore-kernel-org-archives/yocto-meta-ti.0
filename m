Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9971BE00D00; Thu, 28 Feb 2019 06:41:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 530A5E00D00
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 06:41:41 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1SEfemC075615
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 08:41:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551364900;
	bh=/DQHP0bS5AjNr2B/2IT4bi7SG/6buTmc4oQAcTW0k3A=;
	h=From:To:Subject:Date;
	b=BRtZl+rsdMJAGO1r8MkH9r2R9TrEMAjtkpieOy2/THIpMLMIVqFXuGSuGdcFnbtu2
	Ann1t5omlpDlZZq8RiWQ3i7v3bUEe83Laj9azDy5FnY7BMfq77eTcDMXiyiPV7/AsZ
	Qj2s3+eeVb+iOxWFgMDAaYrXEA96clmEa05OEhC4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1SEfeMk029967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 08:41:40 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 28 Feb 2019 08:41:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 28 Feb 2019 08:41:40 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1SEfec0012290
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 08:41:40 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Feb 2019 09:41:30 -0500
Message-ID: <1551364892-9908-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master/thud][PATCH 0/2] SGX DDK updates
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
X-List-Received-Date: Thu, 28 Feb 2019 14:41:42 -0000
Content-Type: text/plain

Eric Ruei (2):
  ti-sgx-ddk-um: bump SRCREV to pickup the latest fixes and enhancements
  ti-sgx-ddk-km: bump SRCREV to pickup the latest changes

 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 2 +-
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.1


