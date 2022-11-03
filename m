Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8605BC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 16:21:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.567.1667492483743067598
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Nov 2022 09:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=y5BMudKF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A3GLMP7127399;
	Thu, 3 Nov 2022 11:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667492482;
	bh=e4Wm/22rEdgB1KnPK5j1MhUSWAVr11n/ei18kl5xaBY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y5BMudKFavW0W3t3y18SAZ5+HJq1cXRv+NPnjpueogC1LKEzJPqzafCxZ/Ft43rVE
	 3QDB5RMjhRuLQ+X6QRgWL77cls+SSZ3NmF3su0r23v/7rfaezNlQlPv4NUqDIRJJyo
	 xTv90oMk8pm+OmNByoRISdg/WDxnQjGG/VB5gevc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A3GLMCi081009
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Nov 2022 11:21:22 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 3 Nov
 2022 11:21:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 3 Nov 2022 11:21:22 -0500
Received: from [10.250.32.80] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A3GLMmO016044;
	Thu, 3 Nov 2022 11:21:22 -0500
Message-ID: <a302ddb2-7f7e-7388-60b4-3cd1c9bba96f@ti.com>
Date: Thu, 3 Nov 2022 11:21:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
Content-Language: en-US
To: Paul Barker <paul.barker@sancloud.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
 <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
 <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
 <1721551A6FBDDE25.26638@lists.yoctoproject.org>
 <1326f4e6-d6bd-3313-a0c9-746895864502@sancloud.com>
 <CAB2aN6P44KSxngO4JNaCe9df5Bqjh1v0eDFCHZ5FAOn+JK9LnA@mail.gmail.com>
 <e563bce4-c0e9-d75a-f602-45f877e9ed99@sancloud.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <e563bce4-c0e9-d75a-f602-45f877e9ed99@sancloud.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 03 Nov 2022 16:21:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15220

On 11/1/22 11:49 AM, Paul Barker wrote:
> On 26/10/2022 16:12, Denys Dmytriyenko wrote:
>> Weston 10 build failure is known and is being worked on.
>>
>> For details and a temporary workaround see this:
>>
>> https://patchwork.yoctoproject.org/project/arago/patch/20220329053703.2367559-1-denis@denix.org/ <https://patchwork.yoctoproject.org/project/arago/patch/20220329053703.2367559-1-denis@denix.org/>
> 
> Hi Denys,
> 
> I've tried the patch included in the linked email. It allows successful
> build of core-image-weston & tisdk-default-image. However, it does not
> work for AGL builds as weston 10 is required there:
> 
> | Run-time dependency libweston-10 found: NO (tried pkgconfig)
> |
> | ../git/meson.build:154:0: ERROR: Dependency "libweston-10" not found, tried pkgconfig
> |
> | A full log can be found at /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/build/meson-logs/meson-log.txt
> | ERROR: meson failed
> | WARNING: /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250:184 exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> |       #1: bbfatal_log, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 184
> |       #2: meson_do_configure, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 173
> |       #3: do_configure, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 149
> |       #4: main, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 197
> ERROR: Task (/workdir/meta-agl/meta-agl-core/recipes-graphics/wayland/agl-compositor_git.bb:do_configure) failed with exit code '1'
> 
> Is there any way forward here or do we need to wait for Weston 10
> support from TI?
> 

I'd recommend waiting for Weston 10 support. There are a couple
more patches that need forward ported from Dunfell to Kirkstone
still, then we can add on the GPU patches. No no guarantees but
I'd guess support is only a week or so away at this time.

Thanks,
Andrew

