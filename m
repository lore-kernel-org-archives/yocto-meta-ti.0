Return-Path: <daniel@fooishbar.org>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A67A8E0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 16:00:33 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so3384152vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 16:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=ZAhl/eQ4YeW5gCsWDtFGmETd7BU6QXpEQVE51oEGlfU=;
	b=pVR51VhDvugxMki8LkHo7OSql0RFNSbTxAu/iDF/6UctuV2lw42BC/SWh7Dwtd4hGw
	yZjt1oS+hbH4HngR8scb3NHqN4iFIQmDnewibm+e0IGdl6z8cXnzfwfpYvoA4BShV2JO
	JpsOCOYBNDt6DP/YVCIUPO6VDmCXlwJ93FSKjUUaY+bOhBjlZBjRo6AzSO+2jMwIEAHR
	1aAQ5NuDuoZLR+8eJLDxlk+fdLokvmN12N84MX2YydF80xuQ1IxKZX3asMnULA14Qsqq
	7Zc5/fP/BBnvGtVqiyj5LLmZXK2SxVTHzrv8QABZjgd9dHHbRaIg42fpqeogxgHNt+5N
	ULpg==
MIME-Version: 1.0
Received: by 10.52.69.132 with SMTP id e4mr1179986vdu.2.1349996432397; Thu, 11
	Oct 2012 16:00:32 -0700 (PDT)
Received: by 10.58.161.231 with HTTP; Thu, 11 Oct 2012 16:00:32 -0700 (PDT)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <50771DC8.3090903@r-finger.com>
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
Date: Fri, 12 Oct 2012 10:00:32 +1100
Message-ID: <CAPj87rM+i=0gEdtKC8XorawO=x5Oth7qHEp5B-JHHe4DPS279Q@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQkXTheqmcij7cxNGNP8ZQhe/KuqrshO6oqFHfZsUYc1B8Uz7PDYNfW6R91XqTIZrdrDn3aI
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
X-List-Received-Date: Thu, 11 Oct 2012 23:00:33 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 12 October 2012 06:28, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> On 11/10/12 20:16, Nicolas Dechesne wrote:
>> unfortunately, the provision for that isn't really there, since the
>> gstreamer recipes don't have the 'x.y' in the name. was that discussed
>> anywhere? could we ensure that gst1.0 comes as
>> 'gstreamer1.0_1.0.0.bb'?
>
> I don't think there is anything at all gained by supporting
> simultaneously installing two versions of gstreamer; it makes no real
> sense on distro level. More so adding a version into a package name
> creates a world of pain and dependency hell. Would it not be enough to
> have _0.10 and _1.0 recipes alongside each other, one of which would
> have DEFAULT_PRIORITY=-1; a distro then can choose an appropriate
> version as it wants to?

Well, given that all the client and plugin code both needs to be
explicitly ported from 0.10 to 1.0, I don't see the problem tbh.  And
it is explicitly designed to be parallel-installable out of the box,
so yeah, my recipes allow for that.

I'm only passing through quickly today, but will share them when I get back.

Cheers,
Daniel

