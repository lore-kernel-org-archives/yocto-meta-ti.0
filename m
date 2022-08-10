Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23527C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 16:00:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.86.1660147237208794081
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 09:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=ZFh+iteI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27AG0ZTR111041;
	Wed, 10 Aug 2022 11:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660147235;
	bh=jnritI/1jQohcvAjkDIfg47LR8BGUXehGcCCDgMNJa0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ZFh+iteIgkrKlFFEUYwgPK7HAKVKkeZ5w56v6nlJTcUxSG8flgV1FkzkaG1AszpM4
	 SrOsKhdtjwstCrRC1qvXL8i8b7YD1Vky0BDSiYn1taZ9lYU5+n+Wx1XbkNhz2GFw/r
	 8+UgOFFC/ObxOg1SFBNcLJmvFk/ztULrWN0G5VnU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27AG0ZvX104564
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Aug 2022 11:00:35 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 10
 Aug 2022 11:00:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 10 Aug 2022 11:00:35 -0500
Received: from [10.250.34.173] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27AG0Zr6009248;
	Wed, 10 Aug 2022 11:00:35 -0500
Message-ID: <88910a44-8681-5c1a-efac-9fa7d118eb8c@ti.com>
Date: Wed, 10 Aug 2022 11:00:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH 1/2] ti-sci-fw: Allow build to continue
 without TI_SECURE_DEV_PKG set
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220810144708.14171-1-afd@ti.com>
 <e01176e5-f142-b877-e8e1-8476a25b9be5@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <e01176e5-f142-b877-e8e1-8476a25b9be5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id
 27AG0ZTR111041
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Aug 2022 16:00:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14943

On 8/10/22 10:58 AM, Ryan Eatmon wrote:
>=20
>=20
> On 8/10/2022 9:47, Andrew Davis wrote:
>> If we do not have TI_SECURE_DEV_PKG set then SYSFW generation will fai=
l
>> if we are building for the HS platform. When TI_SECURE_DEV_PKG is not
>> set we assume the builder is only interested in the GP boards, so fake
>> generating the HS SYSFW images. These will be non-functional on HS
>> boards, but they would have been just as non-functional if built
>> without TI_SECURE_DEV_PKG set.
>=20
>=20
> Have you tested what happens if they do not have it set and build the "=
dummy" files, and then realize their mistake, set the variable and build =
again?=C2=A0 Do the files then build correctly, or does the sstate cache =
prevent them from getting the correct thing without clearing the cache an=
d rebuilding everything?
>=20
>=20

Yes, changing the value of the TI_SECURE_DEV_PKG causes all packages that=
 use
it to get rebuilt. I was surprised bitbake was smart enough to do that bu=
t seems
like it is.

Andrew

