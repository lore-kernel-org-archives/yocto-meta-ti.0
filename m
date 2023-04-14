Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C76C77B71
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 17:01:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.16146.1681491654739505023
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 10:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=qlfaB9Vt;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33EH0rdF000967
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 12:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681491654;
	bh=YfeTAmnBMx4mgvHDenoRysbI8ukpG/pDD6OL6U+AuYE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=qlfaB9Vtkgv/BSg+9oHoJFgU2i2isveRnVnYSKiEll0AsR9XN65UAhFfUW0fP6xoM
	 3T+4/LDpIfimSS3Ok06e65No86sQ4Tk0OJKTav9d+SafAW28WbJFv9iid2HyrNr5rc
	 J6kzBLD1stf3QYYOk94Ym4hIOrFEqljb89Yxlnkg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33EH0r5f019546
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 12:00:53 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 12:00:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 12:00:53 -0500
Received: from [10.250.32.8] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33EH0r9N074766;
	Fri, 14 Apr 2023 12:00:53 -0500
Message-ID: <43d375c0-e5c2-4589-848f-4a5fee6faf44@ti.com>
Date: Fri, 14 Apr 2023 12:00:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti] [PATCH][kirkstone 3/3] graphics: upgrade rogue graphics
 to 23.1.6404501
To: <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230407005932.322037-1-rs@ti.com>
 <1753813C2F0DECF2.3578@lists.yoctoproject.org>
 <1904aa52-b60c-e91c-e6c1-138bf05570ff@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1904aa52-b60c-e91c-e6c1-138bf05570ff@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 33EH0rdF000967
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 17:01:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16401

On 4/14/23 11:13 AM, Randolph Sapp via lists.yoctoproject.org wrote:
> On 4/6/23 19:59, Randolph Sapp via lists.yoctoproject.org wrote:
>> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_=
1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlib=
s_23.1.6404501.bb
>> similarity index 86%
>> rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1=
.18.6276027.bb
>> rename to meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.=
1.6404501.bb
>> index 94d14ded..38d0556b 100644
>> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.62=
76027.bb
>> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.64=
04501.bb
>> @@ -10,9 +10,9 @@ COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
>> =C2=A0 PR =3D "r2"
>> -BRANCH =3D "linuxws/kirkstone/k5.10/${PV}"
>> -SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;pr=
otocol=3Dhttps;branch=3D${BRANCH}"
>> -SRCREV =3D "51e598919641d51156a631efa5447124a3c0f543"
>> +BRANCH =3D "linuxws/kirkstone/k6.1/${PV}"
>> +SRC_URI =3D"git://git@bitbucket.itg.ti.com/graphics/8xe-ddk-rogue_uml=
ibs.git;protocol=3Dssh;branch=3D${BRANCH}"
>> +SRCREV =3D "49958a8e820a321d22ac3c635bd21d4a3118c006"
>> =C2=A0 S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PV=
R_BUILD}"
>> =C2=A0 TARGET_PRODUCT:j721e =3D "j721e_linux"
>=20
> Rats, accidentally committed the SRC_URI of the test repo. Fixed in v2.
>=20

An easy way to prevent this in the future, and make your life easier, is =
to just
make an .bbappend with changes for local testing. Or even better, have de=
vtool
do that for you. It can even have the append file point to a local checke=
d
out repo, so you don't need to have a remote test repo at all.

Andrew

