Return-Path: <tom.rini@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 69F1FE00480
	for <meta-ti@yoctoproject.org>; Sat, 23 Feb 2013 19:02:49 -0800 (PST)
Received: by mail-la0-f53.google.com with SMTP id fr10so1690363lab.40
	for <meta-ti@yoctoproject.org>; Sat, 23 Feb 2013 19:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=XGsXZqjgMrrnitBhoVbWYG6Vsnr6I6+5SRlCFMHitXA=;
	b=lR+89kALlT9PdTtj1YQYCwBdUteY1BiYpGRBX3QUjKXC+Th2sLvCgCqkCejjHlHV2Q
	xD+tQjO5j1OcZ4ZzpvuSe+0usNtnHAxeWhT6jjh4ZMc2zB68qGyklqmX1pr3obKfrAQF
	65cPtX+MJhXO1PugJGNr5n2Oh8HOw8zr+UltlTnUDrUkisgVYEzO6tBsjscd8yVjZ8+9
	vtnQCmwuMA3sfSP6iP2ek749c0+7wvEznauDI1P3Huh2nc3XcoEZHDGA/1C7pTlDGdhE
	XJ2WtJQ39p9P6Iggr+X1dw29axxhnsyfa2k/DCZ3giFhSDNVDf2xTQT/NEA7XS+bNMRz
	C/iA==
MIME-Version: 1.0
X-Received: by 10.112.42.162 with SMTP id p2mr2764310lbl.103.1361674967099;
	Sat, 23 Feb 2013 19:02:47 -0800 (PST)
Received: by 10.112.21.4 with HTTP; Sat, 23 Feb 2013 19:02:46 -0800 (PST)
In-Reply-To: <20130224023400.GA6725@denix.org>
References: <alpine.DEB.2.02.1301290502200.12960@oneiric>
	<20130217205130.GB2174@denix.org>
	<CA+M6bXnmJsD2xrwi_CbbuPW4408ph3nbPiyUv6b6F37JOgLdOQ@mail.gmail.com>
	<20130224023400.GA6725@denix.org>
Date: Sat, 23 Feb 2013 22:02:46 -0500
Message-ID: <CA+M6bX=dSr=6yRpHT1j_42KW1NsTJ9A-RoDgD404vpLM8mLFVA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: is there a newer u-boot for omapl138?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Feb 2013 03:02:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 23, 2013 at 9:34 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Sat, Feb 23, 2013 at 08:48:09PM -0500, Tom Rini wrote:
>> On Sun, Feb 17, 2013 at 3:51 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>> > On Tue, Jan 29, 2013 at 05:05:23AM -0500, Robert P. J. Day wrote:
>> >>
>> >>   just got me a pdlogic zoom am1808 experimenter kit:
>> >>
>> >> http://www.logicpd.com/products/system-on-modules/zoom-am1808/
>> >>
>> >> and building for am108x-evm, i notice the version of u-boot that's
>> >> pulled in is really pretty ancient:
>> >>
>> >> SRC_URI_omapl138 = "git://arago-project.org/git/projects/u-boot-omapl1.git;protocol=http"
>> >> SRCREV_pn-${PN}_omapl138  = "5f16b8551b125f16cd8d58f278cb25b94272fd9f"
>> >> PV_omapl138      = "2009.11+${PR}+gitr${SRCREV}"
>> >>
>> >>   is there any obstacle in trying to update the version of u-boot for
>> >> that particular board?
>> >
>> > There is a slightly newer u-boot 2010.12 for omapl138:
>> > http://arago-project.org/git/?p=meta-ti.git;a=commitdiff;h=201b231d721e27ac1d7a88a540b0b2fbbb86ed1e
>> >
>> > But currently there are no immediate plans to update it further for this
>> > platform, unfortunately. If you happen to test and/or patch the latest
>> > mainline u-boot for it, please let us know - I wouldn't mind adding it to
>> > meta-ti as an alternative, even if it's not complete... Thanks.
>>
>> Good news, mainline U-Boot works reasonably well on am1808 (build for
>> da850_am18xxevm) and a few other variations on the platform.
>
> That's great news! Should I wait for the next release tag or would the last
> 2013.02 work already "reasonably well"?

2013.01.01 is fine, as might even be the one prior to that.

-- 
Tom

