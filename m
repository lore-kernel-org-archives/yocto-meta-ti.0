Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35263C83F10
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 06:10:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.10719.1693462248872784554
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 23:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=B6MSMEi3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37V6Ak8Q110365;
	Thu, 31 Aug 2023 01:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693462246;
	bh=6z36iFvNfd8gyNnyE+4v1SMtMHlBlod+E4DDdnHvW5I=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=B6MSMEi3D0jxf6uTC0i7T4omJurXBn8JRn1WqYgdBERUuABpHXQhZKDOlI46/mp5j
	 ymO38cQ+Na5moav9y7iq52vAYvrSnHqjwPBmgO27UOG0ggjeahP4LidvQA/TcXtxuu
	 POug2DDJbcP5jS7RF384+3ypDhCRi36FuMJn7KVI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37V6AkHd010728
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 31 Aug 2023 01:10:46 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Aug 2023 01:10:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Aug 2023 01:10:46 -0500
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37V6AhWA050569;
	Thu, 31 Aug 2023 01:10:44 -0500
Content-Type: multipart/alternative;
	boundary="------------HPTUnGcYi9LYYywPCmnC7qvO"
Message-ID: <453c0e5d-cdd3-8f4b-006f-d20a27fcba88@ti.com>
Date: Thu, 31 Aug 2023 11:40:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCH] conf/am65xx-hs-evm:
 Fix UBOOT_MACHINE to match u-boot config
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230830152709.20767-1-reatmon@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20230830152709.20767-1-reatmon@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 31 Aug 2023 06:10:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16911

--------------HPTUnGcYi9LYYywPCmnC7qvO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Chirag Shilwant<c-shilwant@ti.com>

On 30/08/23 20:57, Ryan Eatmon via lists.yoctoproject.org wrote:
> The uboot config for am65 is moving to a merged build for both GP and
> HS.  Until the yocto configs catch up, we need to keep am65xx-hs-evm
> working.
>
> Signed-off-by: Ryan Eatmon<reatmon@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf | 2 +-
>   meta-ti-bsp/conf/machine/am65xx-hs-evm.conf      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> index 4fb2bf50..337c8413 100644
> --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> @@ -8,4 +8,4 @@ SYSFW_SOC = "am65x_sr2"
>   SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs"
>   
> -UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
> +UBOOT_MACHINE = "am65x_evm_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
> index 0addec90..f8221f31 100644
> --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
> @@ -4,4 +4,4 @@
>   
>   require conf/machine/include/am65xx.inc
>   
> -UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
> +UBOOT_MACHINE = "am65x_evm_a53_defconfig"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16907):https://lists.yoctoproject.org/g/meta-ti/message/16907
> Mute This Topic:https://lists.yoctoproject.org/mt/101054668/7030289
> Group Owner:meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-ti/leave/11470056/7030289/1265141306/xyzzy  [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------HPTUnGcYi9LYYywPCmnC7qvO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Acked-by: Chirag Shilwant <a class="moz-txt-link-rfc2396E" href="mailto:c-shilwant@ti.com">&lt;c-shilwant@ti.com&gt;</a></pre>
    <p></p>
    <div class="moz-cite-prefix">On 30/08/23 20:57, Ryan Eatmon via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230830152709.20767-1-reatmon@ti.com">
      <pre class="moz-quote-pre" wrap="">The uboot config for am65 is moving to a merged build for both GP and
HS.  Until the yocto configs catch up, we need to keep am65xx-hs-evm
working.

Signed-off-by: Ryan Eatmon <a class="moz-txt-link-rfc2396E" href="mailto:reatmon@ti.com">&lt;reatmon@ti.com&gt;</a>
---
 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
index 4fb2bf50..337c8413 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
@@ -8,4 +8,4 @@ SYSFW_SOC = "am65x_sr2"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
-UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
+UBOOT_MACHINE = "am65x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
index 0addec90..f8221f31 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
@@ -4,4 +4,4 @@
 
 require conf/machine/include/am65xx.inc
 
-UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
+UBOOT_MACHINE = "am65x_evm_a53_defconfig"
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#16907): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-ti/message/16907">https://lists.yoctoproject.org/g/meta-ti/message/16907</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/101054668/7030289">https://lists.yoctoproject.org/mt/101054668/7030289</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-ti+owner@lists.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-ti/leave/11470056/7030289/1265141306/xyzzy">https://lists.yoctoproject.org/g/meta-ti/leave/11470056/7030289/1265141306/xyzzy</a> [<a class="moz-txt-link-abbreviated" href="mailto:c-shilwant@ti.com">c-shilwant@ti.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------HPTUnGcYi9LYYywPCmnC7qvO--

