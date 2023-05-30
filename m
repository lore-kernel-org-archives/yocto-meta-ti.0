Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178AAC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 18:03:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1272.1685469831198420815
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 11:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SnTotJbz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UI3j2s092232;
	Tue, 30 May 2023 13:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685469825;
	bh=sB7vyJ7cKvYNsdxP+TJ2b2xW3Ln8zU1IjRKY/+gph9E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SnTotJbzT99ZLlOc7zvHbIJdE9vQxScmE3KFa9ewUO15SWZ91wZKok0VE0QNu5ige
	 XRgiFOvVVSu1FWAWB0oDWPvQDzOEhAqDeBCyq/yE2H63NxDWsGchkH6qZNdtG3KW11
	 wY3ujhPib09374ARYmW7DhSQjv4tqVyvvKG4UWFg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UI3jUm079243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 13:03:45 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 13:03:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 13:03:44 -0500
Received: from [10.250.34.213] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UI3isR032614;
	Tue, 30 May 2023 13:03:44 -0500
Message-ID: <e2e7ae5c-25b0-5b71-5c91-40b6f49124ca@ti.com>
Date: Tue, 30 May 2023 13:03:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: remove
 extra ttyS* definitions
Content-Language: en-US
To: <rs@ti.com>, <p-bhagat@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <detheridge@ti.com>, <bb@ti.com>, <nm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230524200310.131510-1-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230524200310.131510-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 18:03:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16627

On 5/24/23 3:03 PM, rs@ti.com wrote:
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

Sounds like the better solution then is to fix systemd to timeout
on SERIAL_CONSOLES_CHECK. We are not the only board with multiple
possible terminals in OE right now. Making systemd match sysv here
is something worth doing.

Not tested but a bbappends that changes the service reset might do:

--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -32,7 +32,7 @@ Before=rescue.service
  Environment="TERM=@TERM@"
  ExecStart=-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM
  Type=idle
-Restart=always
+Restart=on-success
  UtmpIdentifier=%I
  TTYPath=/dev/%I
  TTYReset=yes

Andrew

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

