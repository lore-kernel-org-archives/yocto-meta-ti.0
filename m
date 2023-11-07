Return-Path: <vibhore@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80B3C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 09:53:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6789.1699350773403582857
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 01:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ltAGblTF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vibhore@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A79qphf123283;
	Tue, 7 Nov 2023 03:52:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699350771;
	bh=I/r8n5v3dJljnTJEIVc+irFOfxdSZszdTOGy/SpZLI0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ltAGblTFuuz7IqxgffAjhIkEET7syuHMyBWM2UIIMfzEk7UiqowYLagnstDnzzduO
	 dbbH0nDMj2WVt08jqmN1EsrALEfVu+erSfPqyS/AaQ7JelMVTMU2yRZVFX9wV5tpXT
	 LfeUsBdpGce2xmQ+j1wTn7gwKU8qy9WeK//e+LYw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A79qpMS032463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 03:52:51 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 03:52:51 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 03:52:51 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A79qos4074339;
	Tue, 7 Nov 2023 03:52:50 -0600
Date: Tue, 7 Nov 2023 15:22:49 +0530
From: Vibhore Vardhan <vibhore@ti.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>, <vigneshr@ti.com>,
        <u-kumar1@ti.com>, <afd@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <vishalm@ti.com>
Subject: Re: [PATCH] optee-os: Enable OP-TEE TRNG in AM62X
Message-ID: <20231107095249.u3j5ncwrg2egczal@ult0866455>
References: <20231106-enable-trng-v1-1-59cb0b4f9bcb@ti.com>
 <b4ec0bc6-7f32-4ae2-bac2-e3339557ecaf@ti.com>
 <871qd2t1wu.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <871qd2t1wu.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 09:53:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17251

On 13:45-20231107, Kamlesh Gurudasani wrote:
Hi Kamlesh,

> "Bajjuri, Praneeth" <praneeth@ti.com> writes:
> 
> ...
> >> ---
> >>   meta-ti-bsp/recipes-security/optee/optee-os-ti.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> >> index 91b66a36..d1c15cb2 100644
> >> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> >> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> >> @@ -6,7 +6,7 @@ inherit ti-secdev
> >>   
> >>   EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
> >>   
> >> -EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> >> +EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
> >>   EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> >
> > How about doing the same for am62p ?
> @vibhore, Considering instabilities with AM62a, let me know if I should
> enable it for AM62p. Will send v2 accordingly.

As discussed offline, the instabilities we are seeing on AM62a are only
after a Deep Sleep cycle. The system is stable unless LPM is tried.
Also, AM62p does not have Deep Sleep support. So, I do not have any
objections to having TRNG support enabled for AM62p.

Regards,
Vibhore

