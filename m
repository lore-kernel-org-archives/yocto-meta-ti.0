Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0A7C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 21:49:10 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.16.1674856140011644546
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 13:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=d6SuTiFt;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30RLmx8G018887
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 15:48:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674856139;
	bh=/L8LqzoGb1RuaWd0Nd5dIK8uYP8aPPdd9XdkeY3yny4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d6SuTiFt0A1EJQ5cXfba7reEshQftzmllmUCzh0N7JEyKfo0fnCcVATUG/NLDJAkQ
	 rVz4KCEtpvCPWax6unpbtOONqBNccAyYeQZRPlgqu7uOwUdVEp7FGdOZbYz5HjA6N+
	 hUHzsI2BT9otwYeom1eg5NRa8vvz+5DzymeXvZx8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30RLmxF8016540
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 15:48:59 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 27
 Jan 2023 15:48:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 27 Jan 2023 15:48:58 -0600
Received: from [10.250.36.129] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30RLmw9e086714;
	Fri, 27 Jan 2023 15:48:58 -0600
Message-ID: <eb4f4eaf-9e37-969c-c4aa-0c583d146f65@ti.com>
Date: Fri, 27 Jan 2023 15:48:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] meta-ti-extras: ti-unpack: Drop update_data call
Content-Language: en-US
To: "Sapp, Randolph" <rs@ti.com>
CC: <denys@ti.com>, <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230127180217.1760815-1-rs@ti.com>
 <b0f1c107-cc8f-9ec1-d6fa-6b8dda3402a3@ti.com> <Q2Z5PR.AUJI9LV2CCA42@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <Q2Z5PR.AUJI9LV2CCA42@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 30RLmx8G018887
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 21:49:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15694



On 1/27/2023 15:44, Sapp, Randolph wrote:
> On Fri, Jan 27 2023 at 12:12:55 PM -0600, Ryan Eatmon <reatmon@ti.com>=20
> wrote:
>> This change was already made on the master branch back in November to=20
>> address this issue.=C2=A0 Are you seeing this on other branches?=C2=A0=
 I do not=20
>> believe that this patch needs to be applied to dunfell or kirkstone=20
>> unless you are seeing an issue.
>=20
> I saw this issue under kirkstone with the latest version of my GPU patc=
h=20
> for meta-ti and meta-arago.

They must have back ported it.

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

