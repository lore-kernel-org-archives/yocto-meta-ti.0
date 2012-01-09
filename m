Return-Path: <raj.khem@gmail.com>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C91AEE006E9
	for <meta-ti@yoctoproject.org>; Mon,  9 Jan 2012 08:15:09 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by laam7 with SMTP id m7so2019672laa.35
	for <meta-ti@yoctoproject.org>; Mon, 09 Jan 2012 08:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=v0Or7m4PAvg0CWrkKRvrAgRky0k1DovJ49VfXdxUS/8=;
	b=XAjomKD2mbs/mo11ICce2VGBugTDZWNpJgfK6TS1S/Umo87j6udnmn0qV/o+JDWCet
	Cb3H2G0la2ZWfRGK9BSY4VJXVjy39QIXc5l/hZIYvohngH91mOg0KlsX5h+PN1Na7DnJ
	gRrHHhFkx4hmnrsbyEAFe8fEXxa0b6jRP0Rc8=
Received: by 10.112.24.4 with SMTP id q4mr3594365lbf.80.1326125708284; Mon, 09
	Jan 2012 08:15:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Mon, 9 Jan 2012 08:14:37 -0800 (PST)
In-Reply-To: <84DA4353-76E0-4AB7-9589-49B2BC259A9A@dominion.thruhere.net>
References: <1324486741-23134-1-git-send-email-raj.khem@gmail.com>
	<84DA4353-76E0-4AB7-9589-49B2BC259A9A@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2012 08:14:37 -0800
Message-ID: <CAMKF1sroO0tLEW=DY6QF0u_kyBEEgspF7==0imwD0=Jp+2=RwQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V2] u-boot_2011.09: Always use gnu ld for LD
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
X-List-Received-Date: Mon, 09 Jan 2012 16:15:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 9, 2012 at 1:47 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> I suspect you did this for the beagleboard machine, which isn't using 2011.09 anymore. Do you still want this patch in?

I did it for beagleboard however the patch was done on u-boot git
master. So the patch has to be in u-boot sources
whichever beagle uses.

