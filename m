Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039DEC00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 17:54:35 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9920.1658858071062299533
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 10:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=wfGMtJee;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QHrsNN036020;
	Tue, 26 Jul 2022 12:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658858034;
	bh=BG2OQt+V2fD4Q/5X3WFsNk/pqrG/zz0PNoKmqttN5Io=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wfGMtJee7e39X4nVhaLdeuiR96sFAHmd4D0dk767LcUlpAHBhvqmWMihtf8r+/xKX
	 VA760lyF5BwO8nQ+99/Hkl6ovH0H5+k8n1HM6ONVvTln4KNEXlmEOekgfbb1qgLPQh
	 fRcGdUoW60Kv00CtHF78xNx57gHztmjNsbdeptFw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QHrsdJ035759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 12:53:54 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 12:53:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 12:53:54 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QHrrsF076774;
	Tue, 26 Jul 2022 12:53:54 -0500
Message-ID: <0a6134c6-fc9b-7923-a9c6-e8cdd942962d@ti.com>
Date: Tue, 26 Jul 2022 12:53:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [kirkstone/master PATCH v2] k3conf: update SRCREV to add j721S2
 support
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Bryan Brattlof <bb@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>
References: <20220719203840.29751-1-bb@ti.com>
 <6095fc89-1fc4-6937-61cb-b053537d39c7@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <6095fc89-1fc4-6937-61cb-b053537d39c7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id
 26QHrsNN036020
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Jul 2022 17:54:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14911


Denys is keeping master in sync with dunfell.  He will doing a sync up so=
on.



On 7/26/2022 11:03, Bajjuri, Praneeth wrote:
>=20
>=20
> On 7/19/2022 3:38 PM, Bryan Brattlof wrote:
>> update the SHA for k3conf to pickup j721s2 support
>>
>> Signed-off-by: Bryan Brattlof <bb@ti.com>
>> ---
>> Changes from v1:
>> =C2=A0 - send a separate patch for each branch to avoid merge conflict=
s
>=20
> Ryan, i dont see this patch in master/kirkstone.
>=20
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-devtools/=
k3conf/k3conf_git.bb?h=3Dkirkstone#n11=20
>=20
>=20
>=20
>> =C2=A0 - include the mailing list in the email :(
>>
>> =C2=A0 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb=20
>> b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
>> index 3f542da4aa96e..567e8d55b51ba 100644
>> --- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
>> +++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
>> @@ -8,7 +8,7 @@ PV =3D "0.2+git${SRCPV}"
>> =C2=A0 COMPATIBLE_MACHINE =3D "k3"
>> =C2=A0 BRANCH ?=3D "master"
>> -SRCREV =3D "966a5695b73bc53039ca60d196b77de0640088d4"
>> +SRCREV =3D "48cb8e8d7dc962229a9f318cd512b4ddeec5cdc5"
>> =C2=A0 SRC_URI =3D=20
>> "git://git.ti.com/k3conf/k3conf.git;protocol=3Dgit;branch=3D${BRANCH}"

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

