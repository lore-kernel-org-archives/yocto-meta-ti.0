Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC18CDB474
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 21:06:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.24212.1697144801780865216
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 14:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tbIF5Mrp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39CL6f5u112919
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 16:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697144801;
	bh=ikrhJaicec1rXQgYrqPqcQW+43HqOohR5qMPvyyF/pU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tbIF5MrpSjhkUMQAaRYek1XM1LkSd/nBck1Y13amQSol2nwiMTS/+9QxH8ZatMMiV
	 PUgOMHfpWQgd2KgtQIep4XJxSrA4Sujd8uKnKfwMmD7wZkyWJy5psMY0hFXImQwSI5
	 9UBj7vlBZFhbB5/VTTDubnU5I4MY5tuhGnkEvmp0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39CL6f4w121487
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 16:06:41 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 16:06:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Oct 2023 16:06:40 -0500
Received: from [10.250.38.120] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39CL6e4f124156;
	Thu, 12 Oct 2023 16:06:40 -0500
Message-ID: <8a2741b3-6fc5-46fc-bed2-c1528c407308@ti.com>
Date: Thu, 12 Oct 2023 16:06:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Remove
 COMPATIBLE_MACHINE and extend recipe to k3 machines
Content-Language: en-US
To: <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <d-gole@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>,
        <vigneshr@ti.com>
References: <20231012172947.1359231-1-a-limaye@ti.com>
 <20231012172947.1359231-2-a-limaye@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231012172947.1359231-2-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 21:06:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17099

On 10/12/23 12:29 PM, Aniket Limaye via lists.yoctoproject.org wrote:
> Revert ebcf15bf0f31208e87ce60a4696e585940b46777 :
>    "recipes-bsp:ti-sci-fw: Add k3r5 as COMPATIBLE_MACHINE"
> 
> Extend recipe to k3 machines too, to provide ti-fs-stub-* firmware
> for u-boot aarch64 build.
> 
> Update do_deploy() to allow multiconfig builds for k3 machines
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>   meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 801c8768..2ad93a5d 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -4,7 +4,6 @@ inherit deploy
>   
>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>   
> -COMPATIBLE_MACHINE = "k3r5"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   CFLAGS[unexport] = "1"
> @@ -26,7 +25,10 @@ do_install() {
>   
>   FILES:${PN} = "${nonarch_base_libdir}/firmware"
>   
> -do_deploy() {
> +do_deploy(){
> +}
> +
> +do_deploy:k3r5() {
>   	install -d ${DEPLOYDIR}/ti-sysfw
>   	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${DEPLOYDIR}/ti-sysfw
>   	install -m 644 ${S}/ti-sysfw/ti-fs-firmware-* ${DEPLOYDIR}/ti-sysfw

Why do we need to deploy these files in ${DEPLOYDIR}/ at all?

Andrew

> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17097): https://lists.yoctoproject.org/g/meta-ti/message/17097
> Mute This Topic: https://lists.yoctoproject.org/mt/101923272/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

