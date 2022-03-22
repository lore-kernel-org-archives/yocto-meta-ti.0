Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8AEC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:43:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.706.1647981825287140637
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 13:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ogonwu27;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MKhhmv035194;
	Tue, 22 Mar 2022 15:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647981823;
	bh=baMs9cSUt6VJtdhGvFrfJjYXiCumJHlm/IDcf47QJ1o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ogonwu27P1/Ivk7jRTFSLczXrorj8sQ/+tlCvklsbpjSKlc4GTujsBdJ3RG/vcgBq
	 Uq8qK7CoFGyRjk34pI6dgbKm0uMYbEfL8yVgcKQw+JIs64U45yy15yNHMOepniwFhW
	 XaXPJRqGaCmDemXa3lSadP5wlB5rZsoL3xDPu+6E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MKhhtn025855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 15:43:43 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 15:43:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 15:43:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MKhhEL058804;
	Tue, 22 Mar 2022 15:43:43 -0500
Date: Tue, 22 Mar 2022 15:43:43 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell][PATCH 00/11] Adding support for am62xx
Message-ID: <20220322204343.omum3vofk3azeuyq@humorous>
References: <20220322162528.15298-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220322162528.15298-1-reatmon@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 20:43:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14541

On 11:25-20220322, Ryan Eatmon via lists.yoctoproject.org wrote:
> These patches add initial recipe support for am62xx.
> 
> Hari Nagalla (3):
>   ti-rtos: Add support for AM62x M4F
>   ti-rtos: Fix AM62x R5F DM FW paths
>   ti-rtos: Fix AM62x Fix MCU core numbers
> 
> Krunal Bhargav (1):
>   ti-graphics: Add AM62x GPU (AXE1-16M) support v4
> 
> Nikhil Devshatwar (3):
>   recipes-bsp: lpm-demo: Introduce low power mode demo package
>   recipes-bsp: tifs-lpm-stub: Introduce new recipe
>   recipes-bsp: lpm-demo: Fix build errors with clean task
> 
> Nishanth Menon (4):
>   machine: Add am62xx evm configuration
>   recipes-ti: ti-rtos-bin: Add AM62x binaries
>   recipes: Pick up correct image and build DM to boot images
>   HACK: recipes-ti: ti-rtos-metadata: Make am62x point to am64x
> 
>  conf/machine/am62xx-evm-k3r5.conf             |  11 +
>  conf/machine/am62xx-evm.conf                  |  15 +
>  conf/machine/include/am62xx.inc               |  17 +
>  recipes-bsp/lpm-demo/files/GPL-2              | 340 ++++++++++++++++++
>  recipes-bsp/lpm-demo/lpm-demo_1.0.bb          |  30 ++
>  .../ti-img-rogue-driver_1.13.5776728.bb       |  40 ---
>  .../ti-img-rogue-driver_1.15.6133109.bb       |  42 +++
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  18 +
>  .../tifs-lpm-stub/tifs-lpm-stub_git.bb        |  22 ++
>  recipes-bsp/u-boot/u-boot-ti.inc              |   7 +
>  ...bb => ti-img-rogue-umlibs_1.15.6133109.bb} |  17 +-
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    |  37 ++
>  recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb    |   1 +
>  13 files changed, 549 insertions(+), 48 deletions(-)
>  create mode 100644 conf/machine/am62xx-evm-k3r5.conf
>  create mode 100644 conf/machine/am62xx-evm.conf
>  create mode 100644 conf/machine/include/am62xx.inc
>  create mode 100644 recipes-bsp/lpm-demo/files/GPL-2
>  create mode 100644 recipes-bsp/lpm-demo/lpm-demo_1.0.bb
>  delete mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>  create mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
>  create mode 100644 recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
>  rename recipes-graphics/libgles/{ti-img-rogue-umlibs_1.13.5776728.bb => ti-img-rogue-umlibs_1.15.6133109.bb} (77%)


NAK to the series.

a) patches need to be cleaned up - squashed etc.
b) lpm-demo binary should probably belong to meta-arago instead
   of meta-ti. meta-ti should be a bsp layer, not a distro.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

