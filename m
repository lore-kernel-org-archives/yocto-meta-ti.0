Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D68FCCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 04:00:07 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4070.1762488004184364406
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 20:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NO85wdJU;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: res.sapp@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-651cda151f0so150815eaf.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 06 Nov 2025 20:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762488003; x=1763092803; darn=lists.yoctoproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GweB1FVChkhCGRucyXi2vFwqYcC8nHEXqrjXWf4zn+g=;
        b=NO85wdJUIq8VjW09M1WmklAgSs8dDQU/3iqWt5QZWn2ClEOp9l1R/NW/YjoN8Ojllb
         ew88JgzDNLZU2qLKrqC5G+walBTpcXzwPOHn/shyIDwhNC/sKPeHt5RfYaOSejio0Be3
         W5AvsKT91RITuOiD6JZ1hPRWRHoUQX9sPM8DIJMSutsSdNn9ai/YUqN+jGQ8Sg6M0WdC
         SzEnfqggC5g4ALGYk5Q4h5ZO1wCs6DX/Rerg4pljCyMTQ0RHMvTQrXGB4txIAEpvynzj
         oyMqMxeYZOVDkti1C+DpJrqhBQX3RSekn8X2tnO8dAaAk3bEjlgPXbDcgQ4EbzZ3NQ/c
         JI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762488003; x=1763092803;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GweB1FVChkhCGRucyXi2vFwqYcC8nHEXqrjXWf4zn+g=;
        b=Uze6Afkwfk1VxKCWBjbKK0CyAVumB5uinEyaw8Ehqg5w4D0RH/hlFGdCaiqUbU5Aay
         /0rKkdCC1rPSQtT5pZISpVAgyX6JX/hYQJoFQDoT4tEdYv4b6rPH2zoWjU30LHq70zg9
         LOlOcj34xWG/dfcmzDnDnFTt0cVcOKsiplqndZ78w9tV3OPKVvd0RBLP9MeXmgwPOCPk
         snt7jjsue/4zHnF6l0Se5P7p1X9pO5cw5Z0/+hnRCZ/dPBAq7eJ4nLeC2jDBrpXFDiJf
         /3hTWbbu49lsa2WCuPZgk1NfoU9fhKoOZuO31czLlWBRVUy2VU1gFxiDtb09fUsyWCfK
         9EdA==
X-Forwarded-Encrypted: i=1; AJvYcCVyCMmO+PW3gzeBy43kXG2D4Mv/pJ1N0+fpjgcEvH/rCn27UqRO+GBQXgPFbPajblWllbBVQLTQ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YywVfOUMQr7AIoKpiRAc1hQ6DptUe8JPanB0BxLJR1k5Iq9W8NS
	6jyjy1A0DTB5Sr+H1bMTr0iMROFd0oopm5s1buU134236atWZ+5rsqSU
X-Gm-Gg: ASbGnctJXV+8crMflgqvk28rWVbAQp1GlhzJd0GHRaYfjUiu4aXfSIS3L1vvN9FgBia
	7eitMcsmU3J9x8BG3O8bOzXS42/NyFYVKB8ZGvBSEU1IHOt/+d41t6XSBYbxJkYXk6VmJVb5/wq
	gaQnuQqztmFHyyeWBrOp/mUB8XonlYB1JIkrQpoG5SN8vCfPzTO8uV/NBf9Ur0WflJkkSDr2ips
	kwlRmCkrMDO2pUnb0dybSuu0ax1uCY9B5RiFhsHpHwpiU01DTYxgHK+pin0mWFCe1hr5n2IT3rC
	qPnJn+FRnrITR260O46WvhiQ1Voq8H3k3S+QkjftqrWNZWeHUbCy64n/z3tZroMGz9qQ+X/PJju
	95lclBkpOzHDuCiDEQRDJs3sdaCYKlp0V94kKJNq8i0OvRKhg6DtwbnwXD2YVLDLk7fiRtR8Q2j
	fVOghcOg==
X-Google-Smtp-Source: AGHT+IHYFQWNe9Yp/AUMH3eE68cdjOBpvve3x9VIir08N1b/VjUM2zoa1/MKQJ9Jid8kJjzdsS8mSg==
X-Received: by 2002:a05:6808:2e46:b0:450:5f:7941 with SMTP id 5614622812f47-45015f5d4b0mr1014966b6e.61.1762488002868;
        Thu, 06 Nov 2025 20:00:02 -0800 (PST)
Received: from localhost ([99.150.150.17])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-656c57ec231sm1671252eaf.17.2025.11.06.20.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 20:00:02 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Nov 2025 22:00:02 -0600
Message-Id: <DE25UQGWIZQL.1QAOVGFZ9KHIE@gmail.com>
Cc: <rs@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>,
 <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap/master][PATCH] layer: add github MIRRORS
 definitions
From: "Res Sapp" <res.sapp@gmail.com>
To: "Denys Dmytriyenko" <denis@denix.org>, "Res Sapp" <res.sapp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251107010115.1974047-2-rs@ti.com>
 <20251107012234.GQ3125@denix.org> <DE24KCGE6W2I.2SEIT58IEUNC9@gmail.com>
 <20251107031749.GR3125@denix.org>
In-Reply-To: <20251107031749.GR3125@denix.org>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Nov 2025 04:00:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19238

On Thu Nov 6, 2025 at 9:17 PM CST, Denys Dmytriyenko wrote:
> On Thu, Nov 06, 2025 at 08:59:26PM -0600, Res Sapp wrote:
>> On Thu Nov 6, 2025 at 7:22 PM CST, Denys Dmytriyenko via lists.yoctoproj=
ect.org wrote:
>> > I wonder how that will affect the signatures for the YP Compat... [Not=
 even=20
>> > talking about evil github reliance...]
>> >
>> >
>> > On Thu, Nov 06, 2025 at 07:01:16PM -0600, rs@ti.com wrote:
>> >> From: Randolph Sapp <rs@ti.com>
>> >>=20
>> >> We have some projects mirrored to GitHub currently. It makes sense to
>> >> add a MIRRORS entry for git.ti.com sources to fall back on in the eve=
nt
>> >> git.ti.com is unreachable.
>> >>=20
>> >> Placing this in the main BSP layer configuration file should be all t=
hat
>> >> is required for this and any other layers that depend this core layer=
 to
>> >> fall back to GitHub.
>> >>=20
>> >> Signed-off-by: Randolph Sapp <rs@ti.com>
>> >> ---
>> >>=20
>> >> Tested locally by making git.ti.com ns lookups return NXDOMAIN and th=
en
>> >> requesting to fetch linux-ti-staging.
>> >>=20
>> >>  meta-ti-bsp/conf/layer.conf | 5 +++++
>> >>  1 file changed, 5 insertions(+)
>> >>=20
>> >> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.con=
f
>> >> index e3a28628..d87d040b 100644
>> >> --- a/meta-ti-bsp/conf/layer.conf
>> >> +++ b/meta-ti-bsp/conf/layer.conf
>> >> @@ -36,3 +36,8 @@ TI_COMMON_DEPLOY ?=3D "${TOPDIR}/deploy-ti"
>> >>  DEPLOY_DIR_IMAGE:ti-soc =3D "${TI_COMMON_DEPLOY}/images/${MACHINE}"
>> >>  SDK_DEPLOY:ti-soc =3D "${TI_COMMON_DEPLOY}/sdk"
>> >>  PSEUDO_IGNORE_PATHS:append:ti-soc =3D ",${TI_COMMON_DEPLOY}"
>> >> +
>> >> +MIRRORS +=3D " \
>> >> +    git://git.ti.com/.* git://github.com/TexasInstruments/BASENAME;p=
rotocol=3Dhttps \
>> >> +    gitsm://git.ti.com/.* gitsm://github.com/TexasInstruments/BASENA=
ME;protocol=3Dhttps \
>> >> +"
>> >> --=20
>> >> 2.51.1
>>=20
>> I hate M$ as much as anyone else, but reliable infrastructure as a *fall=
back* is
>> still useful. As far as signatures go, you guys have been doing this in
>> meta-arago with the arago distro since 2019.
>
> Yes, meta-arago is not yet fully YP Compat yet - we are still figuring it=
 out.

Fair enough. I think this should be allowed. Other layers adjust MIRRORS in
specific recipes, but this variable still ends up being globally referenced=
.

If necessary I can request oe-core append a DISTRO_MIRRORS/LAYER_MIRRORS se=
ction
to the mirrors.bbclass. Would be a little cleaner I suppose.

