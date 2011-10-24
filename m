Return-Path: <Rainer.Koenig@ts.fujitsu.com>
Received: from dgate10.ts.fujitsu.com (dgate10.ts.fujitsu.com [80.70.172.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5498FE0137B
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2011 02:05:51 -0700 (PDT)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1536-bit key; insecure key) header.i=Rainer.Koenig@ts.fujitsu.com;
	x-dkim-adsp=none (insecure policy)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	CC:Subject:References:In-Reply-To:X-Enigmail-Version:
	Content-Type:Content-Transfer-Encoding;
	b=VV0kLQPlAyFAsUIXgp4IHay6ywPTiE02LMl5lw+Wvib7EhszNKIIXwGx
	1LZb3aPkGWHucQyu7eTWyXaeJA3OGcDdJH06uo0M07ekmOkAyvwOXy6OZ
	jpeQtk0nDXoDfPfYcluoahwGCwDr7EZ5LD/An7Lskf5InZO+UtUSokovp
	tktQQr2PkRKa07/H4R9qpRpDr+mlCzUWYB8Ub8IFBQ7vopnwLjkec+uUL
	ffjg0xG9kfFN2n/iLF/TEGdjDKalF;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1319447153; x=1350983153;
	h=message-id:date:from:mime-version:to:cc:subject:
	references:in-reply-to:content-transfer-encoding;
	bh=GEXEvMpFI1aQjMPWlm/7ombU90kkHZsLXYKhxl0Uqdc=;
	b=GxN/2h/hOgNFKyc66c+dunoA3B+S/QQ8Y6NU31VlO4qt1S8bYyux7WS5
	IgFUmmE2KNbEZO1ezgYnj5uxOxShlRbOvjfvhxn3hvXWegwDKrmY+bmg6
	vHshrUoCup/H2F6bTsOuMbi6qqkTcvk4DFb/9h5z7TIcbGIPlKCH4upgD
	VfdiwGunuYARuGXigCNXm0TVT75O1xwVvtGz0e6wvOEDFDDBRHNsW/20L
	HN22oKpuqYco3p3lXudHdV5O7DWVZ;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.69,396,1315173600"; d="scan'208";a="91066462"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate10u.abg.fsc.net with ESMTP; 24 Oct 2011 11:05:51 +0200
X-IronPort-AV: E=Sophos;i="4.69,396,1315173600"; d="scan'208";a="122213336"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 24 Oct 2011 11:05:50 +0200
Message-ID: <4EA52A6E.2090904@ts.fujitsu.com>
Date: Mon, 24 Oct 2011 11:05:50 +0200
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111004 Icedove/3.0.11
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <4EA1364A.8000605@ts.fujitsu.com>
	<2599D0DD-7A48-409A-95A5-CDA103E7E974@dominion.thruhere.net>
	<4EA5266C.4080002@ts.fujitsu.com>
	<F51F67A3-60BD-4D93-9D45-25A1ADA36C54@dominion.thruhere.net>
In-Reply-To: <F51F67A3-60BD-4D93-9D45-25A1ADA36C54@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 24 Oct 2011 09:05:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Koen,
Am 24.10.2011 10:58, schrieb Koen Kooi:
> 
> Op 24 okt. 2011, om 10:48 heeft Rainer Koenig het volgende geschreven:
>>> Please follow the instructions detailed in the meta-ti README: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/tree/README

>> Tried this over the weekend on my home PC. Yes, works. But I was just
>> able to build a console image. The build of systemd-gnome-image fails
>> with the error that nothing provides "DRI". MACHINE=dm8148-evm.
> 
> I'm not seeing that with this set of metadata:

> Could you please share your version of that so we can see if there are fixes missing?

Difficult at the moment because now I'm back to work and the data is at
home. :-) But I will setup this again on my work machine and see that I
get the firewall-issues solved, so I should be able to reproduce my
results.

I was really just following the linked instructions above, maybe I
should have setup something in my local.conf...?

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

