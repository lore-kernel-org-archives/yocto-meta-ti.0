Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8A4C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 13:23:05 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.158134.1680787378855556817
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 06:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YaIvjSSB;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 336DMpnm096229;
	Thu, 6 Apr 2023 08:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680787371;
	bh=PBLalh4hvjRPpyOo5ajL7VspJhD3DhHqtLBC0+HQNWc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YaIvjSSB08D71OkjFR5v1cZ2EZHaBo02ZXXJKz86VdIieTVCYduFcSJgKEgtXQdNX
	 ClJzREp0QMK4s75Y2fwgoHz8vXLgkEyt08h3tfUV8S8R+frYEvLcYOUw+I+LQMBOy5
	 QyEMYQ5zRQVIn3VH/CHzVTs2vsSA6U9jprSMUaR8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 336DMpXO107524
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 08:22:51 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 08:22:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 08:22:51 -0500
Received: from [10.249.32.16] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 336DMojP081286;
	Thu, 6 Apr 2023 08:22:50 -0500
Message-ID: <57970738-0432-7365-f5da-30ec40677c10@ti.com>
Date: Thu, 6 Apr 2023 08:22:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [meta-ti] check-layer failures for meta-ti
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <alexandre.belloni@bootlin.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <202304031348055bba498e@mail.local>
 <20230406000841.GL9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230406000841.GL9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Apr 2023 13:23:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16303



On 4/5/2023 19:08, Denys Dmytriyenko wrote:
> On Mon, Apr 03, 2023 at 03:48:05PM +0200, Alexandre Belloni via lists.yoctoproject.org wrote:
>> Hello,
>>
>> meta-ti is currently failing check-layer-nightly:
>>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1272/steps/19/logs/stdio
>>
>> AssertionError: Adding layer meta-ti-bsp changed signatures.
>> 10 signatures changed, initial differences (first hash before, second after):
>>     optee-client:do_prepare_recipe_sysroot: 3f4e44718ab8f2398d5cc145fcdd481d1813a7afb7d028aa5ff67617fec69885 -> 06b063bf17bd8534f2ffc2506780d02c221cca3273863d3ca2548f2031c3ff92
>>        bitbake-diffsigs --task optee-client do_prepare_recipe_sysroot --signature 3f4e44718ab8f2398d5cc145fcdd481d1813a7afb7d028aa5ff67617fec69885 06b063bf17bd8534f2ffc2506780d02c221cca3273863d3ca2548f2031c3ff92
>>        NOTE: Starting bitbake server...
>>        runtaskdeps changed:
>>        ['cmake/cmake-native_3.22.3.bb:do_populate_sysroot gcc/gcc-cross_11.3.bb:do_populate_sysroot gcc/gcc-runtime_11.3.bb:do_populate_sysroot glibc/glibc_2.35.bb:do_populate_sysroot ninja/ninja_1.10.2.bb:do_populate_sysroot:virtual:native optee/optee-client_3.16.0.bb:do_fetch', +pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native, 'pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot']
>>        Number of task dependencies changed
>>        Dependency on task pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native was added with hash cf8a9ff6ed2d492aeeeeeb3972365104425b5424377cf5e4a4fc76bb53a4f628
> 
> Alexandre,
> 
> Trying to push latest OPTEE updates to meta-arm now, so we can remove local
> bbappends in meta-ti:
> 
> https://lists.yoctoproject.org/g/meta-arm/message/4556
> 
> 
> 
>> There as also this one over the week end:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1268/steps/20/logs/stdio
>>
>>
>> AssertionError: 3 != 0 : Found following patches with malformed or missing upstream status:
>> /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
>> /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
>> /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
> 
> Ryan,
> 
> BTW, Upstream-Status: tag in local patches is now being checked as well, so we
> should go over the above list and at least add "Pending" or "Inappropriate"
> status now. Can you take care of these?
> 

Yes.  I will start taking a look at this and for all patches we carry in 
both meta-ti and meta-arago.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16301): https://lists.yoctoproject.org/g/meta-ti/message/16301
> Mute This Topic: https://lists.yoctoproject.org/mt/98035454/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

