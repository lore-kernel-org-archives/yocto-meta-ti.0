Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5D3C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 15:32:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.17413.1676302352478340256
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 07:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C5xx3h9Z;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31DFWV3P060586;
	Mon, 13 Feb 2023 09:32:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676302351;
	bh=dbCaygsfPSvyXXae33sOClAZCWwJjEALFMVjDaovr+s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=C5xx3h9ZvAZWcSOAR8F50g+5k/uizWrmbhBb0dP3eVHlxlTeIsILfL7SMpGxT0uBA
	 aflEpwHAnUE7ih65xtzVP6xLrJfUtL0nrK7wHvJScTnGjIuf4HF//WPyIDBiPewcH4
	 hPPmtFF+oKPUPqHuujZc0n0+1ixMOlISJ4Bna9Rg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31DFWVLj003389
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Feb 2023 09:32:31 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 13
 Feb 2023 09:32:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 13 Feb 2023 09:32:30 -0600
Received: from [10.250.33.40] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31DFWUbE007979;
	Mon, 13 Feb 2023 09:32:30 -0600
Message-ID: <08bf2a0b-77d3-d6cd-0965-77109ec195a3@ti.com>
Date: Mon, 13 Feb 2023 09:32:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2-evm: Add
 support for J721S2 HS-FS
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, Ryan Eatmon <reatmon@ti.com>
CC: <denys@ti.com>, <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Sinthu Raja <sinthu.raja@ti.com>, Aniket Limaye <a-limaye@ti.com>
References: <20230210152641.14513-1-sinthu.raja@ti.com>
 <976cd56a-968b-dcc5-a50f-873b32d4239f@ti.com>
 <CAEd-yTTtmcX7+OLg8dFRCtWKfaOLj=o3OX0QON3qG-XkgtLaTw@mail.gmail.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CAEd-yTTtmcX7+OLg8dFRCtWKfaOLj=o3OX0QON3qG-XkgtLaTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Feb 2023 15:32:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15826

On 2/13/23 12:45 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> On Sat, Feb 11, 2023 at 1:53 AM Ryan Eatmon <reatmon@ti.com> wrote:
>>
>>
>>
>> On 2/10/2023 9:26, Sinthu Raja wrote:
>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>
>>> Add the basic J721S2 HS-FS configuration.
>>>       - Add configurations to support both HS-FS and GP and keep GP
>>>         as the default.
>>>       - Add ti-sci-firmware overrides for HS-FS.
>>>
>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>
>> This patch does not even build.  Both j721s2-evm and j721s2-hs-evm are
>> broken.
>>
> 
>> What the reasoning for trying to get this into dunfell given that the
>> transition to kirkstone is right around the corner and the plan is to
>> redo all of HS stuff for all platforms at that time?
>>
> Ryan,
> AM68 SK and J721S2 EVM use the same MACHINE name which is j721s2-evm.
> This patch should be there in dunfell to support the AM68 SK HS-FS
> which is critical for APL release.
> I am sending the fixed version of this patch which I have tested locally.

It should be assumed that *all* patches one sends are tested locally first ;)

Andrew

> 
> Regards
> Sinthu Raja.
>>> ---
>>>
>>> Changes in V2:
>>> =============
>>> Address review comment:
>>> - Keep GP as the default.
>>>
>>> V1: https://lists.yoctoproject.org/g/meta-ti/message/15771
>>>
>>>    conf/machine/j721s2-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
>>>    conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
>>>    conf/machine/j721s2-evm.conf                | 12 ++++++++++--
>>>    conf/multiconfig/k3r5-sr1-hs-fs.conf        |  3 +++
>>>    conf/multiconfig/k3r5-sr1.conf              |  3 +++
>>>    recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
>>>    6 files changed, 53 insertions(+), 3 deletions(-)
>>>    create mode 100644 conf/machine/j721s2-evm-k3r5-gp.conf
>>>    create mode 100644 conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
>>>    create mode 100644 conf/multiconfig/k3r5-sr1-hs-fs.conf
>>>    create mode 100644 conf/multiconfig/k3r5-sr1.conf
>>>
>>> diff --git a/conf/machine/j721s2-evm-k3r5-gp.conf b/conf/machine/j721s2-evm-k3r5-gp.conf
>>> new file mode 100644
>>> index 00000000..51362b85
>>> --- /dev/null
>>> +++ b/conf/machine/j721s2-evm-k3r5-gp.conf
>>> @@ -0,0 +1,20 @@
>>> +#@TYPE: Machine
>>> +#@NAME: J721S2 GP EVM (R5F)
>>> +#@DESCRIPTION: Machine configuration for the TI J721S2 GP EVM (R5F core)
>>> +
>>> +# Booting GP requires different SYSFW, the rest is handled at runtime
>>> +
>>> +require conf/machine/include/k3r5.inc
>>> +SOC_FAMILY_append = ":k3r5-gp"
>>> +
>>> +SYSFW_SOC = "j721s2"
>>> +SYSFW_CONFIG = "evm"
>>> +SYSFW_SUFFIX = "gp"
>>> +SYSFW_TIBOOT3_SYMLINK = ""
>>> +
>>> +UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
>>> +
>>> +SPL_BINARY = ""
>>> +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
>>> +UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>>> +UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
>>> diff --git a/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf b/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
>>> new file mode 100644
>>> index 00000000..786338a9
>>> --- /dev/null
>>> +++ b/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
>>> @@ -0,0 +1,15 @@
>>> +#@TYPE: Machine
>>> +#@NAME: J721S2 HS-FS EVM (R5F)
>>> +#@DESCRIPTION: Machine configuration for the TI J721S2 HS-FS EVM (R5F core)
>>> +
>>> +# Booting HS-FS requires different SYSFW, the rest is handled at runtime
>>> +
>>> +require conf/machine/include/k3r5.inc
>>> +SOC_FAMILY_append = ":k3r5-sr1-hs-fs"
>>> +
>>> +SYSFW_SOC = "j721s2"
>>> +SYSFW_CONFIG = "evm"
>>> +SYSFW_SUFFIX = "hs-fs"
>>> +SYSFW_TIBOOT3_SYMLINK = ""
>>> +
>>> +UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
>>> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
>>> index 7c120dcc..7d2597b5 100644
>>> --- a/conf/machine/j721s2-evm.conf
>>> +++ b/conf/machine/j721s2-evm.conf
>>> @@ -40,5 +40,13 @@ KERNEL_DEVICETREE = " \
>>>
>>>    UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
>>>
>>> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>>> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>>> +# Default tiboot3.bin on J721S2 is for GP
>>> +BBMULTICONFIG = "k3r5-gp"
>>> +do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
>>> +do_image_tar[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
>>> +
>>> +# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
>>> +BBMULTICONFIG += "k3r5-sr1-hs-fs"
>>> +IMAGE_BOOT_FILES += " tiboot3-j721s2-hs-fs-evm.bin"
>>> +do_image_wic[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
>>> +do_image_tar[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
>>> diff --git a/conf/multiconfig/k3r5-sr1-hs-fs.conf b/conf/multiconfig/k3r5-sr1-hs-fs.conf
>>> new file mode 100644
>>> index 00000000..2fa28c95
>>> --- /dev/null
>>> +++ b/conf/multiconfig/k3r5-sr1-hs-fs.conf
>>> @@ -0,0 +1,3 @@
>>> +require k3r5-sr1.conf
>>> +
>>> +MACHINE_append = "-hs-fs"
>>> diff --git a/conf/multiconfig/k3r5-sr1.conf b/conf/multiconfig/k3r5-sr1.conf
>>> new file mode 100644
>>> index 00000000..2b87de8a
>>> --- /dev/null
>>> +++ b/conf/multiconfig/k3r5-sr1.conf
>>> @@ -0,0 +1,3 @@
>>> +require k3r5.conf
>>> +
>>> +MACHINE_append = "-sr1"
>>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>> index 7896c366..cb197954 100644
>>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>> @@ -33,7 +33,8 @@ SYSFW_PREFIX_j7-hs-evm-k3r5 = "fs"
>>>    SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "fs"
>>>    SYSFW_PREFIX_j7200-evm-k3r5 = "fs"
>>>    SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
>>> -SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
>>> +SYSFW_PREFIX_j721s2-evm-k3r5-gp = "fs"
>>> +SYSFW_PREFIX_j721s2-evm-k3r5-sr1-hs-fs = "fs"
>>>    SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
>>>    SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
>>>    SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
>>
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15817): https://lists.yoctoproject.org/g/meta-ti/message/15817
> Mute This Topic: https://lists.yoctoproject.org/mt/96878140/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

