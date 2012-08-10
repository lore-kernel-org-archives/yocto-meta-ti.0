Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF8E3E013BB
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2012 01:54:53 -0700 (PDT)
Received: by eekd41 with SMTP id d41so390977eek.35
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2012 01:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Hm4LMMU9Pkl3tf1d5xgyn8lfSrMog/IPHseS012iMuk=;
	b=h8Cj+sE+1CwL4cgQLjgWR2t2RHhWnVIlUNBkN92kVjVR9tpXHlpWzxmaCZ7wHdvJ1e
	DGSVfg6lJ/pEujA9Eqv3Q1rdMOPG2rD8Kuhf2BU8wkCbfNhNM2Uk5MuMiGmHXM/fAfw8
	9FsWW+MfxjgqBecAecJwrYCZ6tocXOKx+wabDi4Iih8fcwnVemotzE1HcCMMAz2QS28c
	m5JKMLDJVJ23xY2Hq8WCLGAFpEQfYLVrVnRzQEo2p9AaM8a7ffHwM+nVGm4M6fqfDFue
	0wJBV/sllkVxXzxFjVR8uLY2oB7xgwa4Gw7WjGKkKa+vht+hSzzeP48NrX4rUQMDIaXA
	4h5A==
Received: by 10.14.218.134 with SMTP id k6mr2349630eep.14.1344588892290;
	Fri, 10 Aug 2012 01:54:52 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id g42sm9671777eem.14.2012.08.10.01.54.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 01:54:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4439C3C0562087488F139C696CD862A71321053E@SBS-MEDEC.medecbenelux.local>
Date: Fri, 10 Aug 2012 10:55:04 +0200
Message-Id: <0819C8B7-38BB-4561-A0F7-FB3BA657FE52@dominion.thruhere.net>
References: <4439C3C0562087488F139C696CD862A71321053E@SBS-MEDEC.medecbenelux.local>
To: Tim Verstraete <Tim.Verstraete@medecbenelux.be>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkA8PQobS6YV8HvT38NRBtSQskCSlNXGaZaUq2p589bp22ifbvcJR7cnO1WXswBeWnBX3hf
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti / pandaboard] SGX / powervr drivers
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2012 08:54:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 10 aug. 2012, om 10:34 heeft Tim Verstraete =
<Tim.Verstraete@medecbenelux.be> het volgende geschreven:

> Hi,
> =20
> i am using a pandaboard with meta-ti and i see that in meta-ti we have =
the following:
> =B7        Root/recipes-bsp/powervrdrivers
> o   Omap3-sgx-modules
> o   Omap3 bb file
> =B7        Root/recipes-graphics/
> o   Libgles
> =A7  Libgles-omap3.inc
> =A7  Libgles-omap3
> =A7  Libgles-omap3 recipe
> o   Omapfbplay
> o   Xorgxserver
> =20
> Now I have 2 questions about this =85
> =B7        why would we need 2 locations for this since when I look in =
the recipe they use the same source binary but handle it different, is =
this one recipe for driver and one recipe for opengles library? Why not =
do it in one shot?

Kernel and userspace builds are quite different and in general the =
kernel gets updated more often than the sgx userspace. Instead of =
"rebuilding" the userspace binaries everytime a kernel changes we only =
rebuild the kernel modules.
Even if the kernel never changed, building both kernel modules and =
userspace in the same recipe should never be done.

regards,

Koen=

