Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D76C7EE23
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 21:49:01 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1244.1677707336042797053
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 13:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=d6BaRNMN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 321LmfnT002577;
	Wed, 1 Mar 2023 15:48:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677707321;
	bh=11wNw9b4b+AdBDzoTqMjk5mFrK2KwSE1XXo2OQbCDmk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d6BaRNMNl5/6Z+IY61CIHQs1H88uhDvSqH5qp9SSYlUMucT6qP/GXU6xBAq0FDuoB
	 A6ukURgchhiGaYx+RntoLnl0N+3K4m9+Oj9cJLa7qcGhdvUSkmokxqABtglbERY5TD
	 Y+3W+2n6p7pIyNLuF+WJ3Q65OG6xobxWxBbpMsSw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 321Lmfql018710
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Mar 2023 15:48:41 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 1
 Mar 2023 15:48:41 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 1 Mar 2023 15:48:41 -0600
Received: from [10.249.33.186] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 321LmemM022130;
	Wed, 1 Mar 2023 15:48:41 -0600
Message-ID: <e474b1dc-888c-d73e-fcb7-d87a805706a5@ti.com>
Date: Wed, 1 Mar 2023 15:48:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH 2/2] ti-sgx-ddk-um: use udev
 for userspace initialization
Content-Language: en-US
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20221216130139.20841-1-matthias.schiffer@ew.tq-group.com>
 <20221216130139.20841-2-matthias.schiffer@ew.tq-group.com>
 <20221219210029.GU22689@denix.org>
 <38b94bc6ee2f585eddbe7461ecd1d02f4ced08ab.camel@ew.tq-group.com>
 <20230223013826.GJ22689@denix.org>
 <8a4e2f08109cd05d5b364b8cf716b96d745919c7.camel@ew.tq-group.com>
 <20230301012631.GP22689@denix.org>
 <d06ed7242d5cb5905eba0f4a98ed176eb50320bf.camel@ew.tq-group.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <d06ed7242d5cb5905eba0f4a98ed176eb50320bf.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Mar 2023 21:49:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15970

On 3/1/23 3:01 AM, Matthias Schiffer wrote:
> On Tue, 2023-02-28 at 20:26 -0500, Denys Dmytriyenko wrote:
>> On Thu, Feb 23, 2023 at 10:20:12AM +0100, Matthias Schiffer wrote:
>>> On Wed, 2023-02-22 at 20:38 -0500, Denys Dmytriyenko wrote:
>>>> So, testing the latest patch series, I started getting breakage on all SGX
>>>> platforms:
>>>>
>>>> WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst returned 1, marking as unpacked only, configuration required on target.
>>>> ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
>>>> then please place them into pkg_postinst_ontarget:${PN} ().
>>>> Deferring to first boot via 'exit 1' is no longer supported.
>>>> Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
>>>> ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.156835
>>>> ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1'
>>>>
>>>>
>>>> WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst returned 1, marking as unpacked only, configuration required on target.
>>>> ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
>>>> then please place them into pkg_postinst_ontarget:${PN} ().
>>>> Deferring to first boot via 'exit 1' is no longer supported.
>>>> Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
>>>> ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.164346
>>>> ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1'
>>>>
>>>>
>>>> WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst returned 1, marking as unpacked only, configuration required on target.
>>>> ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
>>>> then please place them into pkg_postinst_ontarget:${PN} ().
>>>> Deferring to first boot via 'exit 1' is no longer supported.
>>>> Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
>>>> ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.do_rootfs.159785
>>>> ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1'
>>>>
>>>>
>>>> Reverting this commit helps with the build:
>>>> https://git.yoctoproject.org/meta-ti/commit/?h=kirkstone&id=f50f55102f926ba58ea22339a98e4239370af6c6
>>>>
>>>>
>>>> So far I didn't have time to dig deeper, though it's not obvious right away...
>>>>
>>>
>>> Hi Denys,
>>>
>>> I assume that the failing postinst script must come from update-
>>> rc.d.bbclass, but without knowing what command in the script is failing
>>> it's difficult to say anything for certain. Would it be possible for
>>> you to make a ti-sgx-ddk-um RPM or similar from the failing build
>>> available for us to have a look at?
>>>
>>> What DISTRO_FEATURES is your build using? sysvinit, no systemd?
>>
>> Matthias,
>>
>> This is default Arago distro with both systemd and sysvinit in the
>> DISTRO_FEATURES, and it generates IPKs. I looked at the corresponding
>> postinst scripts and didn't see anything obvious.
>>
>> Unfortunately, I didn't have time to debug that further and had to
>> switch to graphics updates. Part of it was updating SGX UM recipe
>> and forcing rebuild, so I haven't seen any breakage since then.
>>
>> I might try reshuffling my patch queue in order to reproduce it, if I
>> have time, to see if it was due to stale sstate or something similar.
>>
> 
> Hi Denys,
> 
> I believe I have seen stale sstate issues with postinst scripts before.
> 
> IIRC, something like adding "unset pkg_postinst_ontarget_${PN}" to a
> bbappend didn't trigger a rebuild, but I never got around to check
> whether the bug was caused by postinst(_ontarget), unset, or a
> combination of both. According to my Git log, this must have been on
> WRL LTS18 / Yocto Thud though, so what you're seeing might also be an
> entirely different issue...
> 

I'm getting the error with a clean sstate. Seem it is related to
update-rc.d. We should *not* inherit this class unless we have
something deployed to init.d/ but your patch removes those files
in the default case and so update-rc.d fails.

inherit ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'update-rc.d', '', d)}

Seems to help, but only handles the case when sysvinit is not used,
not the case when udev in PACKAGECONFIG causes the initscript to be
removed. That might require some more complex check.

Andrew

