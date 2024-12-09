Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9E0E77173
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 09:39:11 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.97128.1733737144053393158
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 01:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=leeoF+nX;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=iceo8hWY;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733737144; x=1765273144;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Sj52wBWXdXiqEqvzGeXCF9fem6OAHCJnN7HpbPrxYhM=;
  b=leeoF+nXf2fUmEfrPs+KgJoZ1R8L1aFptYz0nepo76V0U8GktgTxofgf
   nmcWa5B45AgZtlwaFSywmutuB4cJSkTn53obmS2Q2On5A0KKX67DKInn1
   24luwFBSLnkrBBY81aslKKSQEoxj6joikx3IyZ9G0aRFoHExDsUk8asc0
   dRucOYo4MHwGCNz7bh+fo8AkPUM9YkzOQoMQegxZZDxHIZ80IHWoEdewH
   2NVcjzNzwgd048mUIRQvFWBzCTf9XcUvERBaUKxz5BMiXzz7ceDunXIiu
   QBzrZ4I/4OQd5IUEGPhFdiEl7Fpfbc++/22GZOoEniXkQxxewIRe1QdX7
   w==;
X-CSE-ConnectionGUID: ESil+GASTWulYNKWeqBL7w==
X-CSE-MsgGUID: Q/e4Y5nwTpeN/KK52cRCQg==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40480941"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 10:39:01 +0100
X-CheckPoint: {6756BAB5-42-1E10F2A5-CC0651E5}
X-MAIL-CPID: 57171B3F5FD86AE49B9A3306167414F3_4
X-Control-Analysis: str=0001.0A682F20.6756BAB6.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 108C016502D;
	Mon,  9 Dec 2024 10:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733737137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sj52wBWXdXiqEqvzGeXCF9fem6OAHCJnN7HpbPrxYhM=;
	b=iceo8hWYbKeAyUJkraV2adqy4kSX4+wbLCwdorhJEa+CoFvje53YaaeKsZ6OXIVDiAKgjj
	PIxFNP/dlGN0uZbF0UEBRqiw+RvgVV5AqvqujCSJN60KVGsK0omiLwNn3C73wITETeV/X/
	8Bm23IwW4X7X0SL8aewcM2XzMza5z9U7/52Pu2JLKf1fwjcErDGfjGH7bDAZbSQavT+1SI
	1nQ6hB0MHYlgLglgbrrIZdT4eBBux9ZjSYn8j9BxXSvO4M78oEciyE9RwyJC2/3YtDAg2q
	FvKDVPMExVmrxKHEsoehlhK1fwkcjr4GoffX3LI8AShArBBDpK2880gwvqEK7g==
Message-ID: <806ad6edd0e2359aeabb6d4e41795b91b0b2023c.camel@ew.tq-group.com>
Subject: Re: [master][PATCH] conf: machine: k3: use ARMv8-A as base arch
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: oss@ew.tq-group.com
Date: Mon, 09 Dec 2024 10:38:56 +0100
In-Reply-To: <20241114140801.1964528-1-matthias.schiffer@ew.tq-group.com>
References: <20241114140801.1964528-1-matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Dec 2024 09:39:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18094

On Thu, 2024-11-14 at 15:08 +0100, Matthias Schiffer wrote:
> All K3 SoCs are Cortex-A53/A72, so arch-armv8a.inc is a more appropriate
> common base than the very generic arch-arm64.inc. arch-armv8a.inc default=
s
> to enable the CRC extension (DEFAULTTUNE =3D "armv8a-crc") and allows for
> easy addition of the ARMv8 crypto extensions by setting the tune to
> "armv8a-crc-crypto".

Hi, any comments regarding this patch?

Best regards,
Matthias



>=20
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
> index a296f64f..140564f7 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -3,7 +3,7 @@
>  require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append =3D ":k3"
> =20
> -require conf/machine/include/arm/arch-arm64.inc
> +require conf/machine/include/arm/arch-armv8a.inc
> =20
>  require conf/machine/include/ti-bsp.inc
> =20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

