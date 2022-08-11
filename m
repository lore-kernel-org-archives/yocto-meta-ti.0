Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893FCC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 16:25:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.8642.1660235133257455245
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 09:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fJLwMK3Y;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27BGPWBO066890
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 11:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660235132;
	bh=BuK6iDW0GYCnG9irOQBUPTvFU9H+wpWpwiRPCRUyX/c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fJLwMK3YBZ8GQ+MA7RUI1T7+5MxoLl30+4BOetXoV98nW0rz2/J3edWum3PPv/pKx
	 DaIwZw8tV5h8h+W3D0Hd8O4Dh7m9qW7oniumStNJ9wx+GRoUzZoQiNBIomca8YWs7o
	 pW6xIO8adTBEst0ePKFqN1Z5AeSS20wmZdPXUqO0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27BGPWrh081101
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 11:25:32 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 11
 Aug 2022 11:25:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 11 Aug 2022 11:25:31 -0500
Received: from [10.247.29.70] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27BGPVR6077753;
	Thu, 11 Aug 2022 11:25:31 -0500
Message-ID: <878caebd-9e3c-643d-03c0-e539b5dd358c@ti.com>
Date: Thu, 11 Aug 2022 11:25:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [meta-ti] [dunfell/master PATCHv2] trusted-firmware-a: upgrade to
 v2.7
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon
	<reatmon@ti.com>
CC: Judith Mendez <jm@ti.com>
References: <170A5585DD96E678.26714@lists.yoctoproject.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <170A5585DD96E678.26714@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 16:25:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14951



On 8/11/2022 10:57 AM, praneeth via lists.yoctoproject.org wrote:
> upgrade arm-trusted-firmare to v2.7
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Tested-by: Judith Mendez <jm@ti.com>

Sanity tested boot on AM64 HS and AM62 GP

> ---
> 
> *Changes from v1: removed linux-fw recipe update, that was a mistake.
> 
>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 9645137e..4dd13952 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,6 +1,6 @@
>   PV_k3 = "2.6"
>   LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> -SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
> +SRCREV_tfa_k3 = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
>   COMPATIBLE_MACHINE_k3 = "k3"
>   TFA_BUILD_TARGET_k3 = "all"
>   TFA_INSTALL_TARGET_k3 = "bl31"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14950): https://lists.yoctoproject.org/g/meta-ti/message/14950
> Mute This Topic: https://lists.yoctoproject.org/mt/92961522/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

