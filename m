Return-Path: <radoslav.pesek@microstep-mis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE07ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 08:16:36 +0000 (UTC)
Received: from smtp.microstep-mis.sk (smtp.microstep-mis.sk [62.168.101.10])
 by mx.groups.io with SMTP id smtpd.web09.17582.1663575384114909480
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Sep 2022 01:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: microstep-mis.com, ip: 62.168.101.10,
 mailfrom: radoslav.pesek@microstep-mis.com)
Received: from localhost (localhost [127.0.0.1])
	by smtp.microstep-mis.sk (Postfix) with ESMTP id 9D16559;
	Mon, 19 Sep 2022 10:16:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.microstep-mis.sk
Received: from smtp.microstep-mis.sk ([127.0.0.1])
	by localhost (smtp01.mstep [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IeEQerJYyp5G; Mon, 19 Sep 2022 10:16:18 +0200 (CEST)
Received: from [172.17.5.219] (unknown [172.17.5.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.microstep-mis.sk (Postfix) with ESMTPSA id 40ABA11;
	Mon, 19 Sep 2022 10:16:18 +0200 (CEST)
Message-ID: <a798c27e-bded-39fc-8643-2f4b9463bdff@microstep-mis.com>
Date: Mon, 19 Sep 2022 10:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [meta-ti] devtool modify linux-ti-mainline gives
 defconfig_builder.sh: not found
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
References: <b88b1eb3-8dc5-e1ef-3697-1e7d05e5b850@microstep-mis.com>
 <fda6f93c-257c-88c5-4ec3-d793e78552a6@microstep-mis.com>
 <20220908202459.GM18429@denix.org>
From: Radoslav Pesek <radoslav.pesek@microstep-mis.com>
In-Reply-To: <20220908202459.GM18429@denix.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 19 Sep 2022 08:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15091

Hi, confirming it helped. Thanks a lot!

Rado.


On 8. 9. 2022 22:24, Denys Dmytriyenko wrote:
> Sorry for the delay, finally had a chance to look into this. Could you please
> try this patch:
>
> https://patchwork.yoctoproject.org/project/ti/patch/20220908202054.3800302-1-denis@denix.org/
>
>
> On Fri, Aug 19, 2022 at 04:16:44PM +0200, Radoslav Pesek wrote:
>> Hello,
>>
>> I'm trying to update kernel configuration using devtool modify
>> linux-ti-mainline, but when I do devtool menuconfig
>> linux-ti-mainline or devtool build linux-ti-mainline (or anything
>> that involves configure step, I guess), I get:
>>
>> /home/radoslavp/oe_bbb/build_bbb/tmp-glibc/work/beaglebone-oe-linux-gnueabi/linux-ti-mainline/5.15+git999-r22b/temp/run.do_configure.23628:
>> 118: /home/radoslavp/oe_bbb/build_bbb/tmp-glibc/work/beaglebone-oe-linux-gnueabi/linux-ti-mainline/5.15+git999-r22b/ti-upstream-tools/config/defconfig_builder.sh:
>> not found
>>
>> Building kernel works flawlessly running bitbake linux-ti-mainline.
>>
>> The configure step seems to delete original source tree under /home/radoslavp/oe_bbb/build_bbb/tmp-glibc/work/beaglebone-oe-linux-gnueabi/linux-ti-mainline/
>> where ti-upstream-tools normally resides and replaces it with
>> 5.15+git999-r22b, where it is missing - for some reason it's not
>> unpacked there or under workspace/sources where the source tree is
>> moved after devtool modify. Not sure if this is expected (I'm
>> beginner regarding yocto).
>>
>> I'm on dunfell, last commit. I made my own distro, maybe I'm missing
>> something somewhere.
>>
>> Thanks for any hint, google didn't help,
>>
>> Rado.
>>
>>

