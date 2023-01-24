Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E88C38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 09:05:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.10849.1674551109465786020
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Jan 2023 01:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GEpKs5Vx;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30O958sd075945
	for <meta-ti@lists.yoctoproject.org>; Tue, 24 Jan 2023 03:05:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674551108;
	bh=ncGve5uTvL1Wh8iClg0y8nrfd/y1VsuBk7AcLSjOhf4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GEpKs5VxkYSMqlz4xpt/iTP3z3AX4c3Uaw3AYUihHUXI43mPwwxHNLUgENXH5POtF
	 /n/19s7r09KWCshOny24jxbz3IOdig8yXdbXL8LfLkpnKlnVi0IJahlx0/huUgBDVV
	 /GNE1JCjhkeZcX075Qz+G/nSnmpDE6TngXpTwBJA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30O958nX119559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 24 Jan 2023 03:05:08 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 24
 Jan 2023 03:05:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 24 Jan 2023 03:05:08 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30O957qB013050;
	Tue, 24 Jan 2023 03:05:08 -0600
Date: Tue, 24 Jan 2023 14:35:07 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [dunfell v4] trusted-firmware-a: upgrade to v2.8+
Message-ID: <20230124090507.ad4equaffriggwp3@ula0497581>
References: <20230123215646.24425-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230123215646.24425-1-jm@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Jan 2023 09:05:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15640

On 15:56-20230123, Mendez, Judith via lists.yoctoproject.org wrote:
> Upgrade arm-trusted-firmare to v2.8-226-g2fcd408bb.
> 
> This upgrade picks up K3 L2 cache, snoop delayed, and EA
> handling updates from upstream master.
> 
> Do not update to tip of master due to PSCI system off
> support breaking AM62x and AM62q platforms.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> 
> v4: Updated PV_append_k3 to PV_K3
> v3: v2 was the wrong patch sent with a typo
> v2: added PV_append_k3 = "+git${SRCPV}" since SRCREV does not point exactly to
> release tag
> 
>  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index a5eb9ff8..caf27328 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,6 +1,6 @@
> -PV_k3 = "2.6"
> +PV_k3 = "2.8+git${SRCPV}"
>  LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> -SRCREV_tfa_k3 = "1309c6c805190bd376c0561597653f3f8ecd0f58"
> +SRCREV_tfa_k3 = "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
>  COMPATIBLE_MACHINE_k3 = "k3"
>  TFA_BUILD_TARGET_k3 = "all"
>  TFA_INSTALL_TARGET_k3 = "bl31"
> -- 
> 2.17.1
> 

Tested-by: Manorit Chawdhry <m-chawdhry@ti.com>

Regards,
Manorit

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15634): https://lists.yoctoproject.org/g/meta-ti/message/15634
> Mute This Topic: https://lists.yoctoproject.org/mt/96485216/6945827
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [m-chawdhry@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


