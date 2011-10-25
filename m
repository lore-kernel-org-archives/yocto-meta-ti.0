Return-Path: <Rainer.Koenig@ts.fujitsu.com>
Received: from dgate10.ts.fujitsu.com (dgate10.ts.fujitsu.com [80.70.172.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 969EAE0119B
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 05:33:01 -0700 (PDT)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1536-bit key; insecure key) header.i=Rainer.Koenig@ts.fujitsu.com;
	x-dkim-adsp=none (insecure policy)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:X-Enigmail-Version:
	Content-Type:Content-Transfer-Encoding;
	b=T3tqg9KOZvpFr/0PppG5Nzj4MLHVZfBLemkfYJ6SM5BsvJ1PCI00nSGZ
	b+pqBg+X79COaSZAkHyJYjCIpyrH7t0VzRwhA5crscavv63ZK3zJnuJ4Q
	lXVQYHPx0aqN31SJKOiqndlnwM3eeRoFRMZ20sTEgAfd26qc8hAQaX0Kq
	e0WMyy9MFmLcFmzpCKuePU24JVSN8Kt3CATaJrV1/25GHMQtdvVqb+nHr
	m1pFf/SktQCIRLro/oei7Pyxt4DL/;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1319545982; x=1351081982;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=HbBsvpGohU8bxU0WdBSRXg2eB4lOkHCrif+P1AN4ZSg=;
	b=E7CnmEe+ycfTNpYLR7uCobk7ZTKkDQG3U2icxLptpotOqd8LI27yYD4g
	9Oe1oC6ONXSfNUSKGH90sA2Fn9PRNSEX8OZowLqW5fICmqFiJN4rt5Fq6
	KSsTR0S0bJOZbKYg84tO+JBsCsCKICUitZGNtZPkdXTYcsNnF3O61QncN
	XsZHtSFmLeYB9d6G5RT2ZJWblrxeUUuX0L+SXfWs8wRnlI7aOuEtV0xlI
	LG+EU0kbB6B/nJCUSfnnG5Yk+c0Gy;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.69,403,1315173600"; d="scan'208";a="91225114"
Received: from abgdgate30u.abg.fsc.net ([172.25.138.66])
	by dgate10u.abg.fsc.net with ESMTP; 25 Oct 2011 14:32:59 +0200
X-IronPort-AV: E=Sophos;i="4.69,403,1315173600"; d="scan'208";a="121828831"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate30u.abg.fsc.net with ESMTP; 25 Oct 2011 14:32:59 +0200
Message-ID: <4EA6AC7B.90809@ts.fujitsu.com>
Date: Tue, 25 Oct 2011 14:32:59 +0200
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111004 Icedove/3.0.11
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4EA1364A.8000605@ts.fujitsu.com>	<2599D0DD-7A48-409A-95A5-CDA103E7E974@dominion.thruhere.net>	<4EA5266C.4080002@ts.fujitsu.com>	<F51F67A3-60BD-4D93-9D45-25A1ADA36C54@dominion.thruhere.net>	<4EA52A6E.2090904@ts.fujitsu.com>	<A9FC6A94-E05C-4396-807B-A71CC08B9B40@dominion.thruhere.net>
	<20111024183727.GF9156@denix.org>
In-Reply-To: <20111024183727.GF9156@denix.org>
X-Enigmail-Version: 1.0.1
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
X-List-Received-Date: Tue, 25 Oct 2011 12:33:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Am 24.10.2011 20:37, schrieb Denys Dmytriyenko:

>> In the mean time you should be able to get around it by doing 'bitbake 
>> mesa-dri' manually.
> 
> Yep, I can confirm this issue. I had it fixed locally by adding mesa-dri to 
> DEPENDS in xorg-xserver... Didn't have time to submit either a patch or a 
> bugreport though.

Ok, with all the hints from this thread I was able to build an image.
Testing on my DM8148 EVM wasn't that much of a success, image boots to
console, but is lacking of the required (question: what do I need for
this EVM, anyone from TI can tell me?) xorg-modules. /etc/X11/xorg.conf
tries to load an intel driver which is definitely out of range for this
board. :-)

How can I see from the logs what xserver/xorg-components were built and
how can I add the missing ones?

TIA
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

