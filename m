Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8128BE011DB
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 03:18:00 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so557512vcb.35
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 03:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bxNIxS6kMWM2p72JwfQfPLVCnG/h7WR14Y89UTmnOok=;
	b=dRvYdVsQHzIS4c3hKmFJrngYaIUmo4IUTOLIydA0myc/RP+u192f03i2a3oFk8C5hq
	JW6L/zAVZGu42sfXirKC5SSSNCBN+NBX7cEpwHlk5kzSHDQkI1pRltTpUpszfa4FyqPj
	S9scYzLabiiLUM0xS+JQAUeglBFOD9bmYJhvoRVYwLA78iC8HKySMmeyLZh6CIwp619Q
	oMng7FMab16tpI2Iyq5mVk1PqxoaOM9NQLh0F0STqC4znE1vfS+1czNlOg1pDn/pVD5T
	Z0W7Fnh9ovNM1e3MuD/OHxqRF3soGagDROZiA0TFu9Tw59GhymCUi36UiQ24isT1lNW8
	YUAw==
Received: by 10.220.119.196 with SMTP id a4mr13607975vcr.19.1349864279744;
	Wed, 10 Oct 2012 03:17:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Wed, 10 Oct 2012 03:17:39 -0700 (PDT)
In-Reply-To: <CA+2YH7t+V==z2+Amb=GOeLneT-ZrxtmS10RJBEwn4gLSndOv_w@mail.gmail.com>
References: <CA+2YH7t+V==z2+Amb=GOeLneT-ZrxtmS10RJBEwn4gLSndOv_w@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Wed, 10 Oct 2012 12:17:39 +0200
Message-ID: <CAOT3miL7oXiPiP+ohUHcZnvo=tLhVpiQYDSTgvE+YmXk52e=WA@mail.gmail.com>
To: Enrico <ebutera@users.sourceforge.net>
Cc: meta-ti@yoctoproject.org, rob@ti.com
Subject: Re: gst-ducati...again
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
X-List-Received-Date: Wed, 10 Oct 2012 10:18:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 10, 2012 at 11:23 AM, Enrico <ebutera@users.sourceforge.net> wrote:
> i have a working setup, tested on angstrom master (downloaded ~ a week
> ago) console-only, with gst-ducati h264/mpeg4 encoding working. I
> tested it with videotestsrc (1080p 30fps) and a 1080p webcam (2 fps)
> too with default settings.
>
> I've used the prebuilt ipu firmware from [1] but i noticed that
> sometimes older files can get deleted from there. Before sending
> recipes for review, do someone know if those firmware files can be
> mirrored somewhere or is it a license violation?

yes, on Launchpad PPA, a new package version upload removes the
previous version... it's a feature ;-)

you can mirror them somewhere else, there is no problem (note: I am
one of the admin of the tiomap-dev PPA...), i am sure it's beeing
mirror'd in other places already (like in Linaro PPA for example, and
Linaro releases, ...)

I am quite interested to see your recipes ... we are starting some
yocto/poky recipes as well here...

