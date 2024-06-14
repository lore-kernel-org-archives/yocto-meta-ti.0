Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251BFC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 06:28:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.5338.1718346481066573245
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 23:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=T8NbRZTP;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45E6RvDk083704;
	Fri, 14 Jun 2024 01:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718346477;
	bh=d3iACWsUZ0lVhZfE6gfCh0PiVmWUuwqsXdgPc85yXSw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=T8NbRZTPzFJDbalBkCoTWHrZPN5OqINUKfTNzBHhsB06wt/FBtOXHbpj7dBmfaU08
	 3z7j7hpdsNsTr7NdYFWH6WHkxHeVhonJATiGPNeZUTHy9CU08/eU3WBm1YvOD0QyyR
	 geufUFsTNS0HfpXZxchNiD+A1Y7bnUD44cXt+1pE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45E6Rvb0032267
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Jun 2024 01:27:57 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Jun 2024 01:27:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Jun 2024 01:27:57 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45E6RsWc054060;
	Fri, 14 Jun 2024 01:27:55 -0500
Message-ID: <be84e329-583a-49c5-9148-613e26d60763@ti.com>
Date: Fri, 14 Jun 2024 11:57:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti] [master/scarthgap][PATCH 1/4]
 conf/machine, ti-bsp: add support for multiple BSP providers
To: <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
        <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri
	<praneeth@ti.com>
References: <20240613172254.770920-1-denis@denix.org>
 <f74e3a99-3dbc-4a68-b4b8-a5f77f6e149a@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <f74e3a99-3dbc-4a68-b4b8-a5f77f6e149a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 45E6RvDk083704
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 06:28:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17729

Hi,

On 14/06/24 02:48, Ryan Eatmon via lists.yoctoproject.org wrote:
> On 6/13/2024 12:=E2=80=8A22 PM, Denys Dmytriyenko wrote: > From: Denys=20
> Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom> > > This adds a faci=
lity to define=20
> multiple supported BSPs with their own > preferences for individual=20
> components, as well as lets
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> On 6/13/2024 12:22 PM, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@konsulko.com>
> >=20
> > This adds a facility to define multiple supported BSPs with their own
> > preferences for individual components, as well as lets machine config=
s
> > specify conditional configurations for different BSPs.
> >=20
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>
>
>
> > diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bs=
p/conf/machine/include/ti-bsp.inc
> > new file mode 100644
> > index 00000000..3bb94a7f
> > --- /dev/null
> > +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> > @@ -0,0 +1,109 @@
> > +# Support multiple BSP providers
> > +# The main input is TI_DEFAULT_BSP, which translates into default
> > +# preferences for kernel, bootloader and graphics components, as
> > +# well as a dedicated machine override.
> > +
> > +# Supported options are: mainline, ti-6_6, ti-6_1, bb_org
> > +TI_DEFAULT_BSP ??=3D "ti-6_6"
>
> Should this variable be named TI_DEFAULT_BSP?  That implies that this i=
s
> the value of the default for this feature.  But in reality this variabl=
e
> is what chooses the TI BSP version.  Should it be something like
> TI_BSP_VERSION instead?



Yeah, I agree with Ryan. TI_BSP_VERSION or evenTI_DEFAULT_BSP_VERSION=20
sounds more appropriate.

Regards,
Chirag



>
>
>
> --=20
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17726): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17726__;!!G3vK!U20F4gdpOgKdlGIbMEeQpRYg=
CKi78PnQ6YHMrbGMH1hlJTtzu_lGfmzbJo65qk3jLSUv9WYdTMcNDNNnyKMh2-VE1HTlFHCXi=
w$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/106655975/7030289__;!!G3vK!U20F4gdpOgKdlGIbMEeQpRYgCKi78PnQ6YHMrb=
GMH1hlJTtzu_lGfmzbJo65qk3jLSUv9WYdTMcNDNNnyKMh2-VE1HQhq36_xA$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!U20F4gdpOgKdlGIbMEeQpRYgCKi78PnQ6YHMrbGMH1hlJTt=
zu_lGfmzbJo65qk3jLSUv9WYdTMcNDNNnyKMh2-VE1HSRPq9VLw$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

