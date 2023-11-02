Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97612C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 14:57:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.33359.1698937042916495052
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 07:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=TF36OKM3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A2EvBRa001898;
	Thu, 2 Nov 2023 09:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698937032;
	bh=nA8cCBlOD/jswJxawNMpuBzaq2jq4CLDwhWFffoKb78=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TF36OKM3RDv10vSTz5GFMQNV/ihX9aUboUsO9s7O793YV/sCQMUvhYfzmeWtQqIJ6
	 +wwBKecpUDFmFN+fJrAN4iHQVw0qYAYhcEmWsNrSuMY6Rk55acSjZcY7R+oB+RBSqT
	 F8RRUZP+7ZgrF1ketGwXz0JEijoNMrQBC6TMLTZw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A2EvBs5052936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Nov 2023 09:57:11 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Nov 2023 09:57:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Nov 2023 09:57:11 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A2EvBBA026497;
	Thu, 2 Nov 2023 09:57:11 -0500
Message-ID: <145580b2-dda0-4d36-b046-03f458929922@ti.com>
Date: Thu, 2 Nov 2023 09:57:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH 8/8] recipes-bsp: Do not use
 MACHINE_ARCH when package is not machine specific
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20231025165630.2274889-1-afd@ti.com>
 <20231025165630.2274889-8-afd@ti.com> <20231026032740.GD2408@denix.org>
 <eed601f5-9a84-48c8-80a7-ac03bf48ed72@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <eed601f5-9a84-48c8-80a7-ac03bf48ed72@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 3A2EvBRa001898
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Nov 2023 14:57:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17223



On 10/26/2023 9:00 AM, Andrew Davis wrote:
> On 10/25/23 10:27 PM, Denys Dmytriyenko wrote:
>> On Wed, Oct 25, 2023 at 11:56:30AM -0500, Andrew Davis via=20
>> lists.yoctoproject.org wrote:
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb=
 | 2 --
>>> =C2=A0 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
>>> =C2=A0 meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 -
>>> =C2=A0 meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
>>> =C2=A0 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb=C2=
=A0=C2=A0 | 2 --
>>> =C2=A0 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
>>> =C2=A0 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb=C2=
=A0=C2=A0 | 2 --
>>> =C2=A0 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 --
>>> =C2=A0 meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb=
 | 2 --
>>> =C2=A0 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>>> =C2=A0 meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>>> =C2=A0 11 files changed, 19 deletions(-)
>>
>> Overall I agree and fully support the first 7 patches in this series.
>>
>> But for this last one I wanted to open a discussion.
>>
>=20
> I try to sort my series in least-to-most likely to be controversial, I =
was
> just wondering how far we would get down the list, glad we got to 8 :)
>=20
>> On one hand I understand the desire to make components as generic as=20
>> possible
>> and reduce the number of machine-specific components to a bare minimum.
>>
>> But on another hand, marking the resulting package as machine-specific=
=20
>> when it
>> has a short list of compatible machines is a standard practice. The=20
>> reason is
>> that the list of compatible machines controls only compile time=20
>> filtering, but
>> doesn't have any effect on run time. And marking packages as machine=20
>> specific
>> helps with that. That closes the loophole of installing incompatible=20
>> packages.
>>
>> For example, first recipe below specifies that Cadence MHDP firmware i=
s
>> compatible with 3 J7 platforms only (or their SoC families, to be exac=
t).
>> But w/o marking resulting binary package as machine-specific (therefor=
e
>> producing separate packages for those platforms), there will be a sing=
le
>> generic Aarch64 package made. And there's no protection from installin=
g
>> this generic package on non-compatible platforms, like J7200 or AM65xx=
,
>> either manullay or by pulling it into a rootfs for those incompatible
>> platforms.
>>
>> And you normally want to prevent this for regular components. But I gu=
ess
>> this doesn't fully apply to FW images that are loaded by corresponding
>> drivers anyway. Moreover, there's no compilation involved, just packag=
ing
>> the binary blob.
>>
>> In that case, should we also remove COMPATIBLE_MACHINE from these=20
>> firmware
>> recipes?
>>
>=20
> That is exactly where I was going to go next. These firmware packages a=
re
> not technically incompatible with the other machines.
>=20
> We just use COMPATIBLE_MACHINE checks here to keep us from accidentily=20
> bundling
> them with images where they wouldn't add any value (which you did with=20
> prusw-fw
> which is what stated me thinking on all this). But since they don't bre=
ak
> anything either, forcing them to be machine specific seemed like=20
> overkill also.
>=20
> Only place where we still need this is firmware recipes that only ship=20
> some of
> the firmware based on machine (see prueth-fw for instance). I'd like to=
 get
> that cleaned up next. If we only want some of the firmware then we=20
> should split
> it into different packages (prueth-fw-am57xx, etc.) and only install th=
e=20
> one
> we want for that platform.
>=20
> Andrew


Denys, does Andrew's response address your concerns?



>>
>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb=20
>>> b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
>>> index d88bca6e..ed1c7817 100644
>>> --- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
>>> @@ -10,8 +10,6 @@ PR =3D "${INC_PR}.0"
>>> =C2=A0 COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> =C2=A0 TARGET =3D "mhdp8546.bin"
>>> =C2=A0 do_install() {
>>> diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb=20
>>> b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>>> index 5b1d8be1..ef7bc2ad 100644
>>> --- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>>> @@ -12,8 +12,6 @@ PR =3D "${INC_PR}.1"
>>> =C2=A0 COMPATIBLE_MACHINE =3D "j721s2|j784s4|am62axx"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> =C2=A0 TARGET_WAVE521C =3D "wave521c_codec_fw.bin"
>>> =C2=A0 SOURCE_WAVE521C =3D "wave521c_k3_codec_fw.bin"
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb=20
>>> b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
>>> index 6e2996ce..e333d212 100755
>>> --- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
>>> @@ -4,7 +4,6 @@ LICENSE =3D "TI-TFL"
>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSE.ti;md5=3D04ad0a015d4bb63c2b9e7b112debf3db"
>>> =C2=A0 PV =3D "6.2+git${SRCPV}"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> =C2=A0 inherit update-alternatives
>>> diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb=20
>>> b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
>>> index e58f2d58..ee3a94dc 100644
>>> --- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
>>> @@ -10,8 +10,6 @@ PR =3D "${INC_PR}.0"
>>> =C2=A0 COMPATIBLE_MACHINE =3D "dra7xx"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> =C2=A0 ORIGIN =3D "DRA71x-RevA-GT9271_SpecDig_Config.bin"
>>> =C2=A0 TARGET =3D "goodix_9271_cfg.bin"
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb=20
>>> b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>>> index 2c0736ed..4b6ef75d 100644
>>> --- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>>> @@ -7,8 +7,6 @@ PR =3D "${INC_PR}.0"
>>> =C2=A0 COMPATIBLE_MACHINE =3D "am65xx-evm|am64xx"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> =C2=A0 TARGET =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-sr2-pru0-prueth-fw.elf \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-sr2-pru1-prueth-fw.elf \
>>> diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb=
=20
>>> b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>>> index 8b15ab7f..20b2bfb9 100644
>>> --- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>>> @@ -7,8 +7,6 @@ PR =3D "${INC_PR}.0"
>>> =C2=A0 COMPATIBLE_MACHINE =3D "am65xx"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> =C2=A0 TARGET =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-pru0-prueth-fw.elf \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-pru1-prueth-fw.elf \
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb=20
>>> b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
>>> index ea39d73d..bc731094 100644
>>> --- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
>>> @@ -7,8 +7,6 @@ PR =3D "${INC_PR}.0"
>>> =C2=A0 COMPATIBLE_MACHINE =3D "am65xx-evm|am64xx"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> =C2=A0 TARGET =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-sr2-pru0-pruhsr-fw.elf \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-sr2-pru1-pruhsr-fw.elf \
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb=20
>>> b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>>> index 63c2d311..6e296e7c 100644
>>> --- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>>> @@ -7,8 +7,6 @@ PR =3D "${INC_PR}.0"
>>> =C2=A0 COMPATIBLE_MACHINE =3D "am65xx-evm|am64xx"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> =C2=A0 TARGET =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-sr2-pru0-prusw-fw.elf \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-sr2-pru1-prusw-fw.elf \
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb=20
>>> b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>>> index d295a1c1..74729c16 100644
>>> --- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>>> @@ -9,8 +9,6 @@ PR =3D "${INC_PR}.0"
>>> =C2=A0 COMPATIBLE_MACHINE =3D "j721e"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> =C2=A0 TARGET =3D "pvdec_full_bin.fw"
>>> =C2=A0 do_install() {
>>> diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb=20
>>> b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
>>> index 7d16ae39..4ec09a70 100644
>>> --- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
>>> @@ -3,7 +3,6 @@ LICENSE =3D "TI-TSPA"
>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>> "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=3D=
a59aa54b9470f555cf086b91dca0afa3"
>>> =C2=A0 COMPATIBLE_MACHINE =3D "dra7xx"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> =C2=A0 PR =3D "r1"
>>> diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb=20
>>> b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
>>> index 2452d111..8af49577 100644
>>> --- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
>>> @@ -4,7 +4,6 @@ LICENSE =3D "TI-TSPA"
>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>> "file://COPYING;md5=3Dfd463c9500441ed91d07a0331baa635c"
>>> =C2=A0 COMPATIBLE_MACHINE =3D "dra7xx"
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> =C2=A0 SRC_URI =3D=20
>>> "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03-2012/e=
xports/vpdma-fw_03-2012.tar.gz;protocol=3Dhttp;name=3Ddra7xx-evm"
>>> =C2=A0 SRC_URI[dra7xx-evm.md5sum] =3D "80176df1350c21d9efa90171789c54=
6e"
>>> --=20
>>> 2.39.2

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

