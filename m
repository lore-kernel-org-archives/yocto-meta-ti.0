Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84C2E728C6
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 16:15:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.21878.1696004137764477268
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 09:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=d1JukTMb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38TGFacY023929;
	Fri, 29 Sep 2023 11:15:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696004136;
	bh=ZYbQCnFGao7OiumWASg1rc+nnb7vfYE59bh5ESPduXU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d1JukTMbS7WqDRy/vKVhi4QJFeyhxIGvsUn7BTvljykanEdkFgXu7BBqO6Z7qSnyk
	 xSE3JATIEt+rzCFtnPH1yfd4PY5LdPe/KSqd4+tIbik5kLiwAqZqzqt6Mua6joN5aE
	 0LeJ9T8cjQVnVyYMrt6TqtLKDqMp6puqnl9U5Mnc=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38TGFauT107278
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 29 Sep 2023 11:15:36 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 29
 Sep 2023 11:15:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 29 Sep 2023 11:15:36 -0500
Received: from [10.250.34.24] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38TGFZuD094568;
	Fri, 29 Sep 2023 11:15:36 -0500
Message-ID: <62a04ee3-dcf7-4d6b-b5cc-6637ae23871b@ti.com>
Date: Fri, 29 Sep 2023 11:15:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][PATCH v2] ti-img-rogue-umlibs: harden handling of
 usrmerge
Content-Language: en-US
To: Max Krummenacher <max.oss.09@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: Max Krummenacher <max.krummenacher@toradex.com>
References: <20230906150551.2362062-1-max.oss.09@gmail.com>
 <178969A6B3E88B51.9230@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <178969A6B3E88B51.9230@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 38TGFacY023929
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 29 Sep 2023 16:15:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17037



On 9/29/2023 10:54 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 9/6/2023 10:05 AM, Max Krummenacher wrote:
>> From: Max Krummenacher <max.krummenacher@toradex.com>
>>
>> Only move directories which haven't already been moved.
>> This prevents a build error should a subsequent bitbake execution
>> rerun do_install where the sources to 'mv' no longer exist.
>> | mv: cannot stat=20
>> 'ti-img-rogue-umlibs/23.1.6404501/git/targetfs/am62_linux/lws-generic/=
release/lib/firmware': No such file or directory
>>
>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> ---
>> =C2=A0 .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +++-
>> =C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1=
.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-um=
libs_23.1.6404501.bb
>> index 9b45a91f..2cf13c60 100644
>> ---=20
>> a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1=
.6404501.bb
>> +++=20
>> b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1=
.6404501.bb
>> @@ -68,7 +68,9 @@ do_install:prepend() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURE=
S', 'usrmerge', 'true',=20
>> 'false', d)}; then
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv ${S}/lib/firmware ${S}$=
{nonarch_base_libdir}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e ${S}/lib/firmware =
]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=
 ${S}/lib/firmware ${S}${nonarch_base_libdir}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>=20
> Sorry it has taken so long to get back to this.=C2=A0 Busy times over h=
ere.
>=20
> I think the better plan is to not move the directory, but use some othe=
r=20
> command to copy the files.=C2=A0 That way there should be no need to pu=
t a=20
> guard around the command.=C2=A0 I'll work the Randoplh to get this upda=
ted=20
> the correct way.
>=20
> Thank you for pointing out the issue.

Spoke with Randolph and he agrees with you that this patch is good=20
enough.  I will apply it and test now.



>=20
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # clean up any empty directories
>>
>>
>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17036): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17036
> Mute This Topic: https://lists.yoctoproject.org/mt/101194647/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/65=
51054/1815494134/xyzzy [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

