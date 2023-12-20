Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECB8C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 16:12:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.25536.1703088755976103251
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Dec 2023 08:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P8Ov7ZvO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BKGCXOo019199;
	Wed, 20 Dec 2023 10:12:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1703088753;
	bh=w15yfkGtf7JWlHcvuBR67FXW3cdneIQYf0hyAwDO4AI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=P8Ov7ZvOZa2zdnsS9dvP1MGMXL4qs+muHVy8ACKm1fb1ggeed3AMelj0qD2VZX81q
	 RoOe9wTL9i2tRL0IZtvbLwj9Lsf/HCUodIC+CNhP9F99mP/X34BJ9yIMMvhMCsynC5
	 ey/r/XqezT8hyJXQrQ9UoHA7jTYKAhaIc2e9t/Pw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BKGCXHH103089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Dec 2023 10:12:33 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Dec 2023 10:12:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Dec 2023 10:12:33 -0600
Received: from [10.249.40.136] ([10.249.40.136])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BKGCWVU068574;
	Wed, 20 Dec 2023 10:12:33 -0600
Message-ID: <8f8bc543-e32b-44b5-ba09-4e45c0a9dcc1@ti.com>
Date: Wed, 20 Dec 2023 10:12:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][RFC] meta-ti-bsp: Build R5 bootloader
 without multiconfig
Content-Language: en-US
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20231220160737.40535-1-afd@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231220160737.40535-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Dec 2023 16:12:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17352

On 12/20/23 10:07 AM, Andrew Davis wrote:
> The R5 SPL bootloader is the only software we build using the R5 (arm32)
> multiconfig environment. Using multiconfig pulls in a large number of
> build dependencies (see the -native environment in baremetal tmp dir)
> this increases build time and space.
> 
> Using multiconfig for a deploy target also leads to several oddities in
> the bitbake build system forcing use of a non-standard deploy directory
> and careful checks that no recipe built in both configuration deploy
> the same files.
> 
> While I believe we will get more use out of multiconfig for future
> devices, today let's simplify the K3 build infrastructure here by
> building R5 SPL like a normal firmware using a foreign targeting cross
> compiler. This is the technique meta-arm uses to build firmware (see
> scp-firmware and trusted-firmware-m recipes). Add a new tiboot3 firmware
> recipe here.
> 
> With that we can also drop all the related k3r5 multiconfig files and
> definitions. Do that here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-ti-bsp/classes/ti-secdev.bbclass         |  3 -
>   .../conf/machine/am62axx-evm-k3r5.conf        | 11 ----
>   meta-ti-bsp/conf/machine/am62axx-evm.conf     |  5 ++
>   .../conf/machine/am62pxx-evm-k3r5.conf        | 12 ----
>   meta-ti-bsp/conf/machine/am62pxx-evm.conf     |  5 ++
>   meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf | 12 ----
>   meta-ti-bsp/conf/machine/am62xx-evm.conf      |  5 ++
>   .../conf/machine/am62xx-lp-evm-k3r5.conf      | 11 ----
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  5 ++
>   .../conf/machine/am62xxsip-evm-k3r5.conf      | 16 -----
>   meta-ti-bsp/conf/machine/am62xxsip-evm.conf   | 10 +++
>   meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf | 11 ----
>   meta-ti-bsp/conf/machine/am64xx-evm.conf      |  5 ++
>   meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf | 11 ----
>   meta-ti-bsp/conf/machine/am65xx-evm.conf      |  5 ++
>   .../conf/machine/am65xx-hs-evm-k3r5.conf      | 11 ----
>   meta-ti-bsp/conf/machine/am65xx-hs-evm.conf   |  5 ++
>   .../conf/machine/beaglebone-ai64-k3r5.conf    | 17 -----
>   meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  5 ++
>   meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 14 ----
>   meta-ti-bsp/conf/machine/beagleplay.conf      |  5 ++
>   meta-ti-bsp/conf/machine/include/k3.inc       |  4 +-
>   meta-ti-bsp/conf/machine/include/k3r5.inc     | 27 --------
>   meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf  | 11 ----
>   meta-ti-bsp/conf/machine/j7200-evm.conf       |  5 ++
>   .../conf/machine/j7200-hs-evm-k3r5.conf       | 11 ----
>   meta-ti-bsp/conf/machine/j7200-hs-evm.conf    |  5 ++
>   meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf  | 11 ----
>   meta-ti-bsp/conf/machine/j721e-evm.conf       |  5 ++
>   .../conf/machine/j721e-hs-evm-k3r5.conf       | 11 ----
>   meta-ti-bsp/conf/machine/j721e-hs-evm.conf    |  3 +-
>   meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf | 11 ----
>   meta-ti-bsp/conf/machine/j721s2-evm.conf      |  5 ++
>   .../conf/machine/j721s2-hs-evm-k3r5.conf      | 11 ----
>   meta-ti-bsp/conf/machine/j721s2-hs-evm.conf   |  2 +
>   meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf | 11 ----
>   meta-ti-bsp/conf/machine/j784s4-evm.conf      |  5 ++
>   .../conf/machine/j784s4-hs-evm-k3r5.conf      | 11 ----
>   meta-ti-bsp/conf/machine/j784s4-hs-evm.conf   |  2 +
>   meta-ti-bsp/conf/multiconfig/k3r5.conf        | 10 ---
>   .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  3 -
>   .../u-boot/tiboot3-staging_2023.5.bb          | 65 +++++++++++++++++++
>   .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   |  2 -
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 40 ------------
>   44 files changed, 152 insertions(+), 303 deletions(-)
>   delete mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/include/k3r5.inc
>   delete mode 100644 meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
>   delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5.conf
>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/tiboot3-staging_2023.5.bb

Hopefully the diffstat above speak for itself in how much
this cleans up :) This also should let us now recombine the
deploy directories and several other cleanups in tisdk-bundle
that have continue to cause user confusion.

This is still and RFC as it needs more testing and a few more
cleanups yet but wanted to get the idea out in the open for
alignment before the final rounds of polishing.

Andrew

