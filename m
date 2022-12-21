Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C540C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 06:48:41 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13172.1671605316912679929
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Dec 2022 22:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fZD2ATt9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BL6maUo101556
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Dec 2022 00:48:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671605316;
	bh=YZf6Buw0lS8beXl3QbE2xHmvu/np21IElm+swwdJ+Qg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=fZD2ATt9ChkoZPhGJtenQB9Pxfjt+wfp6Bo2ymC/3I/m7WlJNHyCNZdNyttJDxoxe
	 Sm72VHlwc972eAHW1t4FAzzJg8KMhBRmjiDHTyW8rB2rtiSPGu1g7O95IoDzS7n5bN
	 B3LTjgYB3g4wGEZGGIsNRz6EIQRMIe2esk2cbiwo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BL6maI3036494
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Dec 2022 00:48:36 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 21
 Dec 2022 00:48:35 -0600
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2507.016; Wed, 21 Dec 2022 00:48:35 -0600
From: "Bhagat, Paresh" <p-bhagat@ti.com>
To: "Gurudasani, Kamlesh" <kamlesh@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>, "Davis, Andrew" <afd@ti.com>,
        "Shilwant, Chirag" <c-shilwant@ti.com>, "Gupta, Gyan" <g-gupta@ti.com>
Subject: RE: [EXTERNAL] Re: [meta-ti][dunfell][PATCH] optee-os: Revert to
 lower log level for AM62x
Thread-Topic: [EXTERNAL] Re: [meta-ti][dunfell][PATCH] optee-os: Revert to
 lower log level for AM62x
Thread-Index: AQHZDHI+7atXNBKgWEiE4L2g+080jq536Wiw
Date: Wed, 21 Dec 2022 06:48:35 +0000
Message-ID: <3d9775b257f44eda957706b09118f847@ti.com>
References: <172F5F8D317AC303.24570@lists.yoctoproject.org>
 <87ilij8xo9.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
In-Reply-To: <87ilij8xo9.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.159.195]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Dec 2022 06:48:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15497

Hi Kamlesh

Tested this patch locally :

https://serenity.dal.design.ti.com/patchwork/project/meta-ti/patch/20221210=
075706.22278-1-kamlesh@ti.com/

Here are the logs:

http://serenity.dal.design.ti.com:7777/vukececewo.yaml

Tested-by: Paresh Bhagat < p-bhagat@ti.com>=20

-----Original Message-----
From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On Be=
half Of Gurudasani, Kamlesh via lists.yoctoproject.org
Sent: Saturday, December 10, 2022 2:04 PM
To: Gurudasani, Kamlesh via lists.yoctoproject.org <kamlesh=3Dti.com@lists.=
yoctoproject.org>; meta-ti@lists.yoctoproject.org; Bajjuri, Praneeth <prane=
eth@ti.com>; Davis, Andrew <afd@ti.com>; Shilwant, Chirag <c-shilwant@ti.co=
m>
Subject: [EXTERNAL] Re: [meta-ti][dunfell][PATCH] optee-os: Revert to lower=
 log level for AM62x

"Gurudasani, Kamlesh via lists.yoctoproject.org"
<kamlesh=3Dti.com@lists.yoctoproject.org> writes:

> While removing SOFTWARE_PRNG support
> commit:98506a4a07363a1b57012ccfaee263f47e5b46c4,
> accidently removed the changes applied by=20
> commit:27641e1f2d7f6696fd7bbd8f24fcac20766b6234
> (optee-os: Lower log level for AM62x).
>
> Reverting those changes back
>
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---

Earlier mail didn't go on the list cause of difference in "from and envelop=
e-sender".

@praneeth, I'm not sure if I should add you reviewed by here directly.

Could see optee log being suppressed, but couldn't test lpm-demo sucessfull=
y, could be because of older kernel/dtb version.

http://serenity.dal.design.ti.com:7777/odokiluwep.yaml

Requesting @chirag to test and give tested-by.
...

