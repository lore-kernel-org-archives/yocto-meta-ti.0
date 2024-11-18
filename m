Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4072FD43FF3
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:02:46 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.36948.1731920564202602989
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 01:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=aseaNhgV;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-shenai@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AI92fou101101;
	Mon, 18 Nov 2024 03:02:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731920561;
	bh=cg4//4wH+QgElaL28Aqc/fKZll8oAT4/la+3Yi2nKSo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aseaNhgV/C5YKaX24QoudLkx1cnUHQKEzS+MmfwIFuV/eZ573hXNLKTdLwBA9kHM3
	 2EY1apy8G9O2m4UDf4n32/K75tqfXR9iGeWdBwWpvkoDrTQ4HJL375JEVFTBpqCa2a
	 nQdyGCVTU2ZwhIO8cyrfWkaYJRSaMvM2lA+eWz+8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AI92fJH008568
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Nov 2024 03:02:41 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 18
 Nov 2024 03:02:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 18 Nov 2024 03:02:40 -0600
Received: from [172.24.227.252] (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AI92c9c047878;
	Mon, 18 Nov 2024 03:02:38 -0600
Message-ID: <b075242f-c6c6-4682-9212-e65b04f289b3@ti.com>
Date: Mon, 18 Nov 2024 14:32:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v1] meta-ti: Linux configs:
 Bring selinux related configs
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <kamlesh@ti.com>
References: <20241114054808.2945905-1-a-shenai@ti.com>
 <20241114191741.GS20070@denix.org>
 <1825b1b0-b0b7-459e-8639-8b67a18bc144@ti.com>
Content-Language: en-US
From: Aashvij Shenai <a-shenai@ti.com>
In-Reply-To: <1825b1b0-b0b7-459e-8639-8b67a18bc144@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 4AI92fou101101
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 18 Nov 2024 09:02:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18072

Thanks for the reviews.

On 15/11/24 02:11, Ryan Eatmon wrote:
>
>
> On 11/14/2024 1:17 PM, Denys Dmytriyenko wrote:
>> There are several issues with the patch itself, but that is secondary.
>>
>> The primary issue is that this adds a new layer dependency to=20
>> meta-ti-bsp
>> (which is also not explicitly configured in layer.conf) - that is a ve=
ry
>> undesirable thing for a BSP layer.
>
> That is a very good point.=C2=A0 I just sent my own reply to this patch=
=20
> listing the issues with it.=C2=A0 But this is a very very good point.
>
> Question though... if the inclusion of the setup files in meta-selinux=20
> are hidden behind a DISTRO_FEATURES then are we really adding a=20
> dependency on meta-selinux?=C2=A0 Or are we adding a conditional depend=
ency=20
> that assumes that if you are turning on "selinux" then meta-selinux=20
> must be in the bblayers.conf?
>
Would moving an updated linux-ti-staging_%.bbappend under=20
`meta-arago/meta-arago-distro/recipes-kernel`or=20
`meta-arago/meta-arago-extras/recipes-kernel` resolve this impasse?

>
>
>
>> This should be done in a Distro or Product layer (I'm not even shure
>> meta-arago-distro should have this by default, to be honest).
>>
>>
>> On Thu, Nov 14, 2024 at 11:18:08AM +0530, Aashvij Shenai via=20
>> lists.yoctoproject.org wrote:
>>> Kernel configs that are important for SELinux to be included in the
>>> Linux kernel are present in the meta-selinux layer.
>>>
>>> Ideally, we wouldn't want to be calling a file from another
>>> layer since it would become messy. However, bringing those configs
>>> into meta-ti layer would hit maintainbility issues.
>>>
>>> The root cause of this problem lies in the recipe name. While
>>> meta-selinux names their bbapend as linux_yocto_%.bbappend, TI has=20
>>> their
>>> recipe named as linux-ti-staging_%.bb
>>>
>>> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
>>> ---
>>> =C2=A0 .../linux/linux-ti-staging_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15=20
>>> +++++++++++++++
>>> =C2=A0 1 file changed, 15 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
>>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend=20
>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
>>> new file mode 100644
>>> index 00000000..460df5de
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
>>> @@ -0,0 +1,15 @@
>>> +# The meta-selinux layer includes an selinux.cfg file containing
>>> +# configs necessary for the Linux kernel to enable SELinux
>>> +
>>> +# In order to reduce maintainability issues, the file will
>>> +# be retained in meta-selinux layer
>>> +
>>> +FILESEXTRAPATHS:prepend :=3D "${@bb.utils.contains('DISTRO_FEATURES'=
,=20
>>> 'selinux',=20
>>> '${TOPDIR}/../sources/meta-selinux/recipes-kernel/linux/files:', '',=20
>>> d)}"
>>> +
>>> +SRC_URI +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'selinux',=20
>>> 'file://selinux.cfg', '', d)}"
>>> +
>>> +do_configure:append() {
>>> +=C2=A0=C2=A0=C2=A0 if echo "${DISTRO_FEATURES}" | grep -q "selinux";=
 then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat ${WORKDIR}/selinux.cf=
g >> ${B}/.config
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +}
>>> \ No newline at end of file
>>> --=20
>>> 2.34.1
>>>
>
Regards,

Aashvij


