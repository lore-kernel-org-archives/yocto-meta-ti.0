Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61D1EE00BD0; Thu, 22 Jun 2017 15:09:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5152E00BD6
	for <meta-ti@yoctoproject.org>; Thu, 22 Jun 2017 15:09:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5MM9bXn029671
	for <meta-ti@yoctoproject.org>; Thu, 22 Jun 2017 17:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498169377;
	bh=WS9bSy7dQXJ3fS3R12ISSfDlpXhxGjAiV0SRIaM99jw=;
	h=From:To:CC:Subject:Date;
	b=yyB3q0Lkpt21T+Am9YIcPqKBiFfS2KSPPLFlR6dvMNmrkviv6DJQySojrYqyEOfX8
	Z0g/8AjSVACmPA+x2ztLdB48+QRO8VfPFcRpMgb4VpuWf4dKfZg7DZ4UKhxHCPIbja
	S3C09abtFThdeWpeRgr2iJKZC0RkwS8H5thNL+RU=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5MM9WWm020425
	for <meta-ti@yoctoproject.org>; Thu, 22 Jun 2017 17:09:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 17:09:31 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5MM9VdW020398;	Thu, 22 Jun 2017 17:09:31 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Jun 2017 18:09:22 -0400
Message-ID: <1498169365-10248-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Add uio based pruss test for am3/am4
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
X-List-Received-Date: Thu, 22 Jun 2017 22:09:53 -0000
Content-Type: text/plain

The major changes include:
1) Add am3/am4 support in uio-module-drv-test
2) Add am3/am4 support in uio-test-pruss
3) Add pru-uio device tree files for am3/am4

Hongmei Gou (3):
  uio-module-drv*: version bump to 2.2.0 and add test support for
    am3/am4
  uio-test-pruss: version bump to 1.0.1.0 and add support for am3/am4
  linux-ti-staging: include pru-uio device tree files for am3/am4

 .../uio-module-drv/uio-module-drv-test_git.bb      |  14 +-
 recipes-bsp/uio-module-drv/uio-module-drv.inc      |  12 +-
 .../linux/files/ti33x/am335x-pru-uio.dtsi          | 192 ++++++++++++++
 .../linux/files/ti43x/am437x-pru-uio.dtsi          | 292 +++++++++++++++++++++
 recipes-kernel/linux/ti-uio.inc                    |  28 ++
 recipes-ti/uio-test-pruss/uio-test-pruss_git.bb    |  19 +-
 6 files changed, 545 insertions(+), 12 deletions(-)
 create mode 100644 recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
 create mode 100644 recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi

-- 
1.9.1


