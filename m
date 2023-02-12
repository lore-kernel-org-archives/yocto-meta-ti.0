Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEBDC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 13:50:25 +0000 (UTC)
Received: from smtp6.emailarray.com (smtp6.emailarray.com [65.39.216.46])
 by mx.groups.io with SMTP id smtpd.web11.10953.1676209818286615246
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 05:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: balister.org, ip: 65.39.216.46, mailfrom: philip@balister.org)
Received: (qmail 44421 invoked by uid 89); 12 Feb 2023 13:50:16 -0000
Received: from unknown (HELO ?192.168.11.155?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0A3NS43NS45Ni4y) (POLARISLOCAL)  
  by smtp6.emailarray.com with SMTP; 12 Feb 2023 13:50:16 -0000
Message-ID: <be158612-9ea1-a0e9-495e-4cd0661f725d@balister.org>
Date: Sun, 12 Feb 2023 08:50:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [meta-ti] Difference between beaglebone-ai64 and
 beaglebone-ai64-k3r5
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
References: <ee179ffa-ba74-be38-e519-b12d64e5a3bf@balister.org>
 <20230212002422.GI22689@denix.org>
From: Philip Balister <philip@balister.org>
In-Reply-To: <20230212002422.GI22689@denix.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 12 Feb 2023 13:50:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15816

Thanks Denys, this is extremely helpful!

Philip

On 2/11/23 19:24, Denys Dmytriyenko wrote:
> On Sat, Feb 11, 2023 at 01:01:00PM -0500, Philip Balister wrote:
>> I'm looking at the recent update to meta-ti/kirkstone that appears to
>> add support for the beaglebone ai64 and I am curious why there are two
>> machines added. I'm going to see if this works ASAP!
> 
> TI K3 family of SoCs utilize a heterogeneous multicore architecture, hence the
> bootflow is quite convoluted... You can read all the details from the official
> docs, also referenced from below links. But, basically, before getting into
> Linux on the main Aarch64 Cortex-A72 cores, it goes through init/boot and
> loads and runs different pieces on 32-bit MCU Cortex-R5F core.
> 
> Which means, from OE perspective, you need to be able to build 64-bit Linux
> stack as well as 32-bit bootloader and system firmware. And that means you
> need 2 different toolchains. That is done with OE multiconfig and as a
> byproduct, 2 machine configs. You normally don't use -k3r5 machine config
> directly, as it will be automatically handled by multiconfig dependencies to
> build the necessary MCU bootloader pieces...
> 
> You may want to check the first commit that introduced this split:
> https://git.yoctoproject.org/meta-ti/commit/?id=f814840465358a6b5429ad20165742ac6e6e6a29
> 
> Also, the common k3r5.inc file is rather self-explanatory:
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/conf/machine/include/k3r5.inc
> https://patchwork.yoctoproject.org/project/ti/patch/20230211234205.3042518-1-denis@denix.org/
> 

