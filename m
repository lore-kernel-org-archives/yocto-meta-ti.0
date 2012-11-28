Return-Path: <ndec13@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99B8DE00294
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 12:50:26 -0800 (PST)
Received: by mail-qc0-f176.google.com with SMTP id n41so11225826qco.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 12:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WuCbe/kWV/ToKb24OKdJ2YXlx/1XXKcO13b+YOPBc/A=;
	b=kzOEQWWThVI0PJTlF8M1+BFZpOojRgEmhYbe2+ZzfcSQWgdF557vaL9kQQlJm60nPm
	K94e5mteOw59vQS+QxhwNOhnJ8LWV9Voz2OrBKbY/QBjVHf6/mf+MlBqX+RkuoPW+yqR
	9cEve5n/sgtuF23CGuqPP9J7+nBOPJsBYXy85aBtlWT3T0+yKxc8ZMG1npskRT8MzK5+
	iyawmk/+Wtdo6q2jSe9Px3hMO1ekDWyr1OAdWcPYH9LNqblwx8vTBFGWV9IljAdwwHrP
	MtyqCxFKwW/P32rivJbwnm230Y9gJJiQ06bOczRf6/d6Gz7lJ8c+RgQfppLutRGljbDG
	BdUA==
Received: by 10.49.12.138 with SMTP id y10mr25482534qeb.64.1354135823666; Wed,
	28 Nov 2012 12:50:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.49.121.161 with HTTP; Wed, 28 Nov 2012 12:50:03 -0800 (PST)
In-Reply-To: <50B67860.80001@mlbassoc.com>
References: <50B64752.6080607@mlbassoc.com> <20121128171902.GB7172@edge>
	<50B649FB.30609@mlbassoc.com>
	<CAOT3miJFxSCs7yPRr2xZ-Wc51YFF7KAS_SQMeQoN43rDFDuPqw@mail.gmail.com>
	<20121128173412.GC7172@edge> <50B66CDF.9050405@mlbassoc.com>
	<20121128201702.GA14141@edge> <50B67860.80001@mlbassoc.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Wed, 28 Nov 2012 21:50:03 +0100
Message-ID: <CAOT3miLEyp4iQQ-AudSxo1q+woHLHC0mRsm3UJpadtfDCY+TTw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Can't build recipes-graphics/xorg-xserver/xf86-video-omap_git.bb
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
X-List-Received-Date: Wed, 28 Nov 2012 20:50:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 28, 2012 at 9:47 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> My bad :-(  I still had the old meta-ti recipe in my tree which got
> in the way...
>
> I've now managed to build this, yet to test it on my OMAP4 board.

nice... with omapdrm+xf86-video-omap, you should be able to play with
xrandr for dynamic display (X11) resize and even rotation..

