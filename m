Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F704EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:55:03 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3942.1687366496005649440
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 09:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=b8bc3V+l;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35LGsoUR011514;
	Wed, 21 Jun 2023 11:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687366490;
	bh=uoQ2uFikypUKRvY61dQ0vVZpmuZ9sSdFKzxRSORdtc8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=b8bc3V+lOWxp0KXq0zj745TDSbHu08oopUNuTpXvjH7i+yc4OgQk/5uoiLlN8M07N
	 fU8wCHkBUmVTuldak/9yUVhoWS6XyZIkpyNAt0OqZmO/zdlpV5GPI4Ya9VOfMdvu5I
	 qOOmQPVjdePvf5GB9Ec/EI48YsQOYKXOlwkfaPfw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35LGsoMS115526
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jun 2023 11:54:50 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 11:54:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 11:54:50 -0500
Received: from [10.250.37.10] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35LGsocY020729;
	Wed, 21 Jun 2023 11:54:50 -0500
Message-ID: <299043e4-4b75-6d30-55b0-1c90aeb57616@ti.com>
Date: Wed, 21 Jun 2023 11:54:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][master/kirkstone][PATCH v2] pruhsr-fw: SR2.0: Add new
 firmware
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230620221555.4561-1-reatmon@ti.com>
 <addccf44-0b38-4acc-8b86-e412b33c03a5@ti.com>
 <20230621164431.GM1518@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230621164431.GM1518@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 16:55:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16761

On 6/21/23 11:44 AM, Denys Dmytriyenko wrote:
> On Wed, Jun 21, 2023 at 09:59:53AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> On 6/20/23 5:15 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> We need to package up new HSR firmware for am65x-sr2.  Add dependencies
>>> for them on the correct platforms.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> v2: Names of firmware were changed to match existing filenames.
>>>
>>>   .../pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb      | 34 +++++++++++++++++++
>>>   .../recipes-kernel/linux/kernel-rdepends.inc  |  4 +--
>>>   2 files changed, 36 insertions(+), 2 deletions(-)
>>>   create mode 100644 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
>>> new file mode 100644
>>> index 00000000..c31af832
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
>>> @@ -0,0 +1,34 @@
>>> +SUMMARY = "PRU HSR firmware for AM65xx SR2.0"
>>> +
>>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> +
>>> +PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
>>> +PR = "${INC_PR}.0"
>>> +
>>> +CLEANBROKEN = "1"
>>> +
>>> +COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>>> +
>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>> Is this needed? I don't think the package changes based on machine here.
> 
> Good question. It can be both ways with own pros and cons:
> 
> 1. Don't make it machine-specific. Either one of am64 or am65 will build the
> package once and it will be Aarch64-generic. So, same package with the same
> binaries inside can be used on am64 and am65. But COMPATIBLE_MACHINE is a
> build-time guard, so nothing prevents installing this Aarch64-generic package
> on other platforms - will that work? would there be adverse effects?
> 

There is no ill effects to installing this on other platforms, they are just
firmware blobs put in the firmware dir. No worse than installing a firmware
package for hardware you don't have installed (which we all do on our PCs).

I'd even say we should drop COMPATIBLE_MACHINE. Sure this firmware doesn't do
anything for machines other than AM65/AM64, but no harm either, so it is not
"incompatible". And the job of installing this only on machines that need it
is already handled in kernel-rdepends.inc below.

Andrew

> 2. Make it machine-specific (as it is now) - it will be built/packaged twice,
> separate for am64 and am65, and no other platform will be allowed to build it
> due to COMPATIBLE_MACHINE. Moreover, at run-time, no other platform will be
> allowed to even install either of the packages, since they are specific to
> each of those 2 platforms.
> 
> So, you decide which way is the best option in this case...
> 
> 
>>> +S = "${WORKDIR}/git"
>>> +
>>> +TARGET = " \
>>> +    am65x-sr2-pru0-pruhsr-fw.elf \
>>> +    am65x-sr2-pru1-pruhsr-fw.elf \
>>> +    am65x-sr2-rtu0-pruhsr-fw.elf \
>>> +    am65x-sr2-rtu1-pruhsr-fw.elf \
>>> +    am65x-sr2-txpru0-pruhsr-fw.elf \
>>> +    am65x-sr2-txpru1-pruhsr-fw.elf \
>>> +"
>>> +
>>> +do_install() {
>>> +	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
>>> +	for f in ${TARGET}; do
>>> +		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
>>> +	done
>>> +}
>>> +
>>> +FILES:${PN} = "${nonarch_base_libdir}/firmware"
>>> +
>>> +INSANE_SKIP:${PN} = "arch"
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>> index d2dcc3e5..7c8f3171 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>> @@ -16,8 +16,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx = " prueth-fw prusw-fw pruhsr
>>>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
>>>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
>>>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2"
>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2"
>>>   # Add run-time dependency for Cadence MHDP firmware to the rootfs
>>>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " cadence-mhdp-fw"
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#16760): https://lists.yoctoproject.org/g/meta-ti/message/16760
>>> Mute This Topic: https://lists.yoctoproject.org/mt/99665494/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695306/3619733/2033773410/xyzzy [afd@ti.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

