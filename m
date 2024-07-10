Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773DDC3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 14:35:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.16082.1720622150798176425
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jul 2024 07:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=CEtPQKDG;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46AEZmBX089407;
	Wed, 10 Jul 2024 09:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720622148;
	bh=8yrrbjKB4+dLQYwNOdL2ZDevvthjjllP81yDgibyjT8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CEtPQKDGR7NrMq6yAHfDZ68KAkwDzGxlyyqPoXe+r+3hAP0H5cjpwO+xsuh3uPqdT
	 w3Q8teH0l/C7FhrPi1Ga0TuCGANxmc/rjzp6CnKPXMQhwz0QbBuzYAi2f5FhMgsxFw
	 fqugjHxr4dmKSkzV4aeKRQge9siPijY/k7mk6P2g=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46AEZmNf019287
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jul 2024 09:35:48 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Jul 2024 09:35:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Jul 2024 09:35:47 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46AEZieT057167;
	Wed, 10 Jul 2024 09:35:45 -0500
Message-ID: <8b669d32-c5a5-4231-8e6f-6a644f1c850c@ti.com>
Date: Wed, 10 Jul 2024 20:05:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] recipes-ti: jailhouse: Update
 jailhouse for scarthgap
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <s-adivi@ti.com>,
        <khasim@ti.com>, <g-gupta@ti.com>
References: <20240709123359.3086351-1-p-bhagat@ti.com>
 <20240709150627.GO18231@denix.org>
 <681b4b17-3cc1-4376-ac9c-0fc66c29eb00@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <681b4b17-3cc1-4376-ac9c-0fc66c29eb00@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 46AEZmBX089407
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jul 2024 14:35:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17850

Hi Denys,
On 09/07/24 21:06, Ryan Eatmon wrote:
>
>
> On 7/9/2024 10:06 AM, Denys Dmytriyenko wrote:
>> On Tue, Jul 09, 2024 at 06:03:59PM +0530, Paresh Bhagat via=20
>> lists.yoctoproject.org wrote:
>>> Update SRCREV for jailhouse which incorporates makefile changes for
>>> scarthgap.
>>> Add ${ARAGO_IMAGE_SUFFIX} so that jailhouse can pick correct inmate
>>
>> NAK - this is meta-ti, no Arago specifics here.
>
> Good catch.=C2=A0 I missed that.





That's a good point.

Meanwhile, I see an update is needed in same patch post we modify=20
JH_RAMFS_IMAGE in meta-arago
to add=C2=A0${ARAGO_IMAGE_SUFFIX}.

If we see [1], we are making do_install depend on=20
|${JH_RAMFS_IMAGE}:do_image_complete.|
|So if ||${JH_RAMFS_IMAGE} has the RT suffix by default, the RT builds=20
are failing with|
||
```

ERROR: Nothing PROVIDES 'tisdk-jailhouse-inmate-rt'

```

So, we need an update in |python __anonymous to not use=20
||||${JH_RAMFS_IMAGE} in-order to avoid -rt suffix adding incase of RT=20
builds.|
|What will be the ideal way to handle & fix the above issue?|

[1]:=20
https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-extras/recipes=
-ti/jailhouse/jailhouse_git.bb?h=3Dscarthgap#n110




>
>
>>
>>> image for RT build.
>>> Skip QA checks for usrmerge and buildpath. This is required to packag=
e
>>> jailhouse in image.
>>> Update FILES:${PN}.
>>>
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> ---
>>> =C2=A0 .../recipes-ti/jailhouse/jailhouse_git.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 | 20=20
>>> +++++++++----------
>>> =C2=A0 .../recipes-ti/jailhouse/ti-jailhouse.inc=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>>> =C2=A0 2 files changed, 10 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb=20
>>> b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>> index 98ec0e9e..32e94dd0 100644
>>> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>> @@ -51,11 +51,11 @@ do_install() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${JH_RAMFS_IMAGE}" ]
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -f=20
>>> ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -f=20
>>> ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}=
.rootfs.cpio=20
>>> ]
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
nstall -m 0644=20
>>> ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
nstall -m 0644=20
>>> ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}=
.rootfs.cpio=20
>>> ${D}/boot
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
berror "Could not find JH_RAMFS_IMAGE=20
>>> (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
berror "Could not find JH_RAMFS_IMAGE=20
>>> (${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio)!"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 bberror "Please make sure that \"cpio\" is in=20
>>> IMAGE_FSTYPES."
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> @@ -68,7 +68,7 @@ do_install() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ./jailhouse-ce=
ll-linux -w=20
>>> ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -a ${JH_ARCH} -c "${JH_CMDLINE}" \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
i=20
>>> ${D}/boot/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cp=
io=20
>>> \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ${DEPLOY_DIR_IMAGE}/Image \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | tr -cd '\11\12\15\40-\176' \
>>> @@ -96,7 +96,8 @@ RDEPENDS:pyjailhouse =3D "python3-core=20
>>> python3-ctypes python3-fcntl python3-shell"
>>> =C2=A0 =C2=A0 RRECOMMENDS:${PN} =3D "${PN}-tools"
>>> =C2=A0 -INSANE_SKIP:${PN} =3D "ldflags"
>>> +INSANE_SKIP:${PN} =3D "ldflags usrmerge"
>>> +INSANE_SKIP:${PN}-dbg =3D "usrmerge buildpaths"
>>> =C2=A0 =C2=A0 KERNEL_MODULE_AUTOLOAD +=3D "jailhouse"
>>> =C2=A0 @@ -117,10 +118,7 @@ python __anonymous () {
>>> =C2=A0 }
>>> =C2=A0 =C2=A0 FILES:${PN} =3D " \
>>> -=C2=A0=C2=A0=C2=A0 /boot/* \
>>> -=C2=A0=C2=A0=C2=A0 /usr/libexec \
>>> -=C2=A0=C2=A0=C2=A0 /usr/sbin/* \
>>> -=C2=A0=C2=A0=C2=A0 /usr/libexec/* \
>>> -=C2=A0=C2=A0=C2=A0 /usr/share/* \
>>> -=C2=A0=C2=A0=C2=A0 /lib/firmware/* \
>>> +=C2=A0=C2=A0=C2=A0 /boot \
>>> +=C2=A0=C2=A0=C2=A0 /usr \
>>> +=C2=A0=C2=A0=C2=A0 /lib \
>>> =C2=A0 "
>>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc=20
>>> b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>> index 6faf16b8..2831e560 100644
>>> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D " \
>>> =C2=A0 COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
>>> =C2=A0 TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>> =C2=A0 PV =3D "0.12+git"
>>> -SRCREV =3D "603819ef9a771a3c253a141220daab8e61751a43"
>>> +SRCREV =3D "9b494ddf4bd8845a2c1063352d08a274ef61777b"
>>> =C2=A0 BRANCH =3D "master"
>>> =C2=A0 SRC_URI =3D " \
>>> git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=3Dhttps;bran=
ch=3D${BRANCH}=20
>>> \
>>> --=20
>>> 2.34.1
>

