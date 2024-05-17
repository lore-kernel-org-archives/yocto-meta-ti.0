Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEB0C25B79
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 13:52:35 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.40656.1715953945292398658
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 May 2024 06:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=IEmwmC7T;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44HDqOc2066356;
	Fri, 17 May 2024 08:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715953944;
	bh=EZichLzPXuJ+SEkEoxTOU8FzVlXSk02G1vMPPQeTcOM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=IEmwmC7T86lST3aMqcqcyRTGw8xPK6uqLRpIO1pt/DOgqfZ8sjynr0aFmAXf0hKzI
	 kfREQYIP5vGsAZ71wFBVGoPMBkqqpehti/2q3ENG+YZw+1aEg8yAatnYIvAB4A7V7J
	 CwFeVlLl70gxMYUT62VhSIVB41wX2GvrFLZQ2VcU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44HDqOMu030254
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 May 2024 08:52:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 May 2024 08:52:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 May 2024 08:52:24 -0500
Received: from [10.249.33.153] ([10.249.33.153])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44HDqOov039736;
	Fri, 17 May 2024 08:52:24 -0500
Message-ID: <2815c4bb-51d2-42c5-8bfd-0f88bd1ce73f@ti.com>
Date: Fri, 17 May 2024 08:52:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] Has the TI download host changed?
To: <christophercordahi@nanometrics.ca>, <meta-ti@lists.yoctoproject.org>
References: <BAlN.1715902609339619438.uywV@lists.yoctoproject.org>
 <Groupsio.1.BAlN.1715902609339619438.uywV@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <Groupsio.1.BAlN.1715902609339619438.uywV@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 44HDqOc2066356
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 May 2024 13:52:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17662



On 5/16/2024 9:04 PM, christophercordahi via lists.yoctoproject.org wrote=
:
>=20
> Only 28 M of the necessary 97 M are downloaded using the command
> wget http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent=
/rtsc/3_55_02_22/exports/xdccore/xdctools_3_55_02_22_core_linux.zip
> There=E2=80=99s a notice about redirecting the http request to https, b=
ut the outcome is the same if https is specified.

I used the above link and was able to download the whole 97M file.  I=20
tried both at work and at home.  I'm not sure what issue you are facing.=20
  Perhaps it was a temporary server issue that has since been resolved?




--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

