Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68C87E002AB
	for <meta-ti@yoctoproject.org>; Thu, 29 Nov 2012 14:06:15 -0800 (PST)
Received: by mail-vc0-f176.google.com with SMTP id fl13so18615186vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 29 Nov 2012 14:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EGm12kHbfv7N2ZivoxbzcGUgGX57HmTwLv7/OA1MBlA=;
	b=gtNf3ozxare3QeK7RY6l8M1eAF9YgKJRjBlYpbBdlxrzn7QRLOG1Qf4+6qRu0usH88
	B/YwIHdcxFlnaARjeOJPdbE7k6boKuiknbIOwSR5MLlkYlWFqyeKQPDQ7idO6Y54hGmo
	GYfTwofw3Yr1EOmULDGwH1mKx9+bNuC+ozHWtbCSgZJEYHkmV7ltQFbbmaWabRYtIpxx
	zNNcCH10nvp4jZpnhCt0VmBlsb9o2mS19a5gFLy0J4IttGc2fo8zZwNrAwjdWUpuNCaY
	YD+Q/pdMs5xUlFrGeYhEPa93bBri9RmkO3cp28soqgCTRdHrnUALkES94EkqgFRZVLms
	El/Q==
Received: by 10.52.22.107 with SMTP id c11mr2879332vdf.73.1354226774559; Thu,
	29 Nov 2012 14:06:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.248.74 with HTTP; Thu, 29 Nov 2012 14:05:54 -0800 (PST)
In-Reply-To: <50B778C4.1040507@mlbassoc.com>
References: <50B64752.6080607@mlbassoc.com> <20121128171902.GB7172@edge>
	<50B649FB.30609@mlbassoc.com>
	<CAOT3miJFxSCs7yPRr2xZ-Wc51YFF7KAS_SQMeQoN43rDFDuPqw@mail.gmail.com>
	<20121128173412.GC7172@edge> <50B66CDF.9050405@mlbassoc.com>
	<20121128201702.GA14141@edge> <50B67860.80001@mlbassoc.com>
	<CAOT3miLEyp4iQQ-AudSxo1q+woHLHC0mRsm3UJpadtfDCY+TTw@mail.gmail.com>
	<50B778C4.1040507@mlbassoc.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 29 Nov 2012 23:05:54 +0100
Message-ID: <CAOT3miKYtkF=w+512bPAr=BNabgO39B2oGz4jx2Xw2hqVRxhwQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Nov 2012 22:06:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 29, 2012 at 4:01 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> Any clues on how to test that (I'm not familiar with xrandr)

xrandr should return the list of connected display and the resolution
they support

then to change resolution:
xrandr --output HDMI-1 --mode 800x600  (or any other)

and to rotate:
xrandr --output HDMI-1 --rotate left

you can check man xrandr, e.g.:

 --reflect reflection
Reflection can be one of 'normal' 'x', 'y' or 'xy'. This causes the
output contents to be reflected across the specified axes.
--rotate rotation
Rotation can be one of 'normal', 'left', 'right' or 'inverted'. This
causes the output contents to be rotated in the specified direction.
'right' specifies a clockwise rotation of the picture and 'left'
specifies a counter-clockwise rotation.

there are still some bugs with rotation sometimes... but it should be
mostly working.

>
> Also, with this driver when X blanks the screen (idle/timeout), it
> just goes white, not actually disabled/black like the 'fbdev' driver.
> Is that something I can configure?  This is important because this
> is for a battery based device and I need to be careful with every
> drop of power use...

