Return-Path: <daniel@fooishbar.org>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72819E0032E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 08:12:41 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so4261538vcb.35
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 08:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=giG0R1qFZMZw3rSN53G8164GUzb7VbTRlu8s7pC46m0=;
	b=bqe632pstadHcoEcOCz41aw/lbO3lEfVOFcbtBabEczRuSKWIukOHsln4oC94hQMYW
	Xc3SOOmB3xJoGlw5IcoRZUYC5q1L32bWl0+3GhAYProlz8DHe6VmGDEGpCP78xZw8/C6
	Toc5z0jKmvhidcozmVHZm/yPl0xBxuJ6JpbHDpvWALUbCWkZoqoxZuNl4QG/4lIftQjp
	fC8khpwcg9iKvaZYFoHiC22M0V2D7/aXeqR3z/mgyP+Xz0zyHpeYkJpI0G7eDlFQ2CfO
	4FtscBMG6Mmk7PSBvuDe/R/53233rbFGmp2VzjsjaeuhyfnWb0YlZ4lE0kBrG79y8WO9
	0w/Q==
MIME-Version: 1.0
Received: by 10.220.106.129 with SMTP id x1mr2730635vco.9.1350054758446; Fri,
	12 Oct 2012 08:12:38 -0700 (PDT)
Received: by 10.58.161.231 with HTTP; Fri, 12 Oct 2012 08:12:38 -0700 (PDT)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <5077C897.6000800@r-finger.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
	<CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
	<CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
	<CA+2YH7s0YnPBXb8VRYW7DbjMxH7ed8u+J=q84-qC9ZzC4ULxow@mail.gmail.com>
	<CAOT3miK8prycvqfTNSJXEnTsAtfwxhAk_FaCPX_PACxX0Zu-MQ@mail.gmail.com>
	<5076C554.6060200@mlbassoc.com>
	<CAPj87rMrJ4D6fnY4kw5dBkogzqjDCVPiccGzM3TpWCWkN9FzCg@mail.gmail.com>
	<5076D6CC.5010303@mlbassoc.com>
	<CAOT3mi+Ad=aB_mc11DUmybMvEcySnGUzs6rDke+-mi2ZbBtxrQ@mail.gmail.com>
	<50771DC8.3090903@r-finger.com>
	<CAPj87rM+i=0gEdtKC8XorawO=x5Oth7qHEp5B-JHHe4DPS279Q@mail.gmail.com>
	<5077C897.6000800@r-finger.com>
Date: Sat, 13 Oct 2012 02:12:38 +1100
Message-ID: <CAPj87rMt1xntKSztnyrOn3K7sCa=Jkoz4-KC90FOr4oOkTFQwA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQlkIYRSia3pbBH0Aw2mggEv/WsqEV6Y5BUJ4vnmqDSrqUut1UJT0LvuFYIuRlrfbl6nErgE
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 5/6] gstreamer: bbappend to use TI-patched versions needed for gst-plugin-ducati
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
X-List-Received-Date: Fri, 12 Oct 2012 15:12:41 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 12 October 2012 18:36, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> On 12/10/12 00:00, Daniel Stone wrote:
>> Well, given that all the client and plugin code both needs to be
>> explicitly ported from 0.10 to 1.0, I don't see the problem tbh.
>
> Keep in mind that we are not talking about desktop-like distros aspiring
> to support gazillions of packages of random provenance (because, as you
> well know, Linux is about choice!). We are talking about carefully
> crafted distros for specific HW configurations. IMO it is a poor policy
> to ship a device with two versions of anything on it, it just increases
> QA complexity.

Sure, and if code supports it, then sure.  But right now, in the
transitional phase, most clients don't support 1.0, and a fair few
plugins don't either.  Setting the preferred version to 1.0 would
basically preclude building an image altogether.

I can see the argument for sure, but I think it makes a lot of sense
-- it's no small change, from 0.10.0 seven years ago (!) -- and
there's precedent in, e.g. clutter-1.8.

I'm all for removing 0.10 when it's no longer useful, but that time is
definitely not now.

Cheers,
Daniel

