Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE6EC3DA47
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 09:28:50 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7906.1720690123544290925
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jul 2024 02:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=hpyvC552;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46B9Se3U064601;
	Thu, 11 Jul 2024 04:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720690120;
	bh=CPMEX7prtQb0JQlZb00bFpsB66KcyoO4nJBjVx2eJd8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hpyvC552G+iilgdxMSjsW6M9UXHHCd6PL01C6oxP59njM620gaZjK6/5bmHOmomuO
	 oOoTAUeb6lv9zovFzvZGNGwRouDh5GkZ8E8dG2eQMlQWU1W0jsbs+HWZA2x9D/6bP1
	 JUQwZyZefN8rK9WjcAM8cGVM0IVHYx5jHK6bRaog=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46B9SetV020124
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jul 2024 04:28:40 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 Jul 2024 04:28:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 Jul 2024 04:28:39 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46B9SaiM068140;
	Thu, 11 Jul 2024 04:28:37 -0500
Message-ID: <f3ca5564-fd0f-40c5-bdaa-df40e6558d29@ti.com>
Date: Thu, 11 Jul 2024 14:58:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] recipes-ti: jailhouse: Update
 jailhouse for scarthgap
To: Chirag Shilwant <c-shilwant@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <s-adivi@ti.com>,
        <khasim@ti.com>, <g-gupta@ti.com>
References: <20240709123359.3086351-1-p-bhagat@ti.com>
 <20240709150627.GO18231@denix.org>
 <681b4b17-3cc1-4376-ac9c-0fc66c29eb00@ti.com>
 <8b669d32-c5a5-4231-8e6f-6a644f1c850c@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <8b669d32-c5a5-4231-8e6f-6a644f1c850c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 46B9Se3U064601
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jul 2024 09:28:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17854

Hi all,

On 10/07/24 20:05, Chirag Shilwant wrote:
> Hi Denys,
> On 09/07/24 21:06, Ryan Eatmon wrote:
>>
>>
>> On 7/9/2024 10:06 AM, Denys Dmytriyenko wrote:
>>> On Tue, Jul 09, 2024 at 06:03:59PM +0530, Paresh Bhagat via=20
>>> lists.yoctoproject.org wrote:
>>>> Update SRCREV for jailhouse which incorporates makefile changes for
>>>> scarthgap.
>>>> Add ${ARAGO_IMAGE_SUFFIX} so that jailhouse can pick correct inmate
>>>
>>> NAK - this is meta-ti, no Arago specifics here.
>>
>> Good catch.=C2=A0 I missed that.
Will update this. Thanks
>
>
>
>
>
> That's a good point.
>
> Meanwhile, I see an update is needed in same patch post we modify=20
> JH_RAMFS_IMAGE in meta-arago
> to add=C2=A0${ARAGO_IMAGE_SUFFIX}.
>
> If we see [1], we are making do_install depend on=20
> |${JH_RAMFS_IMAGE}:do_image_complete.|
> |So if ||${JH_RAMFS_IMAGE} has the RT suffix by default, the RT builds=20
> are failing with|
> ||
> ```
>
> ERROR: Nothing PROVIDES 'tisdk-jailhouse-inmate-rt'
>
> ```
>
> So, we need an update in |python __anonymous to not use=20
> ||||${JH_RAMFS_IMAGE} in-order to avoid -rt suffix adding incase of RT=20
> builds.|
> |What will be the ideal way to handle & fix the above issue?|
>
> [1]:=20
> https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-extras/recip=
es-ti/jailhouse/jailhouse_git.bb?h=3Dscarthgap#n110
>
>
Yep i tried to update JH_RAMFS_IMAGE in meta-arago but the build failed=20
as it adds tisdk-jailhouse-inmate-rt as a dependency for RT build=20
instead of tisdk-jailhouse-inmate.
The JH_RAMFS_IMAGE is only to provide name of the inmate image recipe=20
which will be build and packaged in tisdk-jailhouse-image. Instead of=20
modifying this variable or adding a new variable for RT build, we can=20
use * in do_install when the image is being packaged or referenced. This=20
should work for both RT and non RT builds. I will send v2 for your review.
>
>
>>
>>
>>>
>>>> image for RT build.
>>>> Skip QA checks for usrmerge and buildpath. This is required to packa=
ge
>>>> jailhouse in image.
>>>> Update FILES:${PN}.
>>>>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>>> ---
>>>> =C2=A0 .../recipes-ti/jailhouse/jailhouse_git.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 | 20=20
>>>> +++++++++----------
>>>> =C2=A0 .../recipes-ti/jailhouse/ti-jailhouse.inc=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>>>> =C2=A0 2 files changed, 10 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb=20
>>>> b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>>> index 98ec0e9e..32e94dd0 100644
>>>> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>>> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>>> @@ -51,11 +51,11 @@ do_install() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${JH_RAMFS_IMAGE}" ]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -f=20
>>>> ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -f=20
>>>> ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE=
}.rootfs.cpio=20
>>>> ]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
install -m 0644=20
>>>> ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
install -m 0644=20
>>>> ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE=
}.rootfs.cpio=20
>>>> ${D}/boot
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bberror "Could not find JH_RAMFS_IMAGE=20
>>>> (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bberror "Could not find JH_RAMFS_IMAGE=20
>>>> (${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio)!"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 bberror "Please make sure that \"cpio\" is in=20
>>>> IMAGE_FSTYPES."
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>> @@ -68,7 +68,7 @@ do_install() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ./jailhouse-c=
ell-linux -w=20
>>>> ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -a ${JH_ARCH} -c "${JH_CMDLINE}" \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
-i=20
>>>> ${D}/boot/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.c=
pio=20
>>>> \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ${DEPLOY_DIR_IMAGE}/Image \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | tr -cd '\11\12\15\40-\176' \
>>>> @@ -96,7 +96,8 @@ RDEPENDS:pyjailhouse =3D "python3-core=20
>>>> python3-ctypes python3-fcntl python3-shell"
>>>> =C2=A0 =C2=A0 RRECOMMENDS:${PN} =3D "${PN}-tools"
>>>> =C2=A0 -INSANE_SKIP:${PN} =3D "ldflags"
>>>> +INSANE_SKIP:${PN} =3D "ldflags usrmerge"
>>>> +INSANE_SKIP:${PN}-dbg =3D "usrmerge buildpaths"
>>>> =C2=A0 =C2=A0 KERNEL_MODULE_AUTOLOAD +=3D "jailhouse"
>>>> =C2=A0 @@ -117,10 +118,7 @@ python __anonymous () {
>>>> =C2=A0 }
>>>> =C2=A0 =C2=A0 FILES:${PN} =3D " \
>>>> -=C2=A0=C2=A0=C2=A0 /boot/* \
>>>> -=C2=A0=C2=A0=C2=A0 /usr/libexec \
>>>> -=C2=A0=C2=A0=C2=A0 /usr/sbin/* \
>>>> -=C2=A0=C2=A0=C2=A0 /usr/libexec/* \
>>>> -=C2=A0=C2=A0=C2=A0 /usr/share/* \
>>>> -=C2=A0=C2=A0=C2=A0 /lib/firmware/* \
>>>> +=C2=A0=C2=A0=C2=A0 /boot \
>>>> +=C2=A0=C2=A0=C2=A0 /usr \
>>>> +=C2=A0=C2=A0=C2=A0 /lib \
>>>> =C2=A0 "
>>>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc=20
>>>> b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>> index 6faf16b8..2831e560 100644
>>>> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D " \
>>>> =C2=A0 COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
>>>> =C2=A0 TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>>> =C2=A0 PV =3D "0.12+git"
>>>> -SRCREV =3D "603819ef9a771a3c253a141220daab8e61751a43"
>>>> +SRCREV =3D "9b494ddf4bd8845a2c1063352d08a274ef61777b"
>>>> =C2=A0 BRANCH =3D "master"
>>>> =C2=A0 SRC_URI =3D " \
>>>> git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=3Dhttps;bra=
nch=3D${BRANCH}=20
>>>> \
>>>> --=20
>>>> 2.34.1
>>

