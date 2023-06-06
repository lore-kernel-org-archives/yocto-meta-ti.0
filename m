Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D27C7EE37
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 21:21:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1028.1686086511813436597
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 14:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CTgll+Ki;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356LLnOL110988;
	Tue, 6 Jun 2023 16:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686086509;
	bh=nBCjrUQXO7+2gBTSir+QQ+TjFy2KcVUN2eTjuo2QrQw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CTgll+KiQ6lUBJv4Ypy70HyqauCa1LB4ehikO3jIHG+L1L+MQtBLCir3xp/uVDziB
	 EQBvW1TryB22QVVoFUtRDG1AzJ3mv4Omm4byyd7XeE/A8EQNFJD/p+3vYF5MrMvn+V
	 uDCk9p0dCpJOMEZQS4iQa712ykVlG+GZey6OzGHU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356LLneV098438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 16:21:49 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 16:21:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 16:21:48 -0500
Received: from [10.250.37.94] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356LLmJN075668;
	Tue, 6 Jun 2023 16:21:48 -0500
Message-ID: <215e6086-67bc-388e-f8d4-34657553ec56@ti.com>
Date: Tue, 6 Jun 2023 16:21:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: remove the
 ttyS0 definition
Content-Language: en-US
To: <rs@ti.com>, <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230606193353.910110-1-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230606193353.910110-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 21:21:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16682

On 6/6/23 2:33 PM, rs@ti.com wrote:
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

serial-getty-generator does work on Kirkstone, lets just go with that:

diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index 9e49ac69..1f2513c4 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -2,7 +2,7 @@ PR:append = ".arago6"
  
  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
  
-PACKAGECONFIG:append = " networkd resolved"
+PACKAGECONFIG:append = " networkd resolved serial-getty-generator"
  USERADD_PARAM:${PN} += "--system -d / -M --shell /bin/nologin systemd-network;"
  USERADD_PARAM:${PN} += "--system -d / -M --shell /bin/nologin systemd-resolve;"
  
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

