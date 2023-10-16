Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E35CDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 14:34:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.127432.1697466864073948299
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 07:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JenFjxGY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39GEYNtJ077115
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697466863;
	bh=/BDWvj3JiYlwobp5i7NeorLeFgVBUF5OQwLD0jFZ5rg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JenFjxGYxTm5S6iU92Z2C+oVINGkuI97OzPcij/L5iW5QVQ1QqE8QX85xZPCBwEQk
	 w+623RNGJWzxdI3cYigMw4WxBw904riXWGU3nBscbb5NapxTik+fBD/LjF3u7WUbyA
	 7XtsfQb9wQZqzDdCo0tWJmK67Q/BGEvmgWp26cXY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39GEYNtk067143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:34:23 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 09:34:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 09:34:22 -0500
Received: from [128.247.81.1] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39GEYMjA056401;
	Mon, 16 Oct 2023 09:34:22 -0500
Message-ID: <1f78dc15-b9a6-4a8b-af77-06f7e9406b4c@ti.com>
Date: Mon, 16 Oct 2023 09:34:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Remove
 COMPATIBLE_MACHINE and extend recipe to k3 machines
To: Aniket Limaye <a-limaye@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
CC: "Eatmon, Ryan" <reatmon@ti.com>, "Gole, Dhruva" <d-gole@ti.com>,
        "Shilwant, Chirag" <c-shilwant@ti.com>,
        "Adivi, Sai Sree Kartheek"
	<s-adivi@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>
References: <20231012172947.1359231-1-a-limaye@ti.com>
 <20231012172947.1359231-2-a-limaye@ti.com>
 <8a2741b3-6fc5-46fc-bed2-c1528c407308@ti.com>
 <f902e28bfd21435a9b11abd44af2425f@ti.com>
 <56a62a33-87b3-4dea-a090-47e98ca93ba7@ti.com>
 <c71cba20-6c28-4283-8315-94407246491b@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <c71cba20-6c28-4283-8315-94407246491b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 39GEYNtJ077115
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:34:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17116

On 10/16/23 6:19 AM, Aniket Limaye wrote:
>=20
> On 13/10/23 20:34, Andrew Davis wrote:
>> On 10/12/23 10:38 PM, Limaye, Aniket wrote:
>>> Hi Andrew,
>>>
>>> We need those files to be packaged in the tisdk-core-bundle... So tha=
t it can be packaged in the installer we release on ti.com. We package th=
ese, ti-dm and the u-boot sources used, to enable u-boot builds in the in=
staller with the same sources used for our build.
>>>
>>
>> You can fetch those firmware out of their normal install directory.
>>
>> Andrew
>>
> Hi Andrew,
>=20
> I am not sure what you meant by the normal install directory. If you me=
ant the "image" directory, the tisdk-core-bundle recipe cannot access the=
 image directory of another recipe... I don't see a straightforward way o=
f having the core-bundle recipe pick up these images from the ti-sci-fw r=
ecipe.
>=20

Are you sure..? We do it all the time, that is the core function of the D=
EPENDS variable. If you DEPEND on
a recipe, then you have access to the installed output of it. If you make=
 core-bundle recipe DEPEND on ti-sci-fw
you will find the firmware in `${STAGING_DIR_HOST}${nonarch_base_libdir}/=
firmware/ti-sysfw*` for use in
the recipe build steps.

> Secondly, the tisdk-core-bundle always was and still is picking boot im=
ages, among other things, from the deploy directory [1].
>=20

Correct, but doesn't mean it isn't a hack. My suggestion is to fix tisdk-=
core-bundle. DEPLOYDIR is for
output to the user, "to be used outside of the build system" according to=
 the OE docs. It should not
be a staging directory for intermediate file sharing between recipes.

Same comment for the below points, just because we did before, doesn't me=
an we should continue.

Andrew

> ti-sci-fw itself was deploying these images in meta-ti up until 8.6 rel=
ease and up until this commit in kirkstone [2], not sure what the reasoni=
ng was to remove it there either... we did need the deployed binaries in =
the core-bundle and handled it through a bbappend in both Proc SDK layers=
 in 9.0.
>=20
> Lastly, ti-dm-fw also was always deploying the firmware [3]. Unless tha=
t was done for some special usecase that I am not aware of, I think that =
one was also needed for the same reason... to put it in the tisdk-core-bu=
ndle?
>=20
> [1]: https://git.ti.com/cgit/arago-project/meta-arago/tree/meta-arago-d=
istro/classes/tisdk-bundle.bbclass?h=3Dkirkstone#n272
> [2]: https://git.ti.com/cgit/arago-project/meta-ti/commit/meta-ti-bsp/r=
ecipes-bsp/ti-sci-fw/ti-sci-fw_git.bb?h=3Dkirkstone&id=3D7b797da2ef43f4f4=
50a546816b43b28f9379305a
> [3]: https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/rec=
ipes-bsp/ti-dm-fw/ti-dm-fw.bb?h=3Dkirkstone#n68
>=20
>=20
> Aniket
>=20
>>> Regards,
>>> Aniket
>>>
>>> -----Original Message-----
>>> From: Davis, Andrew <afd@ti.com>
>>> Sent: Friday, October 13, 2023 2:37 AM
>>> To: Limaye, Aniket <a-limaye@ti.com>; meta-ti@lists.yoctoproject.org
>>> Cc: Eatmon, Ryan <reatmon@ti.com>; Gole, Dhruva <d-gole@ti.com>; Shil=
want, Chirag <c-shilwant@ti.com>; Adivi, Sai Sree Kartheek <s-adivi@ti.co=
m>; Raghavendra, Vignesh <vigneshr@ti.com>
>>> Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Remove=
 COMPATIBLE_MACHINE and extend recipe to k3 machines
>>>
>>> On 10/12/23 12:29 PM, Aniket Limaye via lists.yoctoproject.org wrote:
>>>> Revert ebcf15bf0f31208e87ce60a4696e585940b46777 :
>>>> =C2=A0=C2=A0=C2=A0 "recipes-bsp:ti-sci-fw: Add k3r5 as COMPATIBLE_MA=
CHINE"
>>>>
>>>> Extend recipe to k3 machines too, to provide ti-fs-stub-* firmware f=
or
>>>> u-boot aarch64 build.
>>>>
>>>> Update do_deploy() to allow multiconfig builds for k3 machines
>>>>
>>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>>> ---
>>>> =C2=A0=C2=A0 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 6 =
++++--
>>>> =C2=A0=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>>> b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>>> index 801c8768..2ad93a5d 100644
>>>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>>> @@ -4,7 +4,6 @@ inherit deploy
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0 require recipes-bsp/ti-linux-fw/ti-linux-f=
w.inc
>>>> =C2=A0=C2=A0 -COMPATIBLE_MACHINE =3D "k3r5"
>>>> =C2=A0=C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0 CFLAGS[unexport] =3D "1"
>>>> @@ -26,7 +25,10 @@ do_install() {
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0 FILES:${PN} =3D "${nonarch_base_libdir}/fi=
rmware"
>>>> =C2=A0=C2=A0 -do_deploy() {
>>>> +do_deploy(){
>>>> +}
>>>> +
>>>> +do_deploy:k3r5() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}/ti-sysf=
w
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-sysfw/ti=
-sci-firmware-* ${DEPLOYDIR}/ti-sysfw
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-sysfw/ti=
-fs-firmware-* ${DEPLOYDIR}/ti-sysfw
>>>
>>> Why do we need to deploy these files in ${DEPLOYDIR}/ at all?
>>>
>>> Andrew
>>>
>>>>
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#17097):
>>>> https://lists.yoctoproject.org/g/meta-ti/message/17097
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/101923272/3619733
>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub
>>>> [afd@ti.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>

