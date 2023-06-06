Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6506FC7EE43
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 19:35:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6383.1686080102701383697
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 12:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CMqIifXI;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356JZ2ln060055
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Jun 2023 14:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686080102;
	bh=i7T7rWLGxkNwc/vjgtTbNllZk6PklLJvYxeCkXw7WAg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=CMqIifXIzfVHWzgaWc5A7ywOFbFxjTTrhya71yfJWXpp7pXOEPX/jHTuQv/w8Fl07
	 n8Ir1YYQ+EeuMiaOEY7YtuJTjmgT1eDKfxtTYZt58KB4viBc0MLJB8CPQsF9zti3b+
	 FLOM3t0LgGGTdWxnlYbomVyvVPAgrsp5iFgkGXmA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356JZ1xl093122
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Jun 2023 14:35:01 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 14:35:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 14:35:01 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356JZ17j027366
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Jun 2023 14:35:01 -0500
Message-ID: <cf5b65e3-556e-3584-1d3d-4e9bb802a828@ti.com>
Date: Tue, 6 Jun 2023 14:35:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCH] conf: machine: k3:
 remove the ttyS0 definition
Content-Language: en-US, en-US-large
To: <meta-ti@lists.yoctoproject.org>
References: <176628DCAC334758.11917@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <176628DCAC334758.11917@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 19:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16678

On 6/6/23 14:33, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Adding serial consoles to this variable makes systemd attempt to start a
> Getty instance on them. Getty has no retry limit and no retry timout.
> I'm sure you can guess where this is going.
> 
> This fixes the endless start / stop Getty on ttyS0/ttyS3 messages that
> will flood the log until it's full.
> 
> In the case of Jailhouse demos, the getty systemd service should be
> invoked upon demo start and stopped upon end of the demo. It should not
> be listed as a system serial interface since it will not be present
> during normal device operation.
> 
> Before anyone asks, SERIAL_CONSOLES_CHECK only works on the sysVinit
> script so it's not worth discussing as a solution here.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/am62xx.inc | 3 ---
>   meta-ti-bsp/conf/machine/include/k3.inc     | 2 +-
>   2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> index c98da5f5..1274d3b5 100644
> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> @@ -25,6 +25,3 @@ TFA_BOARD = "lite"
>   TFA_K3_SYSTEM_SUSPEND = "1"
>   
>   OPTEEMACHINE = "k3-am62x"
> -
> -# Normally AM62 boards use ttyS2, but our Jailhouse inmate may use ttyS3, so try both
> -SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index c6b55239..97c6da94 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -55,5 +55,5 @@ WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.
>   do_image_wic[depends] += "virtual/bootloader:do_deploy"
>   do_image_complete[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
>   
> -SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
> +SERIAL_CONSOLES = "115200;ttyS2"
>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16677): https://lists.yoctoproject.org/g/meta-ti/message/16677
> Mute This Topic: https://lists.yoctoproject.org/mt/99370731/7094281
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [rs@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


Ugh, ignore this patch. I was on the wrong branch apparently.

