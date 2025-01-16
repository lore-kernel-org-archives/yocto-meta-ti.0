Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2482C02187
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 14:19:40 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.49973.1737037176223781326
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 06:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=UkwVZS0M;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=SZmzDT9h;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737037176; x=1768573176;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7ta+i+pO6+IgfesolqJ/BOc6KIwbptt+eH+fPJ5rwbs=;
  b=UkwVZS0MDxzS7eha2tD2+yLz+ekaddTUqOMsx15wNxfaYYSrhos1vCGO
   4Hxm8s/WHcPZHzprpsU3yM8Ba87FYLsoM6LruYzfvSbwRCvpw0YuJJYNP
   0pUsZ4U20cC96oFJtdzUxx6VQlknmP3ndUPqK9XTMGCXTCzGhsR9vtG04
   Mb/VuMPtdiGlHfz9PZsvBw0evvGrioYbBZxIAIdZrDTZHgsi2IzM7Hpbp
   ItW0CLjWfwlvRFO+2cbu/+/Uwa05vcWtDYv42GVF/niwq8NQ4zTyGuvQK
   54KRxhbgp7/PjozHre7cEIjDD7g+R2W4mlCV4wY2ordnTpMqXKYpKWXyi
   w==;
X-CSE-ConnectionGUID: mHIzexOUR+KkoNR768TBlw==
X-CSE-MsgGUID: k9AVtwwRQT6Mhb+wcsZIHA==
X-IronPort-AV: E=Sophos;i="6.13,209,1732575600"; 
   d="scan'208";a="41122036"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Jan 2025 15:19:34 +0100
X-CheckPoint: {67891576-1F-31397509-E321C4C4}
X-MAIL-CPID: 632634EE5EF029165DAFB823276718D4_0
X-Control-Analysis: str=0001.0A682F1E.67891576.009F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AEB616C5CF;
	Thu, 16 Jan 2025 15:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737037170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ta+i+pO6+IgfesolqJ/BOc6KIwbptt+eH+fPJ5rwbs=;
	b=SZmzDT9hRzrP5cKxl7dSLKuLlSRmSwdBuw+cEHfJOz5V8cmBPdiRQ8SoHeA/WA8mnTnJEc
	vY9VFmesXzNUasA6xSpjtYRioqaLbdtu7zG2Z1GojLkXykjZd+AlqyAiuJAR4WCE0MlJCw
	De7f5Wov7APMC8RiL3aZ222dliqVIUhZCviYwu9GQg3ZQNtdfpPZ8V6U6UTWgKGS758Gxi
	eVehQ7pQ/pVr9VZytYr28fNLOGyGLFFYs8Q7/vWMVhd6W68LsWqNjO9QWGCnp3YsqihH8f
	pNaw+ph4cNleAVsUcnDj7gAl+yrMzCP1IO7L5JctseFVr1R/Z77Ur9s0BMHkVw==
Message-ID: <6ba39e5a31a0d58810967646b7b3c3bb6d576232.camel@ew.tq-group.com>
Subject: Re: [meta-ti] [master][PATCH] conf: machine: k3: use ARMv8-A as
 base arch
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, oss@ew.tq-group.com
Date: Thu, 16 Jan 2025 15:19:29 +0100
In-Reply-To: <20241209155956.GE23825@denix.org>
References: <20241114140801.1964528-1-matthias.schiffer@ew.tq-group.com>
	 <806ad6edd0e2359aeabb6d4e41795b91b0b2023c.camel@ew.tq-group.com>
	 <20241209155956.GE23825@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Jan 2025 14:19:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18200

On Mon, 2024-12-09 at 10:59 -0500, Denys Dmytriyenko wrote:
>=20
> On Mon, Dec 09, 2024 at 10:38:56AM +0100, Matthias Schiffer via lists.yoc=
toproject.org wrote:
> > On Thu, 2024-11-14 at 15:08 +0100, Matthias Schiffer wrote:
> > > All K3 SoCs are Cortex-A53/A72, so arch-armv8a.inc is a more appropri=
ate
> > > common base than the very generic arch-arm64.inc. arch-armv8a.inc def=
aults
> > > to enable the CRC extension (DEFAULTTUNE =3D "armv8a-crc") and allows=
 for
> > > easy addition of the ARMv8 crypto extensions by setting the tune to
> > > "armv8a-crc-crypto".
> >=20
> > Hi, any comments regarding this patch?
>=20
> Matthias,
>=20
> We've discussed this couple of weeks ago and decided to make a slightly=
=20
> different change that will also enable your use case as well.
>=20
> Ryan got busy lately with master breakage, so I should probably send the=
=20
> change in for discussion.

Hi Denys,

I haven't seen the mentioned change yet, did you not send it or did I overl=
ook
it?

Best,
Matthias



>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

