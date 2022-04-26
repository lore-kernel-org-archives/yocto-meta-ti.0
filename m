Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943DCC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:41:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.932.1651009287433561963
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xWcd4P4q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QLfP5w041022;
	Tue, 26 Apr 2022 16:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651009285;
	bh=MtDZj621IU2++UXUJ01jRFmp3TzAWjpkh9ftOSynTv0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=xWcd4P4qjfAydtsxF9i+0Z6JPSsuc5l+W8P4TbJQ4yAJpMMSUUvIMyR1pILDwdvrD
	 sOiLrnfwpcDfT0ZmuCw4dLdzWII3vBUCHMNyL52PI4hdveNRJ1FUTWfbe7NVulX4Jz
	 XTZ7t5Cody2AcP7vFLOPb0ZHK4rFh8d2byoKNhls=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QLfPCX104609
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 16:41:25 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 16:41:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 16:41:25 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QLfPMT059786;
	Tue, 26 Apr 2022 16:41:25 -0500
Message-ID: <ed2a907f-06a9-e9ad-c126-29d92395f7b2@ti.com>
Date: Tue, 26 Apr 2022 16:41:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-ti] [PATCH] wlconf: Use nonarch_base_libdir instead of
 hardcoding /lib
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <20220423155911.1651860-1-raj.khem@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220423155911.1651860-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14619


Patch applied to master.


On 4/23/2022 10:59, Khem Raj wrote:
> Helps with usrmerge builds
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> index 477c5a96..a6f62239 100644
> --- a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> +++ b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> @@ -14,14 +14,14 @@ do_install() {
>   	install -d ${D}${sbindir}
>   	install -d ${D}${sbindir}/wlconf/
>   	install -d ${D}${sbindir}/wlconf/official_inis
> -	install -d ${D}/lib/firmware/ti-connectivity
> +	install -d ${D}${nonarch_base_libdir}/firmware/ti-connectivity
>   
>   	install -m 0755 wlconf ${D}${sbindir}/wlconf/
>   	install -m 0755 dictionary.txt ${D}${sbindir}/wlconf/
>   	install -m 0755 struct.bin ${D}${sbindir}/wlconf/
>   	install -m 0755 default.conf ${D}${sbindir}/wlconf/
>   	install -m 0755 wl18xx-conf-default.bin ${D}${sbindir}/wlconf/
> -	install -m 0755 wl18xx-conf-default.bin ${D}/lib/firmware/ti-connectivity/wl18xx-conf.bin
> +	install -m 0755 wl18xx-conf-default.bin ${D}${nonarch_base_libdir}/firmware/ti-connectivity/wl18xx-conf.bin
>   	install -m 0755 README ${D}${sbindir}/wlconf/
>   	install -m 0755 example.conf ${D}${sbindir}/wlconf/
>   	install -m 0755 example.ini ${D}${sbindir}/wlconf/
> @@ -33,7 +33,7 @@ do_install() {
>   FILES:${PN} += " \
>   	${sbindir}/wlconf \
>   	${sbindir}/wlconf/official_inis \
> -	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
> +	${nonarch_base_libdir}/firmware/ti-connectivity/wl18xx-conf.bin \
>   "
>   
>   FILES:${PN}-dbg += "${sbindir}/wlconf/.debug"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14618): https://lists.yoctoproject.org/g/meta-ti/message/14618
> Mute This Topic: https://lists.yoctoproject.org/mt/90650581/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

