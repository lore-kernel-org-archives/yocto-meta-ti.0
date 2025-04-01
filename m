Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D2DC36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 06:31:00 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.12967.1743489052596390492
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 23:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KZOlBbJf;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-padhi@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5316UlBN3524855
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 01:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743489048;
	bh=LLFxDZ2Uo60x3RR2vIMF2uj6ETr6rJRcvH1so+r4gCA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KZOlBbJf3ZdALqbaU+ser3o94OIUJPkrot4naJdVz6NiiJvY6W01U8EcIYGvPMVnF
	 okzrpQEgJCbBX98S3736IquBOJBobAsJSMkIUzyPDu9ICgnV8SW203syEbRJToDEDK
	 f6YUIvKCgcXPyNeDKXM1G96Iz0OVyLtKw5pPaitk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5316Ul56011748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Apr 2025 01:30:47 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 01:30:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 01:30:47 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5316Ui7s030827;
	Tue, 1 Apr 2025 01:30:45 -0500
Message-ID: <39974326-b66a-4159-b798-9ca0628ae8e2@ti.com>
Date: Tue, 1 Apr 2025 12:00:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] ti-hsm-fw: Add a recipe to
 export prebuilt HSM firmware
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <a-limaye@ti.com>, <afd@ti.com>,
        <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>,
        "Anna, Suman"
	<s-anna@ti.com>
References: <20250327092323.1726839-1-b-padhi@ti.com>
 <20250327184520.GW23729@denix.org>
 <c9858c09-a8e0-4965-8574-3de234d290d2@ti.com>
 <20250328173212.GX23729@denix.org>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250328173212.GX23729@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Apr 2025 06:31:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18441

Hi Denys,

On 28/03/25 23:02, Denys Dmytriyenko wrote:
> On Fri, Mar 28, 2025 at 10:20:08AM +0530, Beleswar Prasad Padhi wrote:
>> Hi Denys,
>>
>> On 28/03/25 00:15, Denys Dmytriyenko wrote:
>>> On Thu, Mar 27, 2025 at 02:53:23PM +0530, Beleswar Padhi via lists.yoctoproject.org wrote:
>>>> Add a recipe to deploy the HSM firmware to the DEPLOYDIR, to be picked
>>>> up by the tisdk-core-bundle for the prebuilt binaries directory.
> The commit message says the firmware only needs to be deployed for packaging
> into the SDK bundle.


Will address in v2.

>
>
>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>> ---
>>>>   .../recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb    | 28 +++++++++++++++++++
>>>>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>>>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  4 +++
>>>>   3 files changed, 33 insertions(+)
>>>>   create mode 100644 meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
>>>> new file mode 100644
>>>> index 00000000..8b225421
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
>>>> @@ -0,0 +1,28 @@
>>>> +SUMMARY = "TI HSM Firmware"
>>>> +
>>>> +inherit deploy
>>>> +
>>>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> +
>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> +
>>>> +PV = "${TI_HSM_FW_VERSION}"
>>>> +PR = "${INC_PR}.0"
>>>> +
>>>> +SYSFW_SOC ?= "*"
>>>> +SYSFW_SOC:j721s2 = "j721s2"
>>>> +SYSFW_SOC:j784s4 = "j784s4"
>>> This variable is normally set by k3r5 machine configs and used for a different
>>> purpose.
>>>
>>> Re-using it here for another purpose may be confusing, should a new variable
>>> be used instead?
>>
>> Sure we can have something like HSM_FW_SOC or so.
>>
>>> Also, if the firmware is only applicable to j721s2 and j784s4, should there be
>>> a corresponding COMPATIBLE_MACHINE?
>>
>> I put this ti-hsm-fw recipe as a depedency in the u-boot-ti.inc file
>> for j721s2 and j784s4 boards. Does that not serve the same purpose
>> as COMPATIBLE_MACHINE? Or am I missing something?
> Not exactly the same - see below.
>
>
>>>> +HSM_BINARY = "hsm-demo-firmware-${SYSFW_SOC}*.bin"
>>> What would happen if this gets pulled by other non compatible platforms and
>>> SYSFW_SOC is set to * above?
>>
>> This should not be pulled by other platforms since we have the
>> dependency in u-boot-ti.inc (correct me if I am wrong). If it does
>> though, all the available HSM demo firmwares will be copied to that
>> non-compatible platform.
> So, I was trying to understand how it is supposed to be used and how do you
> prevent incorrect usage. E.g. if someone accidentally pulls this package
> either directly or indirectly, what should be the behavior?
>
> 1. If you set COMPATIBLE_MACHINE in the recipe, any use by incompatible
> platform will result in a build failure
>
> 2. Alternatively, you could get corresponding FW images deployed and packaged
> for compatible platforms, but deploy/package nothing for incompatible ones
> w/o hard failure - in that case you want to avoid wildcards in the path/name
> and maybe do a conditional copy/install, in other places we sometimes do a
> "for" loop so it can be empty...
>
> 3. Or, as Andrew suggested, just package all FW images regardless of the
> platform and let build/runtime logic sort them out


Thank you for helping with a detailed explanation. I understand it now. 
I will send a revision addressing this.

I will use COMPATIBLE_MACHINE in the recipe.

>
>
>>>> +do_install() {
>>>> +	install -d ${D}${nonarch_base_libdir}/firmware/ti-hsm
>>>> +	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${D}${nonarch_base_libdir}/firmware/ti-hsm
>>>> +}
> Here you intall the FW images into the rootfs to be used by the system,
> presumably the kernel?


Got it, we do not need that for this HSM firmware.

>
>
>>>> +do_deploy() {
>>>> +	install -d ${DEPLOYDIR}/ti-hsm
>>>> +	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${DEPLOYDIR}/ti-hsm
>>>> +}
> Here you deploy them for SDK bundle (and U-boot packaging)
>
>
>>>> +addtask deploy before do_build after do_compile
>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> index 0d912625..4e9c385c 100644
>>>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> @@ -16,6 +16,7 @@ IMG_DEC_FW_VERSION = "1.0"
>>>>   CNM_WAVE521_FW_VERSION = "1.0.7"
>>>>   TI_DM_FW_VERSION = "11.00.09"
>>>>   TI_SYSFW_VERSION = "11.00.07"
>>>> +TI_HSM_FW_VERSION = "11.00.09"
>>>>   TI_LINUX_FW_SRCREV ?= "27003b6bff61a55dd1fff2cc777e5e07b092b1f7"
>>>>   SRCREV = "${TI_LINUX_FW_SRCREV}"
>>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>>> index 41d4abdd..8a800193 100644
>>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>>> @@ -40,6 +40,10 @@ DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-n
>>>>   DEPENDS:append:k3 = " ti-sci-fw"
>>>>   DEPENDS:append:k3r5 = " ti-sci-fw"
>>>> +# HSM Firmware is only applicable for J721S2 & J784S4 devices
>>>> +DEPENDS:append:j721s2 = " ti-hsm-fw"
>>>> +DEPENDS:append:j784s4 = " ti-hsm-fw"
>>> Why are these DEPENDS in U-boot? Is the firmware being packaged there?
>>
>> Yes this firmware is packaged inside U-Boot (tispl.bin FIT image)
>> and hence is a build time dependency.
> First of all, that's not what the commit message above says.
>
> Second, if they get packaged into tispl.bin FIT image, why do you need to
> install them into the rootfs under /lib/firmware/ti-hsm?
>
>  From the recipe it's not obvious and someone will try to add ti-hsm-fw package
> to the image...
>

Thanks, I will address these comments in v2.


