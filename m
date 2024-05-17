Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CE1C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 06:37:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.34545.1715927847230696141
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 May 2024 23:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=QL+LdTPJ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44H6bPQH040965;
	Fri, 17 May 2024 01:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715927845;
	bh=3dQ5MAh7Gp+AlhpJOWT2SNMCk7HsdPkcVufR2KkSICA=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=QL+LdTPJcGeIq4KT+dcXmBMbTVuDFrLtfpkXjibW9SMfvWGQB22VUdVT3lJNDedq3
	 z3pSmfzZbSWrecvf9WCM2w1AeSdXmptW1S8lLqu9UPmzni+IcwnygEFmYJNN6npwzD
	 rlT2DDPaRq5QTLLLhCHNfOfQOyjLsnArq+pM6Lf0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44H6bP99001686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 May 2024 01:37:25 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 May 2024 01:37:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 May 2024 01:37:25 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44H6bNnV027568;
	Fri, 17 May 2024 01:37:24 -0500
Message-ID: <73693327-9fb5-480a-9469-f34ace9a78ec@ti.com>
Date: Fri, 17 May 2024 12:07:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] Has the TI download host changed?
To: <christophercordahi@nanometrics.ca>, <meta-ti@lists.yoctoproject.org>
References: <BAlN.1715902609339619438.uywV@lists.yoctoproject.org>
 <Groupsio.1.BAlN.1715902609339619438.uywV@lists.yoctoproject.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
CC: Gyan Gupta <g-gupta@ti.com>
In-Reply-To: <Groupsio.1.BAlN.1715902609339619438.uywV@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 44H6bPQH040965
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 May 2024 06:37:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17661

Hi,

The mailing list primarily handles patch submissions and reviews related=20
to the meta-ti repository.
For rest all queries, it's recommended to visit https://e2e.ti.com/

Regards,
Chirag

On 17/05/24 07:34, christophercordahi via lists.yoctoproject.org wrote:
> [Edited Message Follows] [Reason: Corrected my link to Dunfell SRC_URL=20
> and asking about other recipes.=E2=80=8A] Apologies if this is the wron=
g place=20
> to ask. I'm asking here because I'm encountering issues fetching the=20
> SRC_URI for the ti-xdctools_3.=E2=80=8A55.=E2=80=8A02.=E2=80=8A22.=E2=80=
=8Abb
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> [Edited Message Follows]
> [Reason: Corrected my link to Dunfell SRC_URL and asking about other re=
cipes.]
>
> Apologies if this is the wrong place to ask.
> I'm asking here because I'm encountering issues fetching the SRC_URI fo=
r the ti-xdctools_3.55.02.22.bb recipe.
>
> I'm using the dunfell branch that may now be EOL
> https://urldefense.com/v3/__https://git.yoctoproject.org/meta-ti/tree/r=
ecipes-ti/devtools/ti-xdctools-core.inc?h=3Ddunfell*n5__;Iw!!G3vK!T-E3osl=
czkM3mpXJlSe86JICKfYYpT1ODSa4pIrSx1GNsmvZykkMzFvHw3QOR3snFV4CWJ0bhhivv5Zx=
Ws-PJMQsxF6NcD4j8Y0a$
> however the same URL is in HEAD
> https://urldefense.com/v3/__https://git.yoctoproject.org/meta-ti/tree/m=
eta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb*n74__;Iw!!G3v=
K!T-E3oslczkM3mpXJlSe86JICKfYYpT1ODSa4pIrSx1GNsmvZykkMzFvHw3QOR3snFV4CWJ0=
bhhivv5ZxWs-PJMQsxF6NcE9VpXWO$
>
> Only 28 M of the necessary 97 M are downloaded using the command
> wget http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent=
/rtsc/3_55_02_22/exports/xdccore/xdctools_3_55_02_22_core_linux.zip
> There=E2=80=99s a notice about redirecting the http request to https, b=
ut the outcome is the same if https is specified.
>
> The TI XDCtools  3_55_02_22 web page links to downloads.ti.com, not sof=
tware-dl.ti.com as used in the recipe.
> https://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/=
3_55_02_22/index_FDS.html
> The file is successfully downloaded from downloads.ti.com using https o=
r http (without redirection to https)
>
> Is this a temporary problem that TI will correct, or should this recipe=
 be updated?
> Will other recipes that download from software-dl.ti.com be affected al=
so?
> This fetch succeeded as recently as May 5.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17660): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17660__;!!G3vK!T-E3oslczkM3mpXJlSe86JIC=
KfYYpT1ODSa4pIrSx1GNsmvZykkMzFvHw3QOR3snFV4CWJ0bhhivv5ZxWs-PJMQsxF6NcKVfm=
8MN$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/106145183/7030289__;!!G3vK!T-E3oslczkM3mpXJlSe86JICKfYYpT1ODSa4pI=
rSx1GNsmvZykkMzFvHw3QOR3snFV4CWJ0bhhivv5ZxWs-PJMQsxF6NcN-VFI2M$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!T-E3oslczkM3mpXJlSe86JICKfYYpT1ODSa4pIrSx1GNsmv=
ZykkMzFvHw3QOR3snFV4CWJ0bhhivv5ZxWs-PJMQsxF6NcIvKhgin$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

