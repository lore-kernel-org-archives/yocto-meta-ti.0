Return-Path: <Rainer.Koenig@ts.fujitsu.com>
Received: from dgate20.ts.fujitsu.com (dgate20.ts.fujitsu.com [80.70.172.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D382CE01376
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2011 01:48:46 -0700 (PDT)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1536-bit key; insecure key) header.i=Rainer.Koenig@ts.fujitsu.com;
	x-dkim-adsp=none (insecure policy)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	CC:Subject:References:In-Reply-To:X-Enigmail-Version:
	Content-Type:Content-Transfer-Encoding;
	b=MESU06mxZrRhjddV8+EG+1ux8tFmFpRaxWsr3PyZmRV8tekRGDVu3p0b
	Or7KKGC46ffGtejaHtMukUenOzdNfxGZoZEDQZUTRCcCd1r3lEHA80iW+
	zvOr4qo7FMsaVIUB5EDw81nrwutx+6C1xGzTjG7FszgsrhMxBg2xS5pmw
	7DMa8UiltglmG7kl6Y8nWTEI7DAJ4rvzK2fn9FzEdmtVdtddg0fSTzEV6
	YxHvuygJcZCz1dCpC3cS6kqRHKTk+;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1319446127; x=1350982127;
	h=message-id:date:from:mime-version:to:cc:subject:
	references:in-reply-to:content-transfer-encoding;
	bh=38gAYXVw90/O/zsZUse6bwuhy1BA7QSHbyxA7D22udg=;
	b=Utey10ZY+0ki1PBfuq07L78E38D0YpEgrDdgYZqS9pith2zfR+/pU+in
	2GOgTIwyXNVSal/wZ/mCu/d61UMa10YSeh8l7uwx50Ud6gV3ZNwGwWP71
	0qbgt3OvJilVZc12V5QRNxix2lyZmWLKMt1kQjwqACOSz5sYTITTsURr0
	3BkuLWt+y5RZ7MtYeuM11v1OZ81g1Z1mMptsJXFdXq/kmlmhVE0s9zURW
	JNUUuEIz/55dzVJLTqof/UJLTiVQv;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.69,396,1315173600"; d="scan'208";a="77371939"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 24 Oct 2011 10:48:44 +0200
X-IronPort-AV: E=Sophos;i="4.69,396,1315173600"; d="scan'208";a="122210439"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 24 Oct 2011 10:48:44 +0200
Message-ID: <4EA5266C.4080002@ts.fujitsu.com>
Date: Mon, 24 Oct 2011 10:48:44 +0200
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111004 Icedove/3.0.11
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <4EA1364A.8000605@ts.fujitsu.com>
	<2599D0DD-7A48-409A-95A5-CDA103E7E974@dominion.thruhere.net>
In-Reply-To: <2599D0DD-7A48-409A-95A5-CDA103E7E974@dominion.thruhere.net>
X-Enigmail-Version: 1.0.1
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Building for TI 8148 EVM
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
X-List-Received-Date: Mon, 24 Oct 2011 08:48:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Koen,

Am 21.10.2011 11:14, schrieb Koen Kooi:

>> I'm currently trying to build an image for the TI 8148 EVM board. For
>> that I added the meta-ti layer to the standard Yocto/Edison environment.
> 
> Please follow the instructions detailed in the meta-ti README: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/tree/README
> 
> Yocto/Poky lacks support for various meta-ti (and OE-classic) constructs needed for a successfull build. Following the instructions above you will get a proper setup.

Tried this over the weekend on my home PC. Yes, works. But I was just
able to build a console image. The build of systemd-gnome-image fails
with the error that nothing provides "DRI". MACHINE=dm8148-evm.

Regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html

